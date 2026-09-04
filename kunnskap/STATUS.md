# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. Merkelappen `kjent-før-test` =
bevisst utsatt av MVP-frysen 2026-08-19.

**TO MASKINER SKRIVER TIL DETTE REPOET.** Kjør `git fetch` og sammenlign med
`origin/main` før du stoler på denne fila.

**Fase:** `faseflyt` **0.6.1** pushet 2026-09-04 fra `VPC-5CG3433WMH`
(hjemmekontor) — funn fra første fulle tørrkjøring av 0.6.0 (`klengenavn`,
webapp-scratch). **Begge maskinene må kjøre
`/plugin marketplace update claude-code-skills` + omstart** før 0.6.1 virker
der.

## Neste — start her

1. **`web-prototype` pakkesak** (egen plugin, egen versjon): `sv create`
   overskriver `.gitignore` i ikke-tom mappe (nytt, `klengenavn` 2026-09-04);
   `svelte.config.js`-avviket fra 2026-08-30 bekreftet på nytt. Se logg
   2026-08-30 og 2026-09-04.
2. **Fortsett tørrkjøringen** i `klengenavn`: fase 1–4. Se særlig om
   plan-malen bør si at Claude ikke skal forsøke brukerens verifisering selv
   (observert i fase 0, første runde i prosjektets egen læringslogg der), og
   om `limit` på `Read` av `logg.md`/`laering.md` faktisk brukes (umålt så langt).
3. **Mac-pre-flight** — fortsatt viktigste umålte post, urørt.
4. **Umålt:** at `/model sonnet` (0.6.1) virker på alle kollegaers oppsett.

## Arbeidsmåte neste økt

*(tom — alle tre punkter fra forrige runde ble fulgt og strøket, se `laering.md`)*

## Det en ny økt må vite

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
