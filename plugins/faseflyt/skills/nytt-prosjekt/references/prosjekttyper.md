# Prosjekttyper — hva hver type får og slipper

Prosjekttypen avklares FØRST (steg 2 i SKILL.md) og styrer resten av oppsettet.
Er prosjektet en blanding, velg den tyngste typen som passer (API/backend >
webapp > script > dokumentasjon) og suppler manuelt.

## Oversikt

| | Webapp/prototype | Script/automatisering | Dokumentasjon/utredning | API/backend-tjeneste |
|---|---|---|---|---|
| `kunnskap/arkitektur.md` | ✅ | ✅ | ❌ | ✅ (påkrevd) |
| Sikkerhetssjekkliste | full | smal (se under) | datahåndtering (se under) | full |
| `web-prototype`-plugin deklareres | ✅ | ❌ | ❌ | ❌ |
| Designtema-oppskrift relevant | ✅ (`claude-design-oppskrift.md`) | ❌ | ❌ | ❌ |
| Windows-regler i STATUS | ved Windows | ✅ (nesten alltid PowerShell) | ved filskript | ved Windows |

`fint-graphql` deklareres uavhengig av type — kun når prosjektet faktisk bruker FINT.

## Webapp / prototype

SvelteKit + Designsystemet, ofte for brukertesting. `web-prototype`-skillen
(deklarert, ikke kopiert) dekker scaffolding og DS-regler og trigger automatisk.
Har prototypen eget visuelt tema: følg `claude-design-oppskrift.md`.
Full sikkerhetssjekkliste fra maler.md — BFF-endepunkter regnes som API-flate.

## Script / automatisering

PowerShell/tsx-scripts, ofte mot API-er med reelle data. Ingen designdel.
Windows-reglene er kritiske her — inn i STATUS før første filskript.
Smal sikkerhetssjekkliste:

```markdown
1. Secrets kun i .env (gitignored) — aldri hardkodet, aldri i logger
2. Persondata aldri i output-filer som committes, aldri i konsollogg
3. Input til shell-kommandoer og filter-strenger er aldri uvalidert
4. Tørrkjørings-modus (-WhatIf/--dry-run) for alt som skriver mot produksjon
```

## Dokumentasjon / utredning

Ingen kode, ingen `arkitektur.md`. Sikkerhetssjekklisten smalnes til
datahåndtering/personvern:

```markdown
1. Persondata i kildemateriale refereres, aldri kopieres inn i dokumentene
2. Interne systemdetaljer (URL-er, hostnavn, kontoer) kun der dokumentet krever det
3. Dokumenter som skal deles eksternt: egen gjennomgang for intern informasjon
```

## API / backend-tjeneste

BFF-er, integrasjoner, tjenester med auth. Full sikkerhetssjekkliste,
`arkitektur.md` er påkrevd (auth-grensen og dataflyten SKAL dokumenteres der).
Behandler tjenesten persondata er deny-sett + personvern-avsnittet i CLAUDE.md
obligatorisk å tilby, ikke valgfritt å nevne.
