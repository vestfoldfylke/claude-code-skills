#!/usr/bin/env bash
#
# Renhetssjekk for claude-code-skills.
#
# Kanonisk regelbeskrivelse med begrunnelser: docs/installasjon.md, «Renhetskrav».
# Dette scriptet er den maskinlesbare utgaven av de samme reglene, og kjøres både
# av CI (.github/workflows/renhetssjekk.yml) og lokalt før push:
#
#     git add -A && bash .github/renhet/sjekk.sh
#
# Kjør ETTER `git add`: `git grep` ser ikke filer som ikke er i indeksen, så et
# søk før staging måler ikke det du er i ferd med å pushe.
#
# Måleregelen er innebygd: kontrollsøket — det som SKAL gi treff — kjører FØRST,
# og et søk som
# feiler (ikke «null treff», men faktisk feil — f.eks. ugyldig pathspec)
# rapporteres som feil, ikke som renhet. Et tomt søkeresultat fra et søk som
# aldri kjørte er ikke en måling.
#
# Mønstrene er skrevet så de ikke treffer seg selv (se docs/installasjon.md).
# Endrer du et mønster: verifiser at det fortsatt ikke treffer sin egen literal
# i denne fila, ellers slår regelen ut ved hver kjøring.

set -uo pipefail

PAKKEN=(plugins/ docs/ README.md)
UNNTAK_FINT=".github/renhet/fint-unntak.txt"

feil=0
advarsler=0
kjorte=0

# git grep: 0 = treff, 1 = ingen treff, >1 = søket feilet.
# Skiller de tre, slik at en feilende søk aldri leses som «rent».
sok() {
  local regex="$1"; shift
  local ut rc
  ut=$(git grep -nIiE "$regex" -- "$@" 2>&1)
  rc=$?
  if [ "$rc" -gt 1 ]; then
    printf 'SØKET FEILET (exit %s) — dette er ikke en måling:\n%s\n' "$rc" "$ut" >&2
    return 2
  fi
  printf '%s' "$ut"
  return "$rc"
}

# Hardt krav: treff = feil.
forbudt() {
  local navn="$1" regex="$2"; shift 2
  local ut rc
  ut=$(sok "$regex" "$@"); rc=$?
  kjorte=$((kjorte + 1))
  if [ "$rc" -eq 2 ]; then
    printf '✗ %s — søket kunne ikke kjøres\n' "$navn"
    feil=$((feil + 1))
    return
  fi
  if [ "$rc" -eq 0 ]; then
    printf '✗ %s — %s treff:\n' "$navn" "$(printf '%s\n' "$ut" | wc -l | tr -d ' ')"
    printf '%s\n' "$ut" | sed 's/^/    /'
    feil=$((feil + 1))
    return
  fi
  printf '✓ %s\n' "$navn"
}

# Mykt krav: treff = advarsel, ikke feil. Brukes der docs/installasjon.md sier
# «bør» framfor «skal» — kunnskap/ er arbeidsarkiv, åpent lesbart siden
# 2026-09-07, med løsere krav.
bor_unngaas() {
  local navn="$1" regex="$2"; shift 2
  local ut rc
  ut=$(sok "$regex" "$@"); rc=$?
  kjorte=$((kjorte + 1))
  if [ "$rc" -eq 2 ]; then
    printf '✗ %s — søket kunne ikke kjøres\n' "$navn"
    feil=$((feil + 1))
    return
  fi
  if [ "$rc" -eq 0 ]; then
    printf '! %s — %s treff (advarsel, ikke feil):\n' "$navn" "$(printf '%s\n' "$ut" | wc -l | tr -d ' ')"
    printf '%s\n' "$ut" | sed 's/^/    /'
    advarsler=$((advarsler + 1))
    return
  fi
  printf '✓ %s\n' "$navn"
}

echo "== Kontrollsøk: skal gi treff, ellers måler ingenting under noe =="
# Kontrollsøket er avgrenset til plugins/ med hensikt. Et søk over hele repoet
# ville treffe dette scriptets egen tekst, og da beviser det bare at «git grep»
# kjørte — ikke at søkene nådde PAKKEN, som er det de skal måle.
# Målt 2026-08-19: søket ga 8 treff i et repo som bare inneholdt dette
# scriptet, altså falsk trygghet. Avgrenset til plugins/ kan det ikke det.
kontroll=$(sok 'faseflyt' plugins/); rc=$?
kjorte=$((kjorte + 1))
if [ "$rc" -ne 0 ]; then
  echo "✗ Kontrollsøket ga INGEN treff på «faseflyt» i plugins/."
  echo "  Da måler ingen av søkene under noe som helst — de kjøres ikke."
  echo "  Sjekk at du står i repo-roten, at filene er tracket, og at du kjørte etter «git add»."
  exit 1
fi
printf '✓ Kontrollsøk: %s treff på «faseflyt» i plugins/ — søkene treffer pakken\n\n' \
  "$(printf '%s\n' "$kontroll" | wc -l | tr -d ' ')"

echo "== Hele repoet (gjelder også kunnskap/) =="

# Gammel forkortelse for fylkeskommunen. Mønsteret er klammeformet så denne
# fila ikke treffer seg selv; docs/installasjon.md staver den hyphenert.
forbudt "Gammel forkortelse for fylkeskommunen" 'v[t]fk' .

# Fødselsnummer: 11 sammenhengende sifre.
forbudt "Fødselsnummer (11 sifre)" '(^|[^0-9])[0-9]{11}([^0-9]|$)' .

# Secrets. Krever tilordnet VERDI — bar omtale av «client_secret» er legitim
# instruksjonstekst (fase-slutt beskriver nettopp dette søket).
forbudt "Secrets med tilordnet verdi" \
  'client_secret["'"'"' ]*[:=]+["'"'"' ]*[A-Za-z0-9_/+-]{8,}|BEGIN [A-Z ]*PRIVATE KEY|xox[baprs]-[A-Za-z0-9-]{10,}|ghp_[A-Za-z0-9]{20,}' .

# Interne miljø-URLer. Offentlige dokumentasjons-URLer er tillatt; det er
# interne miljøer og organisasjonsinterne verter som ikke skal ut.
forbudt "Interne miljø-URLer" \
  'https?://[a-z0-9.-]*(vestfoldfylke|\.local|\.internal|\.intern)[a-z0-9./_-]*' .

# Maskinnavn. Organisasjonens hostnavnmønster skal ikke finnes noe sted — repoet
# er åpent (2026-09-07), og målinger navngir maskinen med alias fra tabellen i
# kunnskap/lokalt/ (gitignorert), aldri hostname. Forankret så tegnet foran
# ikke er en bokstav: søket er case-uavhengig, og uten forankring traff det
# inne i prosjektnavnet «ElevPC-fakturagrunnlag» (målt 2026-09-07). Mønsteret
# treffer ikke seg selv: tegnet etter bindestreken i denne fila er «[».
forbudt "Maskinnavn (organisasjonens hostnavnmønster)" '(^|[^A-Za-z])VPC-[A-Z0-9]{6,}' .

echo
echo "== Pakken (plugins/, docs/, README.md) =="

# Absolutte brukerstier. Søket er generisk med hensikt: en regel som leter etter
# ett bestemt brukernavn måler én maskin og går ren for alle andre.
forbudt "Absolutte brukerstier i pakken" \
  'C:.Users.[A-Za-z0-9]|/home/[A-Za-z0-9]|/Users/[A-Za-z0-9]' "${PAKKEN[@]}"

# FINT-innhold i faseflyt. Entiteter, domene og prosjektnavn — det som gjør
# arbeidsflyt-pluginen FINT-avhengig.
forbudt "FINT-innhold utenfor fint-graphql" \
  'felleskomponent|informasjonsmodell|elevforhold|personalressurs|arbeidsforhold|basisgruppe|undervisningsgruppe|skoleressurs|fint-samtykke' \
  plugins/ ':!plugins/fint-graphql/'

# Bar «fint»-omtale i plugins/ utenfor fint-graphql. Docs unntar eksplisitt
# deklarasjonslogikken: nytt-prosjekt MÅ kunne spørre om prosjektet bruker FINT
# for å avgjøre om fint-graphql deklareres. Uten unntaket slår regelen ut ved
# hver kjøring. Unntaket er en eksplisitt liste framfor et løsere mønster, slik
# at hver NY FINT-omtale i faseflyt får et menneskeblikk.
echo
echo "== FINT-omtale i plugins/ utenfor fint-graphql (mot unntaksliste) =="
kjorte=$((kjorte + 1))
fint_ut=$(sok 'fint' plugins/ ':!plugins/fint-graphql/'); fint_rc=$?
if [ "$fint_rc" -eq 2 ]; then
  echo "✗ FINT-omtale — søket kunne ikke kjøres"
  feil=$((feil + 1))
elif [ "$fint_rc" -eq 1 ]; then
  echo "✓ FINT-omtale: ingen treff"
else
  # Normaliser til «sti|trimmet linje» — linjenummer-uavhengig, så unntakene
  # ikke råtner når filene endres andre steder.
  normalisert=$(printf '%s\n' "$fint_ut" \
    | sed -E 's/^([^:]+):[0-9]+:[[:space:]]*/\1|/' \
    | grep -viE 'fint-graphql')
  if [ -z "$normalisert" ]; then
    echo "✓ FINT-omtale: alle treff er fint-graphql-deklarasjon"
  else
    if [ ! -f "$UNNTAK_FINT" ]; then
      echo "✗ Unntakslisten $UNNTAK_FINT finnes ikke, men det er treff å vurdere."
      feil=$((feil + 1))
    else
      tillatt=$(grep -vE '^[[:space:]]*(#|$)' "$UNNTAK_FINT")
      ukjent=$(printf '%s\n' "$normalisert" | grep -vxF "$tillatt")
      if [ -z "$ukjent" ]; then
        printf '✓ FINT-omtale: %s treff, alle i unntakslisten\n' \
          "$(printf '%s\n' "$normalisert" | wc -l | tr -d ' ')"
      else
        echo "✗ FINT-omtale utenfor unntakslisten:"
        printf '%s\n' "$ukjent" | sed 's/^/    /'
        echo
        echo "  To legitime utfall:"
        echo "  1) Linjen er omformulert deklarasjonslogikk — oppdater $UNNTAK_FINT."
        echo "  2) Det er reelt FINT-innhold — det hører i plugins/fint-graphql/, ikke her."
        feil=$((feil + 1))
      fi
    fi
  fi
fi

echo
echo "== Tracked binærfiler (søkene over kan ikke lese dem) =="
# Hvorfor dette er et hardt krav: alle søkene over bruker «git grep -I», som
# hopper over binærfiler. En tracked .docx/.xlsx/.pdf går derfor gjennom hele
# sjekken uinspisert, og «RENHETSSJEKK OK» kommer til å bety «jeg så ikke etter».
# Målt 2026-08-19: en 130 KB .docx ble committet og pushet mens sjekken meldte
# 9 søk / 0 feil — fila var usynlig for hvert enkelt av dem.
# Det gjelder dobbelt her fordi repoet er et plugin-marketplace: «/plugin
# marketplace add» er en git clone, så alt tracket havner på disken til hver
# kollega som installerer pakken.
# Metode: «git grep -Il ''» lister filene git regner som tekst; differansen mot
# «git ls-files» er binærfilene. Tomme filer matcher ingenting og filtreres bort
# eksplisitt, ellers ville de gitt falske treff.
kjorte=$((kjorte + 1))
UNNTAK_BINAER=".github/renhet/binaer-unntak.txt"
tekstfiler=$(git grep -Il '' -- . 2>/dev/null | sort)
if [ -z "$tekstfiler" ]; then
  echo "✗ Fant ingen tekstfiler i det hele tatt — søket kunne ikke kjøres."
  feil=$((feil + 1))
else
  binaere=$(comm -23 <(git ls-files | sort) <(printf '%s\n' "$tekstfiler"))
  ukjente=""
  while IFS= read -r f; do
    [ -z "$f" ] && continue
    # Tom fil er ikke binær — den matcher bare ingenting.
    if [ -f "$f" ] && [ ! -s "$f" ]; then continue; fi
    if [ -f "$UNNTAK_BINAER" ] && grep -qxF "$f" "$UNNTAK_BINAER"; then continue; fi
    ukjente="${ukjente}${f}
"
  done <<EOF
$binaere
EOF
  if [ -z "$ukjente" ]; then
    echo "✓ Ingen tracked binærfiler utenfor unntakslisten"
  else
    echo "✗ Tracked binærfiler som ingen av søkene over har lest:"
    printf '%s' "$ukjente" | sed 's/^/    /'
    echo "  Enten hører fila ikke i repoet (untrack den: git rm --cached <fil>,"
    echo "  og legg mønsteret i .gitignore), eller den skal være der og føres i"
    echo "  $UNNTAK_BINAER — med en linje om hvorfor innholdet er greit å dele."
    feil=$((feil + 1))
  fi
fi

echo
echo "== Skill-frontmatter (plugin validate leser BARE manifester) =="
# Hvorfor dette er et hardt krav: «claude plugin validate .» og
# «claude plugin validate ./plugins/<navn>» leser begge BARE manifestfila og
# åpner aldri SKILL.md. Målt 2026-08-24: begge former meldte «Validation passed»
# uten å ha sett en enkelt skill-fil. En skill med ødelagt frontmatter —
# manglende delimiter, «name» som ikke stemmer med mappenavnet, ingen
# «description» — passerer derfor både validate og hvert av søkene over, og
# lastes så ikke i det hele tatt, eller lastes uten triggerflate. Da ville
# «RENHETSSJEKK OK» betydd «jeg så ikke etter».
# Metode: git ls-files framfor find — sjekken skal måle det som ligger i
# indeksen, som resten av scriptet.
kjorte=$((kjorte + 1))
skillfiler=$(git ls-files 'plugins/*/skills/*/SKILL.md' | sort)
if [ -z "$skillfiler" ]; then
  echo "✗ Fant ingen SKILL.md i plugins/*/skills/ — søket kunne ikke kjøres."
  feil=$((feil + 1))
else
  fm_feil=""
  while IFS= read -r f; do
    [ -z "$f" ] && continue
    mappe=$(basename "$(dirname "$f")")
    if [ "$(head -1 "$f")" != "---" ]; then
      fm_feil="${fm_feil}${f}: første linje er ikke «---»
"
      continue
    fi
    if [ "$(grep -c '^---$' "$f")" -lt 2 ]; then
      fm_feil="${fm_feil}${f}: frontmatteren er ikke lukket med «---»
"
      continue
    fi
    fm=$(sed -n '2,/^---$/p' "$f")
    navn=$(printf '%s\n' "$fm" | sed -n 's/^name:[[:space:]]*//p' | head -1)
    if [ "$navn" != "$mappe" ]; then
      fm_feil="${fm_feil}${f}: «name: ${navn:-<mangler>}» stemmer ikke med mappenavnet «$mappe»
"
    fi
    if ! printf '%s\n' "$fm" | grep -q '^description:'; then
      fm_feil="${fm_feil}${f}: mangler «description» — skillen har ingen triggerflate
"
    fi
  done <<EOF
$skillfiler
EOF
  if [ -z "$fm_feil" ]; then
    printf '✓ Skill-frontmatter: %s skills med lukket frontmatter, «name» = mappenavn og «description»\n' \
      "$(printf '%s\n' "$skillfiler" | wc -l | tr -d ' ')"
  else
    echo "✗ Skill-frontmatter:"
    printf '%s' "$fm_feil" | sed 's/^/    /'
    echo "  En skill med ødelagt frontmatter lastes ikke, eller lastes uten trigger."
    echo "  «claude plugin validate» ser dette IKKE — den leser bare manifester."
    feil=$((feil + 1))
  fi
fi

echo
echo "== kunnskap/ (arbeidsarkiv, åpent lesbart siden 2026-09-07 — «bør», ikke «skal») =="

# docs/installasjon.md: absolutte brukerstier BØR generaliseres til ~/-form her.
# Begrunnelsen er lesbarhet på andre maskiner, ikke personvern — derfor advarsel.
bor_unngaas "Absolutte brukerstier i kunnskap/" \
  'C:.Users.[A-Za-z0-9]|/home/[A-Za-z0-9]|/Users/[A-Za-z0-9]' kunnskap/

echo
echo "======================================================"
printf '%s søk kjørt · %s feil · %s advarsler\n' "$kjorte" "$feil" "$advarsler"
if [ "$feil" -gt 0 ]; then
  echo "RENHETSSJEKK FEILET — ikke push før treffene over er behandlet."
  echo "Regler og begrunnelser: docs/installasjon.md, «Renhetskrav»."
  exit 1
fi
echo "RENHETSSJEKK OK."
exit 0
