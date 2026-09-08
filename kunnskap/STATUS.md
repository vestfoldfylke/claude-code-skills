# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. Ingen åpne issues 2026-09-08.

**TO MASKINER SKRIVER TIL DETTE REPOET.** Kjør `git fetch` og sammenlign med
`origin/main` før du stoler på denne fila.

**Repoet er PUBLIC siden 2026-09-07**, ingen «internt»-påstander igjen (rettet
2026-09-08). `faseflyt` 0.9.3 pushet; `marketplace update` + last VS Code på nytt.

## Neste — start her

**Avventer svar fra Intune-ansvarlig og sikkerhetskontakt** (forventet
2026-09-08) før gruppeleder-sjekklisten kan kjøres — siste steg før 1.0.
Diagnose: `kunnskap/lokalt/sikkerhetsvurdering-aapent-repo.md`, ikke mål på
nytt. README har fått en reserveløsning (kopi til `~/.claude/skills/`, logg
2026-09-08) — kollisjonstest mot plugin-versjonen er ikke gjort ennå.
**Åpent fra 2026-09-08 (se logg, «Etter fase-slutt»):** svar til sikkerhet om
konsoll-marketplace vs. åpent repo — BK avgjør konsoll-spørsmålet.
Alternativ 1 er inne i `fase-slutt` steg 3 som 0.9.3.

## Arbeidsmåte neste økt

- `[system-diagnose-i-hovedtraden]` (2. runde, brutt igjen — se `laering.md`)
  Bred systemdiagnostikk (register, Intune-logger, dokumentasjonssøk)
  delegeres til Explore/general-purpose, ikke i hovedtråden.

## Det en ny økt må vite

- **Beslutning (BK): claude.ai-konsollets «Managed settings» skal forbli
  tomt.** All sentral styring skjer via Intune. Ikke foreslå innhold der.
- **GitHub Team har 11 av 11 seter brukt** — privat repo når ikke kollegaer
  uten utviklerlisens; åpent repo er eneste kanal for dem.
- **Historikken er skrevet om** (jobbadresse fjernet); `kontor-win-arm` ikke
  synket ennå (oppskrift i Teams).
- **GitHub Support-henvendelsen** (cache/PR-refer til gamle commits) er BKs
  eksterne oppfølging — detaljer i sikkerhetsvurderingsfila over.
- `innviklere`/`duster`-teamene beholder push til `main` (BK, 2026-09-07). Ikke gjenåpne.
- `fint-samtykke`: to slettede filer ustaget, løs `retrospektiv-fint-samtykke.md`,
  og kopier av `fint-graphql`/`web-prototype` i `.claude/skills/` — avklares der.
- `TODO.md` er en frys-erklæring med tabell. Ikke gjenåpne postene der.
- Allowlist-saken er LUKKET. Ikke gjenåpne.
- `/plugin` og `/permissions` kun i terminalen.
