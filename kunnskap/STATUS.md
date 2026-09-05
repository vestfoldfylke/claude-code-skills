# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. Merkelappen `kjent-før-test` =
bevisst utsatt av MVP-frysen 2026-08-19.

**TO MASKINER SKRIVER TIL DETTE REPOET.** Kjør `git fetch` og sammenlign med
`origin/main` før du stoler på denne fila.

**Fase:** Planens nummererte faser (0–8) er alle ferdige. Verifiseringslistens
11 punkter er gjennomgått med BK 2026-09-05: 5/9/10/11 DROPPET (bakoverkompat,
README-test, org-opplasting, overtakelsestest), 3/4/6/7/8 DEKKET fra før, 2
DEKKET nå (tre tørrkjøringer av `nytt-prosjekt`), 1 lest strukturelt (ikke
målt). `faseflyt` 0.9.0, commit `89acdd6`.

## Neste — start her

Ingen gjenstående fase. Punkt 1 (at `faseflyt` virker alene uten
`web-prototype`/`fint-graphql`) måles når BK prepper de fem gruppelederne før
samlingen 14. september — en av dem installerer bare `faseflyt`. 1.0 avgjøres
av samlingen selv (`plan.md`, «Verifisering»).

## Arbeidsmåte neste økt

- `[dry-kjoering-krever-push-foerst]` Testprosjekt via GitHub-marketplace
  tester alltid forrige pushede versjon — commit+push før du stoler på det.
- `[beslutning-uten-tilbakeskriving]` En beslutning ført i loggen uten å
  skrives inn i `plan.md` samme runde blir usynlig for neste økt.

## Det en ny økt må vite

- **Gruppeleder-prepen før 14. september er punkt 1s eneste måling** — ikke
  gjenta som tørrkjøring her.
- `fint-samtykke` har to slettede filer ustaget (`nytt-prosjekt`-skillkopien
  fjernet) og en løs `retrospektiv-fint-samtykke.md` som venter på å flyttes
  til `fint-samtykke/kunnskap/` — avklares i det prosjektets egen fase-slutt.
- Samme prosjekt har fortsatt kopier av `fint-graphql` og `web-prototype` i
  `.claude/skills/` — ikke rørt, avklar med BK om de skal samme vei.
- Fire issues lukket som forkastet 2026-09-05: #3, #9, #10, #15. #7 og #8 står
  åpne med vilje (`kjent-før-test`).
- `TODO.md` har en ny, umålt hypotese: smalt `curl`-kontrollkall for webapp-/
  API-typens deny-sett.
- Allowlist-saken er LUKKET. Ikke gjenåpne.
- `/plugin` og `/permissions` kun i terminalen.
