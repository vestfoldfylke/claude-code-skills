# Maler for fase-arbeidsflyten

Alle maler `nytt-prosjekt` scaffolder fra. `<...>` fylles inn konkret.

## `kunnskap/plan.md`

```markdown
# Plan: <prosjektnavn>

*Kanonisk plan. Kopiert hit fra planmodus ved godkjenning <ÅÅÅÅ-MM-DD>.
Endres planen, endres DENNE filen.*

## Kontekst

<Hvorfor prosjektet finnes: problemet, hva som utløste det, ønsket utfall.>

## Avklarte beslutninger

<Fra grillingen og planprosessen — én per valg som avviker fra det opplagte:>

- **Beslutning (<navn>):** <valget> — <begrunnelsen, så den kan leses uker senere>

## Faseplan

<Dimensjonering: én fase = én enhet brukeren kan VERIFISERE (kjøre, se, teste),
som får plass i én økt uten /compact. Fase 0 er alltid scaffold + røyktest, så
hele pipelinen er bevist før noe bygges oppå. 3–10 faser er normalområdet. En
fase som ikke kan verifiseres selvstendig er feil snitt.>

### Fase 0 — Scaffold og røyktest
<hva som settes opp>
**Verifisering:** <hva brukeren gjør for å si ✅>

### Fase 1 — <navn>
<innhold>
**Verifisering:** <hva brukeren gjør for å si ✅>

## Kritiske filer

<filene som bærer løsningen — oppdateres underveis>

## Verifisering (helhet)

<hvordan hele leveransen testes ende-til-ende når fasene er ferdige>
```

## `kunnskap/STATUS.md`

```markdown
# STATUS — les denne først i ny økt

*Overskrives ved hver faseslutt. Historikk: `logg.md`. Selvvurderinger: `laering.md`.*

**Plan:** `kunnskap/plan.md`
**Gjenstående:** `TODO.md` i rotkatalogen

**Fase:** <hvilken fase/tilstand prosjektet er i akkurat nå>

## Neste

<ett eller to konkrete forslag til neste steg>

## Arbeidsmåte neste økt

<maks 3 punkter fra siste selvvurdering, hver med stikkordsetikett — fjernes når
innarbeidet, promoteres til CLAUDE.md ved tredje gjentakelse. Tom seksjon er lov.>

- `[<etikett>]` <handlingsbar korrigering>

## Det en ny økt må vite

<3–6 punkter: ikke-opplagte beslutninger, kritiske filer, fallgruver som IKKE
fremgår av å lese koden. På Windows-prosjekter skal encoding-regelen stå her
(se references/windows.md) til den ev. promoteres til CLAUDE.md.>
```

## `kunnskap/logg.md`

```markdown
# Løpende logg

Datert logg over funn, overraskelser og beslutninger. Nyeste øverst.
Hver fase føres to ganger: «skrevet (verifisering hos bruker)» og «verifisert ✅».

## <ÅÅÅÅ-MM-DD> — Prosjektstart

<plan godkjent, tech-stack-valg, kjente begrensninger fra dag 1>
```

## `kunnskap/laering.md`

```markdown
# Læringslogg — selvvurdering per faseslutt

Append-only, nyeste øverst. Hvert punkt har en stabil stikkordsetikett i
klammer, slik at gjentakelse kan telles på tvers av økter. Et punkt som går
igjen i tre påfølgende faseslutt er ikke en påminnelse, men en manglende regel —
promoteres til prosjektets CLAUDE.md.

Punktene skal være HANDLINGSBARE og ETTERPRØVBARE:
- Brukbart: «`[explore-delegering]` Delegér filsøk på tvers av mapper til
  Explore — tre runder Grep i hovedtråden kostet ~15k tokens denne fasen.»
- Ubrukelig: «kunne vært mer effektiv.»

To kategorier dekkes per faseslutt: prosess/token-bruk og kodekvalitet/framgangsmåte.

## <ÅÅÅÅ-MM-DD> — Fase <N>

**Evaluering av forrige økts punkter:**
- `[<etikett>]` fulgt/ikke fulgt — <strykes / videreføres / promoteres>

**Nye punkter:**
- `[<etikett>]` <korrigering med konkret belegg>
```

## `kunnskap/arkitektur.md` (kun kode-typer)

```markdown
# Arkitekturbeslutninger

<ett avsnitt per beslutning som IKKE er selvforklarende fra koden: hvorfor denne
løsningen og ikke den enkle/opplagte. Oppdateres når en beslutning tas, ikke i bulk.>
```

## `kunnskap/sikkerhet.md`

Standardsettet — juster etter prosjekttype (se `prosjekttyper.md`):

```markdown
# Sikkerhetssjekkliste

Oppdateres når nye endepunkter/dataflater legges til. Full gjennomgang: se logg.md.

1. Autentisering/autorisasjon — dekning per endepunkt (hvem vokter hva)
2. Secrets/PII aldri i klientkode, DTO-er eller logger
3. Injection (SQL/OData/shell) — alltid server-utledet input i filterstrenger
4. XSS/RCE — ingen ukontrollert HTML-injeksjon
5. Avhengigheter — `npm audit` (eller ekvivalent) 0 sårbarheter
6. Feilmeldinger til klient — aldri interne detaljer/stack traces
7. Audit-logging av skriveoperasjoner og sensitive oppslag
```

## `TODO.md` (rotkatalogen, fra dag 1 — også tom)

```markdown
# TODO — <prosjektnavn>

Parkeringsplass for «må huskes, men ikke nå» — fra dag 1, og for gjenstående
punkter etter at planens faser er levert. Vedlikeholdes manuelt.

## 1. <punkt>

<beskrivelse, avklaringer som må gjøres før arbeidet starter hvis noen>
```

## CLAUDE.md-avsnitt (limes inn / legges til i prosjektets CLAUDE.md)

```markdown
## Fase-arbeidsflyt

Prosjektet kjøres i faser med verifiseringsport: plan i `kunnskap/plan.md` →
én fase per økt → brukeren verifiserer → `/faseflyt:fase-slutt` → `/clear`.
Ny økt: les `kunnskap/STATUS.md` først — ikke utforsk kodebasen for ting den
svarer på. Utforskning delegeres til Explore-subagent.

**Rytmevakter (stående regler for Claude):**

1. **Plan-vakt:** vesentlig nytt arbeid uten godkjent plan i `kunnskap/plan.md`
   → foreslå planmodus (be om byttet via EnterPlanMode) i stedet for å kode.
2. **Fase-slutt-vakt:** når brukeren bekrefter at verifiseringen er OK →
   foreslå `/faseflyt:fase-slutt` + `/clear` med én gang. Blir konteksten lang
   midt i en fase: si fra FØR kvaliteten faller.
3. **Scope-vakt:** ber brukeren om noe utenfor gjeldende fase → foreslå
   `TODO.md`, fullfør fasen i stedet for å ese.

## Kunnskapsfangst

Alt vi lærer (observert oppførsel, overraskelser, beslutninger) dokumenteres i
`kunnskap/` SAMME økt som det oppdages: `logg.md` (datert), `arkitektur.md`,
`sikkerhet.md`. Brukerbeslutninger loggføres som `**Beslutning (<navn>):**`
MED begrunnelse.

## Skills

Org-skills (faseflyt m.fl.) deklareres i `.claude/settings.json` og hentes fra
org-repoet — de kopieres ALDRI inn i dette repoet. Kun prosjektets egen
domenekunnskap bor i `.claude/skills/`.
```

Behandler prosjektet persondata, legg også til (tilpass datakilden):

```markdown
## Personvern: Claude henter aldri produksjonsdata selv

Claude kjører ikke kommandoer som henter data fra <datakilde/API>, og leser
ikke `.env` eller `<datamappe>/` — håndhevet med deny-regler i
`.claude/settings.json`. Arbeidsflyt: Claude forbereder kommandoen, brukeren
kjører den manuelt og limer inn resultatet (uten persondata). Merk: deny-regler
er risikoreduksjon, ikke sandkasse — denne regelen og deny-settet hører sammen.
```

## `.claude/settings.json`

Grunnform (alle prosjekter). `enabledPlugins` utvides med
`"web-prototype@claude-code-skills": true` for webapp-typen og
`"fint-graphql@claude-code-skills": true` når prosjektet bruker FINT:

```json
{
  "extraKnownMarketplaces": {
    "claude-code-skills": {
      "source": {
        "source": "github",
        "repo": "vestfoldfylke/claude-code-skills"
      }
    }
  },
  "enabledPlugins": {
    "faseflyt@claude-code-skills": true
  }
}
```

Behandler prosjektet persondata, legg til deny-settet for prosjekttypen —
eksempel for en webapp/BFF mot et eksternt API (tilpass domenene):

```json
{
  "permissions": {
    "deny": [
      "Read(.env)",
      "Read(.env.*)",
      "Read(data/**)",
      "Bash(curl:*)",
      "Bash(Invoke-WebRequest:*)",
      "Bash(Invoke-RestMethod:*)",
      "Bash(npx tsx scripts/*)"
    ]
  }
}
```

## `.claude/skills/README.md`

```markdown
# Skills i dette prosjektet

Org-skills (faseflyt, ev. web-prototype/fint-graphql) deklareres i
`.claude/settings.json` og hentes automatisk fra
`vestfoldfylke/claude-code-skills` når du åpner prosjektet og godtar
trust-prompten — de skal ALDRI kopieres hit (kopier råtner).

Denne mappen er for prosjektets EGEN domenekunnskap: API-særegenheter,
datamodell-notater og andre skills som ikke gir mening utenfor dette prosjektet.
```
