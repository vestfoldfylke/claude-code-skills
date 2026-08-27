# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. `TODO.md` bærer beslutninger og
resonnement. Merkelappen `kjent-før-test` = bevisst utsatt.

**FRIST: samlingen er 14. september 2026.** Under tre uker. Seks grupper,
deltakernes egne maskiner, satt opp på forhånd av BK (Mac + ARM + x86_64).

**Fase:** tørrkjøringen er avsluttet (fase 0/1/2 verifisert, fase 3 bevisst ikke
kjørt). Siste utgivelse er `faseflyt` **0.5.9** (2026-08-25). **Øktene 26. og
27. august ga ingen utgivelse — de målte.**

## Funnet som styrer alt nå

**Målt 2026-08-27 på `VPC-8WD9VC4` (kontor-PC, Snapdragon X Elite, ARM64, VS
Code-utvidelsen). Belegg: `logg.md` 2026-08-27.**

**Den brede `**`-formen er frikjent.** Tre `Read`-kall gikk gjennom uten dialog,
og det avgjørende var `cache/…/fint-graphql/0.1.0/…` — urørt i økten, uten egen
spesifikk linje, dekket kun av den brede formen. Det avliver både forklaringen om
at gårsdagens Yes-godkjenninger bar kallene, og hypotesen om at formen var
problemet.

**Men spørsmålet står fortsatt åpent**, fordi den brede formen lå i *begge*
filene samtidig. «Ingen dialog» har to årsaker som ikke lar seg skille:
`settings.local.json` gjør jobben og `settings.json` er inert — eller
`settings.json` virker, og det som manglet 2026-08-26 var en omstart.

**Rettet, ikke gjenopprett:** at omstarten «nøytraliserer hypotesen om at en
oppføring ikke virker i økten den skrives». Den fletter de to hypotesene sammen i
stedet. **Umålt, og skal stå som umålt:** om Claude Code faktisk ble startet på
nytt før økten 2026-08-27.

Det treffer malen uansett hvilken forklaring som holder — `nytt-prosjekt` steg 6
skriver allowlisten til `.claude/settings.json` — men fiksen er svært ulik: en
annen fil, eller bare en linje i README om at nye oppføringer krever omstart.

## Neste — start her

**1. Ett kall, og bare ett.** Rekkefølgen er hele poenget:

1. Ta de to brede linjene ut av `.claude/settings.local.json`, så bare den
   spesifikke `web-prototype`-linja står igjen.
2. Lukk og start Claude Code på nytt.
3. Les `~/.claude/plugins/marketplaces/claude-code-skills/plugins/web-prototype/.claude-plugin/plugin.json`
   — urørt i alle måleøktene, og dekket kun av marketplaces-linja i
   `.claude/settings.json`. Ingenting annet i samme tur; si «trykk No» rett før.

**Dialog** = `settings.json` er inert for `Read`; pakkefiksen er å skrive
Read-linjene et annet sted enn `.claude/settings.json`. **Ingen dialog** =
`settings.json` virker, omstart var det som manglet, malen står, og README må si
at en ny oppføring krever omstart.

*`STATUS.md` og `logg.md` er committet 2026-08-27 — ingenting står ucommittet med
vilje nå.* `settings.local.json` er gitignorert, finnes bare på denne maskinen, og
sto ved øktslutt med tre linjer.

**2. Tørrkjør allowlisten i en tom mappe utenfor dette repoet.** Fortsatt umålt,
og henger på post 1 — det er allowlisten som måles begge steder.

**3. Mac-pre-flight** (helt urørt, plattformen flest er på). `kollegatest.md`
har alle bokser tomme. Kan ikke gjøres fra denne maskinen.

## Arbeidsmåte neste økt

- **[en-maaling-per-tur]** *(ny)* En måletur inneholder instruksen og kallet —
  ingenting annet. Oppsett, filskriving og begrunnelse hører i turen før, og
  brukeren får si fra når det er klart.
- **[nullresultat-maa-ha-en-entydig-aarsak]** *(ny)* Før riggen kjøres: skriv ned
  hva hvert mulige utfall kan tilskrives. Har «ingen dialog» to årsaker, er det
  ingen måling — fjern en arm først.
- **[sett-brukerinstruksen-rett-for-kallet]** *(videreført, utilstrekkelig alene)*
  Instruksen står på egen linje rett før kallet — men plassering hjelper ikke hvis
  turen også bærer annet arbeid.

## Det en ny økt må vite

- **PROMOTERINGSFORSLAG VENTER, tiende runde:**
  `[proev-forslaget-mot-prosjektets-egne-laerdommer]` inn i `CLAUDE.md` under
  `## Målinger`, ut av STATUS. **Krever BKs klarsignal — aldri automatisk.**
- **Engangsgodkjenninger brenner målfiler.** Trykker brukeren «Yes», går fila
  gjennom ut økten uansett form. Velg alltid en urørt fil som mål, og si «trykk
  No» rett før kallet. Godkjenninger gjelder én økt — etter omstart er alle
  målemål friske igjen, også `hjelp/SKILL.md`, som ble brent 2026-08-27.
- **Ingen automatisk sjekk finnes.** Diffen er eneste port. Renhetssjekken kjøres
  fra Bash ETTER `git add`, alltid med ett kontrollsøk som skal gi treff, og
  `claude plugin validate .` ved siden av.
- **Beskrevet omfang er avtalt omfang:** ingen pakke-/mal-/dokumentfil endres
  uten ordlyd-forslag og klarsignal. Pakkeendring = bump BEGGE manifestene +
  `CHANGELOG.md`. Målinger dateres og navngir maskinen.
- **Én person kan ikke fullføre en faseslutt i et nytt `vestfoldfylke`-repo** —
  org-regelsamling `9211483`. Vårt eget repo er fritatt (2026-08-19).
- `kunnskap/` har også `kollegatest.md`, `testplan.md`, `selvbaerende-test.md`.
- `/plugin` og `/permissions` kun i terminalen — ikke i VS Code-utvidelsen.
- Flerlinjede commit-meldinger: meldingsfil + `git commit -F`.
