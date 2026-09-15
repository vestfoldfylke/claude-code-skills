# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. 0 åpne issues 2026-09-15 ettermiddag.

**TO MASKINER SKRIVER TIL DETTE REPOET.** Kjør `git fetch` og sammenlign med `origin/main` før du stoler på denne fila.

**Repoet er PUBLIC, godkjent av sikkerhet 2026-09-10 — forblir åpent inntil videre.** `faseflyt` er nå **1.0.1** (utgitt 2026-09-15 ettermiddag, issue #18 rettet). Frysen fra 09-09 er opphevet — samlingen er avholdt.

## Neste — start her

- **1.0.1 sin runtime-oppførsel er ikke testet i praksis.** Fiksen for issue #18 (kontrollkall i `fase-start` steg 2) er mekanisk sjekket (renhetssjekk, `claude plugin validate`, diff lest, kontrollsøk traff), men ingen har kjørt `/faseflyt:fase-start` i et prosjekt der miljøbeskrivelsens «Is a git repository»-flagg faktisk er feil.
- **Fortsatt utestet fra 1.0.0:** sjekklistepunkt 3 — kloning av et oppsatt prosjekt, om `.claude/settings.json` tilbyr plugin-installasjon automatisk.
- **Parkert, klar for issue:** `nytt-prosjekt` steg 6 lover automatisk skill-tilgang ved kloning — motbevist av plan.md punkt 9. Ordlyd klar (se logg 09-09), samlingen er avholdt, kan opprettes nå.
- **Intune: to maskiner har nå samme avvik.** `hjemme-win-x86` (siden 09-08) og `kontor-win-arm` (observert 09-15): `managed-settings.json` v11 finnes lokalt, men `claude doctor` rapporterer «none configured». Ekstern oppfølging med sikkerhet/Are, ikke et pakke-steg.

## Arbeidsmåte neste økt

*Ingen aktive punkter — [kilde-diagnose-før-losning] strøket 2026-09-15 ettermiddag, se logg.*

## Det en ny økt må vite

- **Beslutning (BK): «Managed settings» i claude.ai-konsollet skal forbli tomt.** All styring skjer via Intune.
- **GitHub Team har 11 av 11 seter brukt** — åpent repo er eneste kanal for kollegaer uten utviklerlisens.
- **`strictKnownMarketplaces` i managed-settings.json v11 har uvanlig form** — flagget til Are 09-08/09-10, ikke avklart. Se logg før du antar den virker som ventet.
- **Kommandonavnet «pwd» i en Bash-allow-oppføring utløser organisasjonens
  credential-scan-hook** (falsk positiv — regexen fanger «pwd» etterfulgt av
  skilletegn, uansett sammenheng). Utelatt fra allowlisten 09-15 — husk dette
  hvis flere kommandonavn skal inn.
- **GitHub Support-henvendelsen** (cache/PR mot gamle commits): BKs eksterne oppfølging, detaljer i `kunnskap/lokalt/sikkerhetsvurdering-aapent-repo.md`.
- `innviklere`/`duster` beholder push til `main` (BK, 2026-09-07). Ikke gjenåpne.
- `fint-samtykke`: to slettede filer ustaget, kopier i `.claude/skills/` — avklares der, ikke her.
- `TODO.md` er en frys-erklæring med tabell. Ikke gjenåpne postene der.
- Allowlist-saken (sammenhengen mellom allow-oppføring og dialog) er LUKKET — ikke gjenåpne målingen, bruk formene fra «Deny-settets grenser» i `maler.md`.
- `/plugin` og `/permissions` kun i terminalen.
