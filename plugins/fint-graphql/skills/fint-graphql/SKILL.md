---
name: fint-graphql
description: Reference for FINT information model and FINT GraphQL API. Use when writing queries against FINT, understanding entity relationships (elev, elevforhold, skole, person, personalressurs, arbeidsforhold), or debugging FINT GraphQL API calls.
---

# FINT GraphQL

FINT (Felles Integrasjonsplattform) er den norske felleskomponenten for offentlig sektors data. FINT GraphQL brukes til å hente elev- og ansattdata fra Vestfold fylkeskommune.

**Persondata:** spørringene under returnerer fødselsnummer og andre personopplysninger. Følg prosjektets personvernregler (typisk: Claude forbereder spørringen, brukeren kjører den og limer inn resultatet uten persondata) — persondata skal aldri inn i committede filer eller logger.

**Modellversjon:** Informasjonsmodell [v4.0.30](https://informasjonsmodell.felleskomponent.no/docs?v=v4.0.30) — GraphQL-tjenestens Java-biblioteker bygger mot `apiVersion=4.0.0` (se [`gradle.properties`](https://github.com/FINTLabs/fint-graphql/blob/main/gradle.properties)). Sjekk dette når noe mangler eller oppfører seg uventet — modellen oppdateres periodisk.

## Endepunkt og autentisering

```
POST https://api.felleskomponent.no/graphql/graphql
Content-Type: application/json
Authorization: Bearer <token>
```

Token hentes via miljøvariabel (f.eks. `BEARER_TOKEN`) eller interaktivt — aldri hardkodet. Token er et OAuth2 Bearer-token fra Vestfold fylkeskommunes Azure AD / Feide-integrasjon.

Uten gyldig token returneres HTTP 401.

## GraphQL-skjema — viktige typer

GraphQL-skjema er generert fra FINT-informasjonsmodellen. Kildekode: [github.com/FINTLabs/fint-graphql](https://github.com/FINTLabs/fint-graphql). Skjemafiler: [`schema/model/`](https://github.com/FINTLabs/fint-graphql/tree/main/src/main/resources/schema/model).

---
### Elev-domenet (utdanning/elev)

### Skole
```graphql
type Skole {
  navn: String!
  juridiskNavn: String
  skolenummer: Identifikator       # { identifikatorverdi: String }
  organisasjonsnummer: Identifikator
  elevforhold: [Elevforhold]
  klasse: [Klasse]
  kontaktlarergruppe: [Kontaktlarergruppe]
  undervisningsgruppe: [Undervisningsgruppe]
  skoleressurs: [Skoleressurs]
  # ... flere relasjoner
}
```

### Elev
```graphql
type Elev {
  systemId: Identifikator!
  elevnummer: Identifikator
  brukernavn: Identifikator        # Feide-brukernavn
  feidenavn: Identifikator
  kontaktinformasjon: Kontaktinformasjon
  hybeladresse: Adresse
  gjest: Boolean
  person: Person!
  elevforhold: [Elevforhold]
}
```

### Elevforhold
```graphql
type Elevforhold {
  systemId: Identifikator!
  beskrivelse: String
  avbruddsdato: Date
  elev: Elev
  skole: Skole
  klassemedlemskap: [Klassemedlemskap]
  undervisningsgruppe: [Undervisningsgruppe]
  kontaktlarergruppe: [Kontaktlarergruppe]
  faggruppe: [Faggruppe]
  # ... flere relasjoner (elevfravar, elevtilrettelegging, etc.)
}
```

### Person
```graphql
type Person {
  systemId: Identifikator!
  fodselsnummer: Identifikator!    # { identifikatorverdi: String }
  navn: Personnavn!                # { fornavn, etternavn, mellomnavn }
  fodselsdato: Date
  bostedsadresse: Adresse          # { adresselinje: [String], postnummer, poststed }
  kontaktinformasjon: Kontaktinformasjon  # { epostadresse, mobiltelefonnummer }
  # ... kjønn, statsborgerskap, pårørende, verge
}
```

---
### Ansatt-domenet (administrasjon/personal)

#### Personalressurs
```graphql
type Personalressurs {
  ansattnummer: Identifikator!
  ansettelsesperiode: Periode!
  ansiennitet: Date
  brukernavn: Identifikator        # Feide-brukernavn
  jobbtittel: String
  kontaktinformasjon: Kontaktinformasjon
  systemId: Identifikator
  personalressurskategori: Personalressurskategori!
  arbeidsforhold: [Arbeidsforhold]
  person: Person!
  stedfortreder: [Fullmakt]
  fullmakt: [Fullmakt]
  leder: [Organisasjonselement]    # organisasjonselement der denne er leder
  personalansvar: [Arbeidsforhold]
  skoleressurs: Skoleressurs       # kobling til skole (finnes bare for undervisningspersonell)
}
```

#### Arbeidsforhold
```graphql
type Arbeidsforhold {
  systemId: Identifikator!
  stillingsnummer: String!
  stillingstittel: String
  ansettelsesprosent: Long!
  lonnsprosent: Long!
  tilstedeprosent: Long!
  arslonn: Long!
  hovedstilling: Boolean!
  gyldighetsperiode: Periode!      # { start, slutt } — bruk for å filtrere aktive
  arbeidsforholdsperiode: Periode
  personalressurs: Personalressurs
  arbeidssted: Organisasjonselement
  # ... fastlonn, fasttillegg, variabellonn, aktivitet, anlegg, ansvar, ...
}
```

#### Organisasjonselement
```graphql
type Organisasjonselement {
  organisasjonsId: Identifikator!
  organisasjonsKode: Identifikator!
  navn: String
  kortnavn: String
  gyldighetsperiode: Periode
  organisasjonsnavn: String        # arvet fra Enhet
  organisasjonsnummer: Identifikator
  forretningsadresse: Adresse
  kontaktinformasjon: Kontaktinformasjon
  leder: Personalressurs           # ansatt som er leder av enheten
  overordnet: Organisasjonselement!
  underordnet: [Organisasjonselement]
  arbeidsforhold: [Arbeidsforhold]
  skole: Skole                     # satt hvis enheten er en skole
}
```

#### Skoleressurs
Bindeledd mellom `Personalressurs` og `Skole` — finnes bare for undervisnings- og skoleansatte.
```graphql
type Skoleressurs {
  systemId: Identifikator!
  feidenavn: Identifikator
  person: Person
  personalressurs: Personalressurs!
  undervisningsforhold: [Undervisningsforhold]
  skole: [Skole]                   # skolene ressursen er tilknyttet
}
```

---
### Felles hjelpetype
```graphql
type Identifikator { identifikatorverdi: String }
type Adresse { adresselinje: [String], postnummer: String, poststed: String }
type Kontaktinformasjon { epostadresse: String, mobiltelefonnummer: String }
type Personnavn { fornavn: String, etternavn: String, mellomnavn: String }
type Periode { start: Date, slutt: Date }
```

## Tilgjengelige rotspørringer

Root `Query` dekker 60+ entiteter, bl.a.:

| Spørring | Parametere |
|---|---|
| `skole(skolenummer, systemId)` | skolenummer f.eks. `"39002"` |
| `elev(systemId, elevnummer, brukernavn, feidenavn)` | |
| `elevforhold(systemId)` | |
| `personalressurs(ansattnummer, brukernavn, systemId)` | brukernavn = Feide-brukernavn |
| `arbeidsforhold(systemId)` | |
| `organisasjonselement(organisasjonsId, organisasjonsKode, organisasjonsnummer)` | |
| `klasse(systemId)` | |
| `undervisningsgruppe(systemId)` | |

## Eksempelspørringer

### Elever per skole

```graphql
query($skolenummer: String!) {
  skole(skolenummer: $skolenummer) {
    navn
    juridiskNavn
    skolenummer { identifikatorverdi }
    organisasjonsnummer { identifikatorverdi }
    elevforhold {
      elev {
        person {
          fodselsnummer { identifikatorverdi }
          navn { fornavn etternavn mellomnavn }
          kontaktinformasjon { epostadresse mobiltelefonnummer }
          bostedsadresse { adresselinje postnummer poststed }
        }
        elevforhold {
          skole { navn }
          klassemedlemskap {
            klasse { navn }
          }
        }
      }
    }
  }
}
```

Python-kall:
```python
resp = session.post(
    "https://api.felleskomponent.no/graphql/graphql",
    json={"query": QUERY, "variables": {"skolenummer": "39002"}},
    headers={"Authorization": f"Bearer {token}", "Content-Type": "application/json"},
    timeout=300,
)
data = resp.json()
skole = data["data"]["skole"]
```

### Ansatte per skole — via Skoleressurs

```graphql
query($skolenummer: String!) {
  skole(skolenummer: $skolenummer) {
    navn
    skoleressurs {
      personalressurs {
        ansattnummer { identifikatorverdi }
        brukernavn { identifikatorverdi }
        jobbtittel
        person {
          fodselsnummer { identifikatorverdi }
          navn { fornavn etternavn }
          kontaktinformasjon { epostadresse mobiltelefonnummer }
        }
        arbeidsforhold {
          stillingstittel
          ansettelsesprosent
          hovedstilling
          gyldighetsperiode { start slutt }
          arbeidssted {
            navn
            organisasjonsKode { identifikatorverdi }
          }
        }
      }
    }
  }
}
```

### En ansatt via brukernavn (Feide)

```graphql
query($brukernavn: String!) {
  personalressurs(brukernavn: $brukernavn) {
    ansattnummer { identifikatorverdi }
    jobbtittel
    ansettelsesperiode { start slutt }
    person {
      navn { fornavn etternavn }
      fodselsnummer { identifikatorverdi }
    }
    arbeidsforhold {
      stillingsnummer
      stillingstittel
      ansettelsesprosent
      hovedstilling
      gyldighetsperiode { start slutt }
      arbeidssted { navn organisasjonsKode { identifikatorverdi } }
    }
    leder {
      navn
      organisasjonsKode { identifikatorverdi }
    }
    skoleressurs {
      skole { navn }
    }
  }
}
```

### Org-enhet med ansatte og leder

```graphql
query($kode: String!) {
  organisasjonselement(organisasjonsKode: $kode) {
    navn
    kortnavn
    leder {
      ansattnummer { identifikatorverdi }
      jobbtittel
      person { navn { fornavn etternavn } }
    }
    overordnet { navn organisasjonsKode { identifikatorverdi } }
    underordnet { navn organisasjonsKode { identifikatorverdi } }
    arbeidsforhold {
      stillingstittel
      ansettelsesprosent
      personalressurs {
        brukernavn { identifikatorverdi }
        person { navn { fornavn etternavn } }
      }
    }
  }
}
```

## Skolenumre — Vestfold fylkeskommune

| Skole | Skolenummer |
|---|---|
| Færder vgs | 39012 |
| Sande vgs | 39002 |
| Kompetansebyggeren | 39030 |
| Greveskogen vgs | 39010 |
| Melsom vgs | 39016 |
| SMI-skolen | 39040 |
| Re vgs | 39006 |
| Horten vgs | 39008 |
| Sandefjord vgs | 39018 |
| Thor Heyerdahl vgs | 39020 |
| Holmestrand vgs | 39004 |
| Nøtterøy vgs | 39014 |

## Vanlige fallgruver

**Generelt:**
- **Null-sjekk overalt**: FINT kan returnere `None` for felt som er merket `!` i skjemaet. Bruk alltid `or {}` / `or []`.
- **Delvise feil**: GraphQL returnerer HTTP 200 selv med feil. Sjekk alltid `data.get("errors")` i tillegg til `data.get("data")`.
- **Timeout**: Spørringer kan ta 30–120 sek for store skoler/org-enheter. Bruk `timeout=300`.
- **adresselinje er en liste**: `bostedsadresse.adresselinje` er alltid `[String]`. Join: `" ".join(adresselinje).strip()`.
- **Modellendringer**: Sjekk [informasjonsmodell v4.0.30](https://informasjonsmodell.felleskomponent.no/docs?v=v4.0.30) og `gradle.properties` i repoet hvis et felt mangler — modellen oppdateres og ny versjon deployes jevnlig.

**Elev-spesifikt:**
- **Elevforhold uten person-ressurs**: Finnes `elevforhold` der `elev.person` er `None`. Hopp over.
- **Sperret adresse**: Elever med sperret adresse (adressekode 6/7, gjenkjennes bl.a. på postboks 9200 Grønland) forekommer — adressefeltene skal da ikke brukes eller eksponeres videre. Hvordan disse håndteres nedstrøms er prosjektspesifikt og MÅ avklares eksplisitt i hvert prosjekt som behandler adresser.

**Ansatt-spesifikt:**
- **Aktive arbeidsforhold**: `gyldighetsperiode.slutt` er `None` (eller mangler) for aktive forhold — filtrer ikke på slutt=None alene, bruk start ≤ i dag.
- **Skoleressurs finnes ikke for alle**: Administrativt ansatte uten undervisningsoppgaver har ikke `skoleressurs`. Alltid sjekk `if personalressurs.get("skoleressurs")`.
- **Flere arbeidsforhold**: En ansatt kan ha flere `arbeidsforhold` (bistillinger). `hovedstilling: true` er primærstillingen.
- **Long-type for prosent/lønn**: `ansettelsesprosent`, `arslonn` etc. er heltall (`Long`), ikke desimaltall. Prosent 100 = 100 % stilling.

## Informasjonsmodellen

Dokumentasjon (krever JavaScript): [informasjonsmodell.felleskomponent.no/docs?v=v4.0.30](https://informasjonsmodell.felleskomponent.no/docs?v=v4.0.30)

| Domene | Inneholder |
|---|---|
| `utdanning/elev` | Elev, Elevforhold, Klasse, Undervisningsgruppe |
| `utdanning/vurdering` | Karakterer, Eksamen, Elevvurdering |
| `administrasjon/personal` | Personalressurs, Arbeidsforhold, Skoleressurs |
| `administrasjon/organisasjon` | Organisasjonselement |
| `felles/person` | Person, Kontaktperson |

GraphQL-skjemafilene: [`schema/model/`](https://github.com/FINTLabs/fint-graphql/tree/main/src/main/resources/schema/model) — én `.graphqls`-fil per type (150+ filer).
