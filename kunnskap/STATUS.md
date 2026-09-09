# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. Ingen åpne issues 2026-09-08.

**TO MASKINER SKRIVER TIL DETTE REPOET.** Kjør `git fetch` og sammenlign med `origin/main` før du stoler på denne fila.

**Repoet er PUBLIC siden 2026-09-07.** `faseflyt` 0.9.3 er siste versjon — **INGEN pakkeendring før samlingen 14. september** (BK, frys 2026-09-09, gjelder også korrekte småfeil, se logg).

## Neste — start her

- **Gruppeleder-gjennomgang kjørt 2026-09-09** (Mac/PC, x86+ARM): installasjon fungerte for noen, andre falt tilbake til skill-kopi (Intune ikke klart for alle modeller ennå). Skillene slo inn av seg selv. Ingen umiddelbare feil. Detaljer i logg.
- **Fortsatt utestet:** sjekklistepunkt 3 — kloning av et oppsatt prosjekt, om `.claude/settings.json` tilbyr plugin-installasjon. Ingen gruppeleder klonet.
- **Parkert til etter samlingen:** `nytt-prosjekt` steg 6 lover fortsatt automatisk skill-tilgang ved kloning — motbevist av plan.md punkt 9. Ordlyd klar, se logg 2026-09-09. Blir issue ETTER samlingen (TODO.md sin frysregel).
- **Fortsatt åpent siden 2026-09-08:** svar fra Intune/sikkerhet om konsoll-marketplace vs. åpent repo (BK avgjør).
- **1.0 tas opp etter samlingen, betinget av at den går bra.**

## Arbeidsmåte neste økt

Ingen aktive punkter. `[system-diagnose-i-hovedtraden]` strøket 2026-09-09 — ingen gjenstående fase kan utløse den (logg/laering).

## Det en ny økt må vite

- **Beslutning (BK): «Managed settings» i claude.ai-konsollet skal forbli tomt.** All styring skjer via Intune.
- **GitHub Team har 11 av 11 seter brukt** — åpent repo er eneste kanal for kollegaer uten utviklerlisens.
- **`kontor-win-arm` synket med `origin/main` 2026-09-09** — var 5 dager bak, ukjent for maskinen (se logg).
- **GitHub Support-henvendelsen** (cache/PR mot gamle commits): BKs eksterne oppfølging, detaljer i `kunnskap/lokalt/sikkerhetsvurdering-aapent-repo.md`.
- `innviklere`/`duster` beholder push til `main` (BK, 2026-09-07). Ikke gjenåpne.
- `fint-samtykke`: to slettede filer ustaget, kopier i `.claude/skills/` — avklares der, ikke her.
- `TODO.md` er en frys-erklæring med tabell. Ikke gjenåpne postene der.
- Allowlist-saken er LUKKET. Ikke gjenåpne.
- `/plugin` og `/permissions` kun i terminalen.
