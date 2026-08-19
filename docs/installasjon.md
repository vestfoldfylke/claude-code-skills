# Installasjon og vedlikehold — for administrator

Vanlig installasjon for kollegaer står i [README.md](../README.md). Denne siden
dekker det administrative.

## Kanalene

| Kanal | Når | Hva |
|---|---|---|
| Plugin (dette repoet) | Claude Code (CLI/VS Code) | Alle tre plugins |
| Org-katalogen på claude.ai | claude.ai / Desktop-chat | Kun `grill-me`, `fint-graphql`, `web-prototype` |

Faseflyt-trioen (`nytt-prosjekt`/`fase-start`/`fase-slutt`) skal **ikke** i
org-katalogen — den krever filsystem, git og planmodus, som chat-flatene ikke
har. En kollega som møter dem der først, opplever en pakke som ikke virker.

## Org-katalogen (claude.ai admin-konsollet)

Last opp hver skill-mappe for seg (mappen som inneholder `SKILL.md`):

- `plugins/faseflyt/skills/grill-me/`
- `plugins/fint-graphql/skills/fint-graphql/`
- `plugins/web-prototype/skills/web-prototype/` — **dette repoet er master**
  for web-prototype: konsollversjonen oppdateres FRA repoet ved endringer,
  aldri motsatt.

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

Prosjekter scaffoldet med `nytt-prosjekt` får en `.claude/settings.json` som
deklarerer marketplacet og pluginene prosjektet trenger. Når en kollega kloner
prosjektet og godtar workspace-trust-dialogen, tilbyr Claude Code å installere
dem (dokumentert oppførsel: prompten kommer etter trust-aksept). Krever
GitHub-tilgang til dette repoet.

## Oppdatere pakken

1. Gjør endringen på en branch, PR til `main`.
2. Bump `version` i berørt `plugins/*/.claude-plugin/plugin.json` og
   `marketplace.json` (semver — brytende endringer i `kunnskap/`-strukturen
   markeres i CHANGELOG med migreringsnotat).
3. **Verifiser at de to versjonene stemmer overens:** `claude plugin validate .`
   fra repo-roten. Ved avvik vinner `plugin.json` ved installasjon, og
   `marketplace.json` ignoreres stille — kollegaer ser da feil versjon i
   `/plugin`-listen uten at noe feiler. Steget finnes fordi nettopp dette slapp
   gjennom i 0.2.1.
4. Én linje i `CHANGELOG.md`.
5. Endret `web-prototype`, `grill-me` eller `fint-graphql`: oppdater også
   org-katalogen (last opp på nytt).
6. Kollegaer henter med `/plugin marketplace update claude-code-skills` — kjørt i
   **terminal-CLI-en**. `/plugin` finnes ikke som slash-kommando i
   VS Code-utvidelsen; den eksponerer enkelte CLI-kommandoer som menyvalg i
   stedet (`/permissions` under «Customize → Permissions»). Si dette i
   utrullingsmeldingen — ellers strander de som bare bruker utvidelsen.

## Renhetskrav (håndheves før hver push)

Kravene har to nivåer. De første gjelder **pakken** — `plugins/`, `docs/` og
`README.md`, altså alt en kollega faktisk får installert. De siste gjelder
`kunnskap/`, som er internt arbeidsarkiv og har løsere krav med hensikt.

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

### Måleregelen (gjelder alle søkene over)

- **Et tomt søkeresultat er ingen måling** før verktøyet er bekreftet å ha kjørt.
  Kjør én kontroll som SKAL gi treff (f.eks. `faseflyt`) i samme runde — ellers
  kan «null treff» like gjerne bety at søket aldri traff filene.
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
