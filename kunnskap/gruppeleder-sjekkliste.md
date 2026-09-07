# Gruppeleder-sjekkliste — tørrkjøring før samlingen 14. september

Brukes live: én runde per gruppeleder, på deres egen maskin. Før runden
starter — commit+push alt som er rettet i repoet siden sist. En tørrkjøring
via GitHub-marketplace tester alltid sist pushede versjon, aldri lokal
arbeidskatalog.

## 0. Forutsetninger

- git installert. Claude Code som CLI eller VS Code-utvidelse.
- Ingen GitHub-innlogging trengs — repoet er åpent (BK, 2026-09-07). Kravet om
  `gh auth` og medlemskap i `vestfoldfylke` er falt bort.
- Får du «blocked by enterprise policy. No external marketplaces are allowed»,
  stopper installasjonen her; det løses på admin-siden (`docs/installasjon.md`),
  ikke på maskinen. Noter det og gå til punkt 4.

## 1. Installer — i TERMINALEN, ikke i chatten

`/plugin` finnes ikke som slash-kommando i VS Code-utvidelsens chat (README,
installasjonsseksjonen). Åpne en vanlig terminal (VS Codes egen holder) og velg
én av de to formene:

- Direkte fra terminalen: `claude plugin marketplace add
  vestfoldfylke/claude-code-skills`, `claude plugin install
  faseflyt@claude-code-skills`, og `claude plugin list` som kvittering.
- Interaktivt: kjør `claude`, skriv så `/plugin marketplace add …` og
  `/plugin install …` i den økten.

Sjekk: `claude plugin list` viser `faseflyt` og ingenting annet fra pakken —
`web-prototype`/`fint-graphql` skal ikke følge med uoppfordret.

## 2. Slår skillene inn av seg selv? — tilbake i chatten (VS Code-utvidelsen eller CLI)

Installasjonen leses opp av begge, siden de deler samme `~/.claude`-konfigurasjon
— bytt nå tilbake til vanlig chat, i en tom mappe:

- Skriv «nytt prosjekt» i vanlig tekst → skillen skal slå inn av seg selv, uten
  at man skriver `/faseflyt:nytt-prosjekt` eksplisitt.
- Velg prosjekttype webapp/prototype → `web-prototype` skal slå inn.
- Sjekk at design-sporet pekes ut riktig (`claude-design-oppskrift.md`).

## 3. Overta et prosjekt — måling

Klon et prosjekt som er satt opp med `nytt-prosjekt`, åpne det i Claude Code,
godta trust-dialogen. Får personen et tilbud om å installere pluginene fra
`.claude/settings.json`? Planens verifiseringspunkt 9 sier nei (målt
2026-08-24 og 2026-08-30); `nytt-prosjekt` steg 6 lover fortsatt ja. Svaret på
flere maskiner avgjør om skillen rettes etter samlingen.

## 4. Plattform

- **Mac:** helt uprøvd i dag — første reelle datapunkt. Noter alt som
  avviker fra punkt 1–2.
- **Snapdragon/ARM (Windows):** pre-flight påbegynt på `kontor-win-arm`, ikke
  gjennomført — fullfør her.

## 5. Rapporter tilbake

For hver gruppeleder: maskin/OS, hva som fungerte, hva som ikke gjorde det.
Funn inn i `kunnskap/logg.md` etter samlingen; nytt herfra → `TODO.md` eller
issue i pakken, ikke rett i skillene.
