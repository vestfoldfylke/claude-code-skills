# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. Merkelappen `kjent-før-test` =
bevisst utsatt av MVP-frysen 2026-08-19.

**TO MASKINER SKRIVER TIL DETTE REPOET.** Kjør `git fetch` og sammenlign med
`origin/main` før du stoler på denne fila.

**Fase:** Fase 6 av planens fase 6–8 er levert og verifisert. `faseflyt` 0.7.1,
`web-prototype` 0.1.4 (commits `fa7f391`, `9742ce6`). Dry-run i det
midlertidige testprosjektet `faseflyt-0.7-test` bekreftet at CLAUDE.md-forbudet
mot å installere nettlesere holder, to ganger; `deny`-settet mot
nettleserinstallasjon er uprøvd med vilje — se `maler.md`.

## Neste — start her

Fase 7 — `fase-slutt`: ærlig ratchet, færre rundturer (se `plan.md`). Modell:
tyngste (instruksdesign).

## Arbeidsmåte neste økt

- **[hypotese-skrevet-som-fakta]** Verifiser påstander om verktøyoppførsel
  (npm/npx, CLI-flagg) før de skrives i pakken — merk som hypotese hvis utestet.
- **[totrinns-vern-krever-ekstern-verifisering]** Et deny-sett med skadelig
  feiltilfelle får ikke eget kontrollkall — verifiser via observert atferd i en
  tørrkjøring, ikke i prosjektet selv.

## Det en ny økt må vite

- **Testprosjekter er midlertidige og lokale** (BK, 2026-09-05): `klengenavn`,
  `faseflyt-0.7-test` m.fl. slettes når ferdig brukt og finnes kun på
  hjemmekontor-maskinen — ikke en varig referanse for andre økter/maskiner.
- **To promoteringsforslag venter fortsatt på BKs klarsignal:**
  `[proev-forslaget-mot-prosjektets-egne-laerdommer]` og
  `[ord-jeg-selv-innfoerer-maa-holdes-mot-tabellen]` — begge inn i `CLAUDE.md`.
- `[nullavvik-krever-samme-kontroll-som-nullsvar]` og `[en-maaling-per-tur]`
  arkivert som aktive, ikke opphevet — ennå uten å bli satt på prøve.
- Norske commit-meldinger lukker ikke issues — `gh issue close` er eget kall.
- Engangsgodkjenninger brenner målfiler — velg alltid en urørt fil som mål.
- Ingen automatisk sjekk finnes. Diffen er eneste port; `sjekk.sh` +
  `claude plugin validate .` kjøres fra Bash ETTER `git add`.
- Pakkeendring = bump BEGGE manifestene + `CHANGELOG.md`. Målinger dateres og
  navngir maskinen — verifisert med `hostname`, ikke antatt.
- Flyttes en regel fra én fil til en annen: grep hele pakken etter forrige
  plassering, ikke bare filene forslaget selv nevner (se `laering.md`).
- `kunnskap/` har også `kollegatest.md`, `testplan.md`, `selvbaerende-test.md`.
- Allowlist-saken er LUKKET. Ikke gjenåpne.
- `/plugin` og `/permissions` kun i terminalen.
- Flerlinjede commit-meldinger: meldingsfil + `git commit -F`.
