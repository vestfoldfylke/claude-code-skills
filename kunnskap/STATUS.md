# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. `TODO.md` bærer bare beslutninger
og resonnement. Merkelappen `kjent-før-test` = bevisst utsatt; alt uten den etter
kollegatesten er nye funn.

**FRIST: samlingen er 14. september 2026.** Seks grupper, deltakernes egne
maskiner, satt opp på forhånd av BK (Mac + ARM + AMD64). Spores ikke her.

**Fase:** pre-test-batchen. **LEVERT 2026-08-24:** fire pusher — `2003cb7`
(README, issue #5 lukket), `ef6e66d` (workflow inert + porten peker på
PATH-formen), `41f0c97` (ingen automatisk port, 1.0 redefinert), `420844a`
(repo-tillatelser). Ingen versjonsbump: ingenting rørte `plugins/`.

**Verifisert:** porten kjørt per commit (renhetssjekk 10 søk · 0 feil · 0
advarsler med positivt kontrollsøk, `claude plugin validate .` ✔). Cache målt
innholdsren mot 0.2.4. `claude` er nå på PATH (`%USERPROFILE%\.local\bin`).
Kjørende = installert = repo = **0.2.4**.

## Neste — start her

1. **Issue #6, `/faseflyt:hjelp`** — ny skill, utløser versjonsbump i BEGGE
   manifestene og fullfører `## 0.3.0`-seksjonen i CHANGELOG. Skal inn FØR BKs
   tørrkjøring, så han tørrkjører versjonen deltakerne får. Ordlyd-forslag først.
2. **Issue #4** (oppdag uavsluttet økt) — samme 0.3.0-batch.
3. **Issue #11 lukkes** med én linje i `fallgruver.md`: selvobservasjon og
   selvkorrigering kan ikke bo i samme artefakt. Besluttet, ordlyd gjenstår.
4. **`TODO.md`-beskjæringen** — inkludert at `fint-samtykke`-posten strykes og at
   «Mac: trenger frivillig maskin» er dekket.
5. **Tørrkjøring av Oppgave 5 (Utstyrsskapet): BK gjør den selv**, i blank økt i
   tom mappe utenfor repoet. Den er eneste dekning av webapp-typen.

## Arbeidsmåte neste økt

- **[proev-forslaget-mot-prosjektets-egne-laerdommer]** *(ny)* Før et forslag
  legges fram: sjekk om repoet alt har navngitt feilen forslaget gjenskaper.
  Pre-push-hooken var «formelt på plass, reelt borte» — navngitt tre steder fra
  før. BK stoppet den, ikke jeg.
- **[retning-til-bruker-detaljer-til-meg]** *(ny)* Spør om retning, avgjør
  implementasjonen selv, fortell hva som ble valgt. To detaljspørsmål om hooken
  kostet mer tillit enn de sparte i risiko.
- **[verifiser-verktoeyet-ikke-bare-utfallet]** *(ny)* Et søk som ikke kan feile
  synlig måler ingenting. Tre feilmålinger samme økt (`grep -c $'\r'`, `ps -p`,
  lenkesjekk uten relativ oppløsning) ble rapportert før de ble avløst.

## Det en ny økt må vite

- **`kunnskap/` har flere filer enn STATUS har nevnt før:** `kollegatest.md`
  (ferdig protokoll, 116 linjer — forutsetningen «testplan 1–3 grønne» er
  oppfylt), `testplan.md`, `selvbaerende-test.md`. Ikke gjenoppdag dem.
- **Webapp-typen er umålt** og dekkes av ingen kollegatestprofil (A = script/API,
  B = dokumentasjon). Bare BKs tørrkjøring dekker den.
- **Ingen automatisk port finnes** — Actions droppet, hardening av, review
  droppet, hook forkastet. Diffen er eneste port, også etter 1.0. **1.0 =** prøvd
  på samlingen, funnene rettet, fraværet dokumentert.
- **Likt for alle** er avgjort: ingen splitt mellom maintainer og kollega.
  Dataregime-spørsmålet ved oppsett er godkjent, men planlagt ETTER samlingen.
- Kjørende skill-versjon står i skill-kallets basekatalog — les den som måledata.
- Renhetsregler: personnavn/maskinnavn OK i `kunnskap/`; `fint` = 0 treff i
  `plugins/faseflyt/`. `/plugin` og `/permissions` kun i terminalen.
- Pakken koster ~668 tokens alltid-på per økt; `nytt-prosjekt` ~6,8k on-invoke.
