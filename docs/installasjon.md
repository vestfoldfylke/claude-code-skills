# Installasjon og vedlikehold — for administrator

Vanlig installasjon for kollegaer står i [README.md](../README.md). Denne siden
dekker det administrative.

## Sentral utrulling via managed settings (valgfritt)

Som org-admin kan du gi alle kollegaer marketplacet uten at de kjører noen
kommando, via managed settings:

```json
{
  "extraKnownMarketplaces": {
    "claude-code-skills": {
      "source": {
        "source": "github",
        "repo": "vestfoldfylke/claude-code-skills"
      }
    }
  },
  "enabledPlugins": {
    "faseflyt@claude-code-skills": true
  }
}
```

`web-prototype` og `fint-graphql` bør IKKE aktiveres sentralt — de er
behovsstyrte og deklareres per prosjekt av `nytt-prosjekt`.

**Sikkerhetsmerknad:** med sentral utrulling (særlig `autoUpdate`) blir alt som
pushes til `main` i praksis arbeidsinstrukser i alle kollegaers Claude-økter.
Skrivetilgang til repoet skal derfor være begrenset til de som vedlikeholder
pakken, og endringer fra andre skal inn via PR.

## Per-prosjekt-deklarasjon (det `nytt-prosjekt` skriver)

Prosjekter satt opp med `nytt-prosjekt` får en `.claude/settings.json` som
deklarerer marketplacet og pluginene prosjektet trenger. Når en kollega kloner
prosjektet og godtar workspace-trust-dialogen, tilbyr Claude Code å installere
dem (dokumentert oppførsel: prompten kommer etter trust-aksept).

## Oppdatere pakken

1. Bump `version` i berørt `plugins/*/.claude-plugin/plugin.json` og
   `marketplace.json` (semver — brytende endringer i `kunnskap/`-strukturen
   markeres i CHANGELOG med migreringsnotat).
2. **Verifiser at de to versjonene stemmer overens:** `claude plugin validate .`
   fra repo-roten. Ved avvik vinner `plugin.json` ved installasjon, og
   `marketplace.json` ignoreres stille — kollegaer ser da feil versjon i
   `/plugin`-listen uten at noe feiler. Steget finnes fordi nettopp dette slapp
   gjennom i 0.2.1.
3. Én linje i `CHANGELOG.md`.
4. Kollegaer henter med `/plugin marketplace update claude-code-skills` — kjørt i
   **terminal-CLI-en**. `/plugin` finnes ikke som slash-kommando i
   VS Code-utvidelsen; den eksponerer enkelte CLI-kommandoer som menyvalg i
   stedet (`/permissions` under «Customize → Permissions»). Si dette i
   utrullingsmeldingen — ellers strander de som bare bruker utvidelsen.

## Renhetskrav (håndheves før hver push)

Kravene har to nivåer. De første gjelder **pakken** — `plugins/`, `docs/` og
`README.md`, altså alt en kollega faktisk får installert. De siste gjelder
`kunnskap/`, som er internt arbeidsarkiv og har løsere krav med hensikt.

**Kravene er automatisert, men porten er manuell.** Denne teksten er
begrunnelsene; den maskinlesbare utgaven er
[`.github/renhet/sjekk.sh`](../.github/renhet/sjekk.sh). Scriptet kjøres av deg
lokalt før hver push:

```
git add -A && bash .github/renhet/sjekk.sh
```

**Ingenting kjører det for deg.** Actions er droppet for repoet (BK 2026-08-24),
workflow-fila er inert, branch-hardening er av og review er droppet. Scriptet og
diffen din er hele porten. Prosa og port holdes i takt ved regel framfor ved
maskin: endrer du et krav her, endres scriptet i samme commit. Se
`kunnskap/plan.md` for beslutningen og hva som skal tas opp ved 1.0.

### Pakken (`plugins/`, `docs/`, `README.md`)

- Den gamle forkortelsen for fylkeskommunen (v-t-f-k) — null treff i **hele
  repoet**, `kunnskap/` inkludert; vi heter Vestfold fylkeskommune.
- **Ingen absolutte brukerstier.** Søk generisk, aldri etter et bestemt
  brukernavn: en regel som leter etter én persons brukernavn går ren for alle
  andre, og «null treff» blir falsk trygghet framfor måling.
- **Ingen hard avhengighet til et repo leseren ikke har tilgang til.** Det er
  funksjonen som er problemet, ikke kontonavnet. En installasjonsinstruks som
  peker på et privat repo gir kollegaen en død peker og en ødelagt oppsett. Å
  *nevne* et privat repo — i historikk, i en begrunnelse — er greit, og
  prototyping under egen konto før flytting til `vestfoldfylke` er en normal
  arbeidsmåte, ikke et regelbrudd.
- Aldri persondata, fødselsnummer, secrets eller interne miljø-URL-er, heller
  ikke i eksempler. Gjelder også `kunnskap/`.
- `fint` — regelen gjelder **`plugins/`, ikke hele repoet**: kun i
  `plugins/fint-graphql/`, med ett unntak: `nytt-prosjekt` må kunne spørre om
  prosjektet bruker FINT for å avgjøre om `fint-graphql` deklareres. Slik
  deklarasjonslogikk i `plugins/faseflyt/` er legitim. Det er FINT-*innhold* —
  entiteter, spørringer, miljø-URL-er — som ikke hører hjemme der. Uten unntaket
  slår regelen ut ved hver eneste kjøring. I `kunnskap/` er `fint-samtykke` en
  legitim referanse til prosjektet arbeidsflyten ble utviklet for — plan og TODO
  viser til det som *prosjekt*, ikke som FINT-innhold.
### `kunnskap/` (internt arbeidsarkiv)

- **Personnavn, maskinnavn og referanser til private repo er tillatt.** Loggen
  skal kunne si hvem som bestemte hva, på hvilken maskin, og hvor noe faktisk ble
  pushet — det er halve poenget med den. Initialer holder der navnet ikke tilfører
  noe, men det er redaksjonell smak, ikke et krav.
- Absolutte brukerstier bør generaliseres til `~/`-form. Begrunnelsen er ikke
  personvern, men at en sti som virker på én maskin er ubrukelig for enhver annen
  leser — også for deg selv på neste maskin.
- Kravet om secrets, persondata og miljø-URL-er gjelder fullt ut også her.

### Binærfiler kan ikke søkes — de skal ikke være tracket

Alle søkene bruker `git grep -I`, som hopper over binærfiler. En tracked
`.docx`/`.xlsx`/`.pdf` går derfor gjennom hele sjekken uinspisert, og «RENHETSSJEKK
OK» kommer til å bety «jeg så ikke etter». Målt 2026-08-19: en 130 KB `.docx` ble
committet og pushet mens sjekken meldte 0 feil — fila var usynlig for hvert enkelt
søk.

Det veier ekstra her fordi repoet er et plugin-marketplace: `/plugin marketplace
add` er en `git clone`, så alt som er tracket havner på disken til hver kollega som
installerer pakken. Arbeidsdokumenter og vurderingsunderlag i `kunnskap/` holdes
derfor lokale — `.gitignore` dekker de vanlige kontorformatene. Skal en binærfil
likevel være med, føres den i `.github/renhet/binaer-unntak.txt` med en linje om
hvorfor innholdet er greit å dele.

### `plugin validate` leser ikke skills — frontmatteren sjekkes separat

`claude plugin validate .` og `claude plugin validate ./plugins/<navn>` leser
begge **bare manifestfila** og åpner aldri en `SKILL.md`. Målt 2026-08-24: begge
former meldte «Validation passed» uten å ha sett en enkelt skill-fil. En skill
med ødelagt frontmatter — manglende `---`, `name` som ikke stemmer med
mappenavnet, ingen `description` — passerer derfor både `validate` og hvert av
søkene over, og lastes så ikke i det hele tatt, eller lastes uten triggerflate.

Sjekken er derfor strukturell framfor et søk: hver
`plugins/*/skills/*/SKILL.md` i indeksen må ha lukket frontmatter, `name` lik
mappenavnet, og en `description`. `name` er det kommandoen heter, og
`description` er hele triggerflaten — en skill uten den blir aldri kalt.

### Måleregelen (gjelder alle søkene over)

- **Et tomt søkeresultat er ingen måling** før verktøyet er bekreftet å ha kjørt.
  Kjør én kontroll som SKAL gi treff (f.eks. `faseflyt`) i samme runde — ellers
  kan «null treff» like gjerne bety at søket aldri traff filene.
  **Kontrollsøket må avgrenses til `plugins/`.** Målt 2026-08-19: et kontrollsøk
  over hele repoet ga 8 treff i et repo som *bare* inneholdt selve sjekkescriptet
  — altså beviste det at `git grep` kjørte, men ikke at søkene nådde pakken. Et
  kontrollsøk som kan tilfredsstilles av sjekkens egen tekst er falsk trygghet.
- **En sjekk som aldri har slått ut, er ikke bevist å kunne slå ut.** Endrer du et
  mønster: legg inn en linje som SKAL gi treff, bekreft at sjekken faktisk feiler
  (exit 1), og fjern linja igjen. Målt 2026-08-19 for alle sju harde krav.
- Kjør søkene **etter `git add`**. `git grep` ser ikke filer som ikke er i
  indeksen, så et søk før staging måler ikke det du er i ferd med å pushe.
- **Skriv mønstre som ikke treffer seg selv.** En regel som staver ut det den
  forbyr, kan aldri gi null. To måter, brukt i dette repoet: skriv strengen
  hyphenert (`v-t-f-k`), eller krev noe *etter* mønsteret som regelteksten selv
  ikke har. For brukerstier:

  ```
  git grep -nE 'C:.Users.[A-Za-z0-9]|/home/[A-Za-z0-9]|/Users/[A-Za-z0-9]'
  ```

  Kravet om et alfanumerisk tegn etter skilletegnet er det som gjør søket
  selvsikkert: linjene over slutter ved skilletegnet eller ved `[`, så de treffer
  ikke. `.` står for skilletegnet for å slippe escape-trøbbel i PowerShell — den
  treffer strengt tatt hvilket som helst tegn, så mønsteret er litt løsere enn
  navnet antyder. Det er med hensikt: for en renhetssjekk er overtreff billig og
  undertreff dyrt.

  Verifiser mønsteret selv, ikke bare kjør det (målt 2026-08-19): det treffer
  `C:\Users\<navn>\…`, `/home/<navn>/…` og `/Users/<navn>/…`, og treffer verken
  de bare prefiksene over eller sin egen regex-literal.

## Valgfritt: reglene alltid aktive i egen `~/.claude/CLAUDE.md`

Skillene er selvbærende, så dette trengs ikke — men den som vil ha fase-rytmen
aktiv i ALLE prosjekter (også de uten `kunnskap/`-struktur) kan legge dette i
sin egen `~/.claude/CLAUDE.md`:

```markdown
## Faseinndelte prosjekter

- Prosjekter kjøres i faser med verifiseringsport: planmodus → plan i
  kunnskap/plan.md → faser → brukeren verifiserer → /faseflyt:fase-slutt → /clear.
- Ny økt starter med /faseflyt:fase-start. Ikke utforsk kodebasen for ting
  STATUS allerede svarer på.
- Utforskning delegeres til Explore-subagent — bare konklusjonen inn i hovedtråden.
- /compact kun midt i en fase som ikke rekker å fullføres.
```
