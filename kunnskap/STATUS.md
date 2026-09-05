# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. Merkelappen `kjent-før-test` =
bevisst utsatt av MVP-frysen 2026-08-19.

**TO MASKINER SKRIVER TIL DETTE REPOET.** Kjør `git fetch` og sammenlign med
`origin/main` før du stoler på denne fila.

**Fase:** Fase 8 av planens fase 0–8 er levert og verifisert. `faseflyt` 0.8.3
(commit `9574b99`). Tørrkjøring i `test-faseflyt`: fase-start ga 5
innholdslinjer (tak ti), modell-instruksen alene sist; `hjelp` nevnte
kommandoformen ordrett. Begge planens verifiseringspunkter bekreftet.

## Neste — start her

Planens nummererte faser (0–8) er ferdige. Gjenstår: planens `##
Verifisering`-liste (11 punkter, `plan.md`) — avklar med brukeren hvilke som
alt er dekket før du fortsetter. Modell: avklaring/vurdering → tyngste modell.

## Arbeidsmåte neste økt

- **[hypotese-skrevet-som-fakta]** Verifiser påstander om verktøyoppførsel før
  de skrives i pakken — ikke utløst i fase 7/8, videreføres uendret.
- **[dry-kjoering-krever-push-foerst]** Testprosjekt via GitHub-marketplace
  tester alltid forrige pushede versjon — commit+push før du stoler på det.

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
