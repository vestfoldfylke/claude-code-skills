# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. Ingen åpne issues 2026-09-10.

**TO MASKINER SKRIVER TIL DETTE REPOET.** Kjør `git fetch` og sammenlign med `origin/main` før du stoler på denne fila.

**Repoet er PUBLIC, godkjent av sikkerhet 2026-09-10 — forblir åpent inntil videre.** `faseflyt` 0.9.3 er siste versjon — **INGEN pakkeendring før samlingen 14. september** (BK, frys 2026-09-09, gjelder også småfeil).

## Neste — start her

- **Alt klart til gruppeleder-samlingen 14. september.** Gjennomgang kjørt 09-09 (Mac/PC, x86+ARM), ingen umiddelbare feil. 1.0 tas opp etter samlingen, betinget av at den går bra.
- **Fortsatt utestet:** sjekklistepunkt 3 — kloning av et oppsatt prosjekt, om `.claude/settings.json` tilbyr plugin-installasjon automatisk. Ingen gruppeleder klonet.
- **Parkert til etter samlingen:** `nytt-prosjekt` steg 6 lover automatisk skill-tilgang ved kloning — motbevist av plan.md punkt 9. Ordlyd klar, se logg 09-09. Blir issue ETTER samlingen.
- **Intune-remediation på `hjemme-win-x86` henger etter.** Ny policy (v11, `strictKnownMarketplaces` uten `anthropics/claude-plugins-official`, uvanlig verdiform) landet 09-08 15:19, men er ikke effektiv — server-managed-laget overstyrer og setter ingen restriksjon. Daglig 09:00-kjøring har ikke gått siden, maskinen sov forbi den. Neste steg: kjør diagnoseskriptet igjen når maskinen har stått våken en stund.

## Arbeidsmåte neste økt

Ingen aktive punkter. Driftsstøtteøkten 09-10 ga 0 nye (se `laering.md`).

## Det en ny økt må vite

- **Beslutning (BK): «Managed settings» i claude.ai-konsollet skal forbli tomt.** All styring skjer via Intune.
- **GitHub Team har 11 av 11 seter brukt** — åpent repo er eneste kanal for kollegaer uten utviklerlisens.
- **`strictKnownMarketplaces` i managed-settings.json v11 har uvanlig form** — flagget til Are 09-08/09-10, ikke avklart. Se logg før du antar den virker som ventet.
- **GitHub Support-henvendelsen** (cache/PR mot gamle commits): BKs eksterne oppfølging, detaljer i `kunnskap/lokalt/sikkerhetsvurdering-aapent-repo.md`.
- `innviklere`/`duster` beholder push til `main` (BK, 2026-09-07). Ikke gjenåpne.
- `fint-samtykke`: to slettede filer ustaget, kopier i `.claude/skills/` — avklares der, ikke her.
- `TODO.md` er en frys-erklæring med tabell. Ikke gjenåpne postene der.
- Allowlist-saken er LUKKET. Ikke gjenåpne.
- `/plugin` og `/permissions` kun i terminalen.
