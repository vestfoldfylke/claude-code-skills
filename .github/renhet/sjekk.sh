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
# Måleregelen er innebygd: den positive kontrollen kjører FØRST, og et søk som
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
# «bør» framfor «skal» — kunnskap/ er internt arbeidsarkiv med løsere krav.
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

echo "== Positiv kontroll (måleregelen: bekreft at verktøyet kjørte) =="
# Kontrollen er avgrenset til plugins/ med hensikt. Et søk over hele repoet
# ville treffe dette scriptets egen tekst, og da beviser kontrollen bare at
# «git grep» kjørte — ikke at søkene nådde PAKKEN, som er det de skal måle.
# Målt 2026-08-19: kontrollen ga 8 treff i et repo som bare inneholdt dette
# scriptet, altså falsk trygghet. Avgrenset til plugins/ kan den ikke det.
kontroll=$(sok 'faseflyt' plugins/); rc=$?
kjorte=$((kjorte + 1))
if [ "$rc" -ne 0 ]; then
  echo "✗ Positiv kontroll ga INGEN treff på «faseflyt» i plugins/."
  echo "  Da måler ingen av søkene under noe som helst — de kjøres ikke."
  echo "  Sjekk at du står i repo-roten, at filene er tracket, og at du kjørte etter «git add»."
  exit 1
fi
printf '✓ Positiv kontroll: %s treff på «faseflyt» i plugins/ — søkene treffer pakken\n\n' \
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
echo "== kunnskap/ (internt arbeidsarkiv — «bør», ikke «skal») =="

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
