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
| Encoding-/shell-regler i STATUS | ved Windows | ved Windows | ved filskript på Windows | ved Windows |
| Bredt nettverksdeny (persondata) | ❌ (se under) | ✅ | ✅ | ❌ (se under) |

`fint-graphql` deklareres uavhengig av type — kun når prosjektet faktisk bruker FINT.

**Plattform er en egen akse, ikke en egenskap ved typen.** Reglene i `windows.md`
gjelder der prosjektet faktisk utvikles — ikke alle er på Windows. Avklar det før
du skriver noe plattformspesifikt i STATUS.

## Webapp / prototype

SvelteKit + Designsystemet, ofte for brukertesting. `web-prototype`-skillen
(deklarert, ikke kopiert) dekker oppsettet og DS-reglene, og slår inn av seg selv.
Har prototypen eget visuelt tema: følg `claude-design-oppskrift.md`.
Full sikkerhetssjekkliste fra maler.md — BFF-endepunkter regnes som API-flate.
Behandler prototypen persondata: **ikke** bredt nettverksdeny — Claude må kunne
kalle sitt eget `localhost`-endepunkt for røyktesten i fase 0. Bruk mønstre som
treffer produksjonsvertene i stedet (se «Deny-settets grenser» i maler.md).

## Script / automatisering

Scripts (PowerShell, bash, tsx/node) mot API-er med reelle data. Ingen designdel.
Utvikles scriptet på Windows, er encoding-reglene i `windows.md` kritiske her —
inn i STATUS før første filskript. Skrives det på Mac eller Linux, gjelder de
ikke; velg språk etter hvor scriptet skal KJØRE, ikke etter hvor det skrives.
Behandler prosjektet persondata, er bredt nettverksdeny gratis her: Claude har
ingen legitim grunn til å gjøre nettkall selv. Men merk grensen på Windows: det
eneste som faktisk sperrer nett-cmdlets er å deny hele PowerShell-verktøyet, og
det kan et PowerShell-script-prosjekt ikke leve med — Claude må kunne kjøre
scriptene. Her bærer derfor CLAUDE.md-regelen vernet nesten alene (se
«Deny-settets grenser» i maler.md). For dokumentasjons- og Node/tsx-prosjekter er
grepet gratis.
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
obligatorisk å tilby, ikke valgfritt å nevne. Som for webapp: nettverksdeny må
ikke stenge Claude ute fra tjenestens eget `localhost` — da mister prosjektet
evnen til å verifisere eget arbeid, og regelen blir slått av i irritasjon.
