# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. Ingen åpne issues 2026-09-07.

**TO MASKINER SKRIVER TIL DETTE REPOET.** Kjør `git fetch` og sammenlign med
`origin/main` før du stoler på denne fila.

**Repoet er PUBLIC siden 2026-09-07** (var privat). `faseflyt` 0.9.1, commit
`69d986e`, pushet.

## Neste — start her

Kjør gruppeleder-sjekklisten (`kunnskap/gruppeleder-sjekkliste.md`) med de fem
gruppelederne før samlingen 14. september — siste steg før 1.0 (planens
verifiseringspunkt 1). **Blokkert inntil Intune-ansvarlig har lagt inn managed
settings** (JSON-blokk i `docs/installasjon.md`): organisasjonens Claude-policy
avviser `marketplace add` uansett repo-synlighet. Sjekk status først.

## Arbeidsmåte neste økt

- `[trigg-ordet-gjentar-seg]` (2. runde — brutt igjen, se `laering.md`) Søk
  etter klarspråktabellens ord rett etter HVER ENKELT skriving til
  `kunnskap/` — ikke batchet etter flere redigeringer, og ikke droppet.

## Det en ny økt må vite

- **Historikken er skrevet om** (jobbadresse fjernet). `kontor-win-arm` er
  IKKE synket ennå — oppskrift gitt til BK i chatten (Teams), ikke i fil. Til
  det er bekreftet: `refs/original/` og tre omskrevne lokale sidebrancher står
  urørt på `hjemme-win-x86` — rydd dem da, ikke automatisk.
- **Intune-forespørselen og GitHub Support-henvendelsen** (rydd cache/PR-refer
  til gamle commits, #1/#2/#12–14) er BKs eksterne oppfølging, ikke noe en økt
  kan gjøre. Detaljer og ferdig tekst:
  `kunnskap/lokalt/sikkerhetsvurdering-aapent-repo.md` (gitignorert).
- `innviklere`/`duster`-teamene beholder push til `main` — bevisst valg
  (BK, 2026-09-07). Ikke gjenåpne.
- `fint-samtykke` har to slettede filer ustaget og en løs
  `retrospektiv-fint-samtykke.md` — avklares i det prosjektets egen fase-slutt.
- Samme prosjekt har fortsatt kopier av `fint-graphql` og `web-prototype` i
  `.claude/skills/` — ikke rørt, avklar med BK om de skal samme vei.
- `TODO.md` er en frys-erklæring med tabell. Ikke gjenåpne postene der.
- Allowlist-saken er LUKKET. Ikke gjenåpne.
- `/plugin` og `/permissions` kun i terminalen.
