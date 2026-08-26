# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. `TODO.md` bærer beslutninger og
resonnement. Merkelappen `kjent-før-test` = bevisst utsatt.

**FRIST: samlingen er 14. september 2026.** Under tre uker. Seks grupper,
deltakernes egne maskiner, satt opp på forhånd av BK (Mac + ARM + x86_64).

**Fase:** tørrkjøringen er avsluttet (fase 0/1/2 verifisert, fase 3 bevisst ikke
kjørt). Siste utgivelse er `faseflyt` **0.5.9** (2026-08-25). **Økten
2026-08-26 ga ingen utgivelse — den målte.**

## Funnet som styrer alt nå

**Målt 2026-08-26 på `VPC-8WD9VC4` (kontor-PC, Snapdragon X Elite, ARM64, VS
Code-utvidelsen) — første måling gjort på ARM i det hele tatt:**
`.claude/settings.json` er **inert**, mens `.claude/settings.local.json` virker.
Samme tilde-form med `**` gir dialog fra den ene fila og går gjennom fra den
andre. **Variabelen er hvilken fil oppføringen står i — ikke formen**, og det
gjelder `Bash` like mye som `Read`. Belegg, fem kall: `logg.md` 2026-08-26.

**Det treffer malen:** `nytt-prosjekt` steg 6 skriver allowlisten til
`.claude/settings.json`. Er den inert hos kollegaene, gir allowlisten ingenting.

**Avkreftet samme dag — ikke gjenopprett:** at oppstartsdialogen skyldtes at det
var øktens første kall. Den lot seg gjenskape midt i økten.
**Utilstrekkelig:** «allowlisten virker ikke i økten den skrives» — fila lå her
ved oppstart og er likevel inert.

## Neste — start her

**1. Omstart som måling, på `VPC-8WD9VC4`.** Start Claude Code på nytt, kjør
`/faseflyt:fase-start`, og se om de tre dialogene kommer tilbake. Kommer de
tilbake: `settings.json` er inert også etter ren oppstart, og malens allowlist
er ødelagt slik den leveres — pakkeendring før samlingen. Er de borte: fila
trengte omstart etter å ha ankommet via `git pull`, og fiksen er én setning i
`nytt-prosjekt` og README. **Ikke grav i Claude Codes tilstandsfiler først** —
omstarten svarer på det praktiske spørsmålet uansett årsak.
*Kontroll som står klar:* `.claude/settings.local.json` er bevisst latt stå med
én oppføring for `web-prototype` i cachen. Den dekker ikke stiene steg 0 leser,
så den kan ikke skygge for dialogene — les `web-prototype`-fila etter omstart
for å se at oppføringer i det hele tatt virker i den nye økten. Fila er
gitignorert og finnes bare på denne maskinen.

**2. Tørrkjør allowlisten i en tom mappe utenfor dette repoet.** Fortsatt umålt,
og henger nå på post 1 — det er allowlisten som måles begge steder.

**3. Mac-pre-flight** (helt urørt, plattformen flest er på). `kollegatest.md`
har alle bokser tomme. Kan ikke gjøres fra denne maskinen.

## Arbeidsmåte neste økt

- **[hold-en-arm-pa-variabelen-du-neytraliserer]** *(ny)* Nøytraliserer du en
  variabel for å isolere andre, blir den samtidig uobserverbar — behold én arm
  som fortsatt tester den, eller mål den først.
- **[sett-brukerinstruksen-rett-for-kallet]** *(ny)* Er brukerens tastetrykk
  selve måleresultatet, står instruksen på egen linje rett før verktøykallet —
  ikke i innledningen, ikke etter en tabell, og bare ett sted.

## Det en ny økt må vite

- **PROMOTERINGSFORSLAG VENTER, niende runde:**
  `[proev-forslaget-mot-prosjektets-egne-laerdommer]` inn i `CLAUDE.md` under
  `## Målinger`, ut av STATUS. **Krever BKs klarsignal — aldri automatisk.**
- **Engangsgodkjenninger brenner målfiler.** Trykker brukeren «Yes» på en fil,
  går den gjennom ut økten uansett form. Velg alltid en urørt fil som mål, og
  si «trykk No» rett før kallet.
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
