# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. Merkelappen `kjent-før-test` =
bevisst utsatt av MVP-frysen 2026-08-19.

**TO MASKINER SKRIVER TIL DETTE REPOET.** Kjør `git fetch` og sammenlign med
`origin/main` før du stoler på denne fila.

**Fase:** Fase 7 av planens fase 6–8 er levert og verifisert. `faseflyt` 0.8.2
(commits `865c5cb`, `36735fb`, `73b910c`). Tre tørrkjøringer i det midlertidige
testprosjektet `test-faseflyt` (økt 9–11): 37k tokens/7+ min → 18k/3:40 →
12k/2:40. Alle seks punktene i planens verifiseringslinje er bekreftet.

## Neste — start her

Fase 8 — `fase-start`, `hjelp` og README: kort utdata, instruks sist (se
`plan.md`). Modell: Sonnet (`/model sonnet`).

## Arbeidsmåte neste økt

- **[hypotese-skrevet-som-fakta]** Verifiser påstander om verktøyoppførsel
  (npm/npx, CLI-flagg) før de skrives i pakken — merk som hypotese hvis utestet.

## Det en ny økt må vite

- **Testprosjekter er midlertidige og lokale** (BK, 2026-09-05): `klengenavn`,
  `faseflyt-0.7-test`, `test-faseflyt` m.fl. slettes når ferdig brukt og finnes
  kun på hjemmekontor-maskinen — ikke en varig referanse for andre økter/maskiner.
- **To promoteringsforslag venter fortsatt på BKs klarsignal:**
  `[proev-forslaget-mot-prosjektets-egne-laerdommer]` og
  `[ord-jeg-selv-innfoerer-maa-holdes-mot-tabellen]` — begge inn i `CLAUDE.md`.
- `[nullavvik-krever-samme-kontroll-som-nullsvar]` og `[en-maaling-per-tur]`
  arkivert som aktive, ikke opphevet — ennå uten å bli satt på prøve.
- Norske commit-meldinger lukker ikke issues — `gh issue close` er eget kall.
- Engangsgodkjenninger brenner målfiler — velg alltid en urørt fil som mål.
- Flyttes en regel fra én fil til en annen: grep hele pakken etter forrige
  plassering, ikke bare filene forslaget selv nevner (se `laering.md`).
- `kunnskap/` har også `kollegatest.md`, `testplan.md`, `selvbaerende-test.md`.
- Allowlist-saken er LUKKET. Ikke gjenåpne.
- `/plugin` og `/permissions` kun i terminalen.
