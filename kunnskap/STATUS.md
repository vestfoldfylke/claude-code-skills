# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. `TODO.md` bærer bare beslutninger
og resonnement. Merkelappen `kjent-før-test` = bevisst utsatt; alt uten den etter
kollegatesten er nye funn.

**FRIST: samlingen er 14. september 2026.** Tre uker. Seks grupper, deltakernes
egne maskiner, satt opp på forhånd av BK (Mac + ARM + AMD64).

**Fase:** pre-test-batchen, nesten i mål. **LEVERT 2026-08-24 (kveld):** fire
commits pushet — `ffc43d4` (ny skill `/faseflyt:hjelp`, issue #6), `967d5d3`
(`fase-start` steg 2 oppdager uavsluttet økt, issue #4), `8eda2c3` (renhetsporten
sjekker skill-frontmatter), `5f0f1aa` (`fase-slutt` steg 4 fortetter avklarte
TODO-poster). **`faseflyt` står på 0.4.0.** Issues #6 og #4 lukket.

**Verifisert på hjemme-PC `VPC-5CG3433WMH` (AMD64):** porten kjørt per commit
(renhetssjekk 11 søk · 0 feil · 0 advarsler med positivt kontrollsøk, `claude
plugin validate .` ✔). Kjørende = installert = repo = **0.4.0**, commit
`5f0f1aa`. Cache mot repo: 11 filer, 0 avvik (linjeskift normalisert, positiv
kontroll mot 0.2.4 fant avvik). `/faseflyt:hjelp` bekreftet lastet i skill-listen
etter `marketplace update` + omstart.

## Neste — start her

1. **Issue #11** — én linje i `fallgruver.md`: selvobservasjon og selvkorrigering
   kan ikke bo i samme artefakt. Besluttet, bare ordlyd gjenstår. Billig, og bør
   gjøres FØR tørrkjøringen så du tørrkjører en pakke du ikke skal endre etterpå.
2. **Tørrkjøring av Oppgave 5 (Utstyrsskapet): BK gjør den selv**, i blank økt i
   tom mappe utenfor repoet. Eneste dekning av webapp-typen.
3. **`TODO.md`-beskjæringen** — har nå et verktøy i `fase-slutt` steg 4, men
   ingen post ble fortettet denne økten (se under).

## Arbeidsmåte neste økt

- **[maskinen-og-miljoeet-maales-som-alt-annet]** *(ny)* Maskin, arkitektur og
  miljø er måledata — de utledes ikke. Jeg skrev «kontor-PC (Snapdragon/ARM)» i
  loggen og i to nå-pushede commit-meldinger; `hostname` + `uname -m` viste
  hjemme-PC/AMD64. BK stoppet det. Årsaken var at feil maskin gjorde historien
  hel.
- **[egen-ordlyd-fortjener-samme-blikk-som-diffen]** *(ny)* Godkjent ordlyd er
  ikke verifisert ordlyd. README-raden «glemt hvordan det gikk» sto i et godkjent
  forslag og ble committet før den ble lest på nytt.
- **[soek-bredt-foer-du-melder-null]** *(ny)* Et søk avgrenset for lesbarhet
  måler smalere enn det påstår. Det smale stegsøket ga null og var heldig; det
  brede fant `maler.md`.

## Det en ny økt må vite

- **Cache-posten i `TODO.md` er IKKE lukket.** Målingen denne økten var på
  hjemme-PC-en — samme maskin som 2026-08-20. Posten ber om kontor-PC-en
  (Snapdragon/ARM), og **ARM-leddet er fortsatt helt umålt.**
- **To pushede commit-meldinger (`967d5d3`, `8eda2c3`) navngir feil maskin** —
  de sier «kontor-PC-en». Historikken er ikke omskrevet; korreksjonen står i
  loggen 2026-08-24 (kveld).
- **`claude plugin validate` leser BARE manifester** — den åpner aldri
  `SKILL.md`. Derfor det ellevte søket i `.github/renhet/sjekk.sh`.
- `kunnskap/` har flere filer enn STATUS nevner: `kollegatest.md` (ferdig
  protokoll), `testplan.md`, `selvbaerende-test.md`. Ikke gjenoppdag dem.
- **Ingen automatisk port finnes** — Actions droppet, hardening av, review
  droppet, hook forkastet. Diffen er eneste port, også etter 1.0. **1.0 =** prøvd
  på samlingen, funnene rettet, fraværet dokumentert.
- **Webapp-typen er umålt** og dekkes av ingen kollegatestprofil. Bare BKs
  tørrkjøring dekker den.
- **Likt for alle** er avgjort: ingen splitt mellom maintainer og kollega.
  Dataregime-spørsmålet er godkjent, men planlagt ETTER samlingen.
- Renhetsregler: personnavn/maskinnavn OK i `kunnskap/`; `fint` = 0 treff i
  `plugins/faseflyt/`. `/plugin` og `/permissions` kun i terminalen.
- Kjørende skill-versjon står i skill-kallets basekatalog — les den som måledata.
