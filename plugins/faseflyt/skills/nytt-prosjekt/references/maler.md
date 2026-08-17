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

<Fra grillingen og planprosessen — én per valg som avviker fra det opplagte.
`<beslutningstaker>` er PERSONEN som bestemte (navn eller initialer), `<tema>` er
stikkordet du skanner etter. Begge kreves: temaordet gjør listen lesbar, men
«hvem bestemte dette?» er hele grunnen til at beslutningen loggføres.>

- **Beslutning (<beslutningstaker>, <tema>):** <valget> — <begrunnelsen, så den
  kan leses uker senere>
- **Beslutning (AB, git-remote):** privat repo på organisasjonskontoen, ikke den
  personlige — prosjektet skal kunne overtas av andre enn den som startet det

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
En fase føres to ganger NÅR verifiseringen skjer i en senere økt: «skrevet
(verifisering hos bruker)» og «verifisert ✅». Skjer implementering og bekreftelse
i samme økt, er ETT ✅-innslag riktig.

**Funn krever belegg — skill observert fra antatt.** Loggen er grunnlaget for at
«verifisert ✅» betyr noe; føres antakelser som oppdagelser, eroderer den
troverdigheten (og regler endres på feil grunnlag). Derfor:

- **Observert:** <hva ble kjørt> → <hva skjedde>. Bare dette er et funn.
- **Hypotese:** <påstanden> — ikke testet. Avgjøres av: <konkret probe, og
  hvilket utfall som betyr hva>

En overskrift skal ikke påstå mer enn forbeholdene under den tillater. Og en probe
som kan feile av flere grunner måler ingenting — del den i to FØR den kjøres
(se `fallgruver.md`).

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

**Rytmevakter (stående regler for Claude).** Alle tre er varslingsregler: vakten
sier fra og venter. Ingen av dem er en fullmakt til å utføre det den foreslår.

1. **Plan-vakt:** vesentlig nytt arbeid uten godkjent plan i `kunnskap/plan.md`
   → foreslå planmodus (be om byttet via EnterPlanMode) og vent på svar. Ikke
   begynn å kode i mellomtiden.
2. **Fase-slutt-vakt:** når brukeren bekrefter at verifiseringen er OK → si
   straks fra at porten er nådd og **foreslå** `/faseflyt:fase-slutt` + `/clear`.
   Deretter **vent på klarsignal.** Ikke kall `fase-slutt` selv: den committer og
   pusher uten eget klarsignal, så en verifiseringsbekreftelse ville da alene
   utløst en push — og verifiseringsporten, som er hele poenget med flyten, er
   omgått. «Verifisert, alt OK» betyr ikke «avslutt fasen». Blir konteksten lang
   midt i en fase: si fra FØR kvaliteten faller.
3. **Scope-vakt:** ber brukeren om noe utenfor gjeldende fase → foreslå
   `TODO.md`, fullfør fasen i stedet for å ese.

## Kunnskapsfangst

Alt vi lærer (observert oppførsel, overraskelser, beslutninger) dokumenteres i
`kunnskap/` SAMME økt som det oppdages: `logg.md` (datert), `arkitektur.md`,
`sikkerhet.md`. Brukerbeslutninger loggføres som
`**Beslutning (<beslutningstaker>, <tema>):**` MED begrunnelse — personen som
bestemte, ikke bare temaet. Funn føres som observert kun når et kall faktisk ble
forsøkt og utfallet sett; ellers som hypotese med hva som ville avgjort den.

## Skills

Org-skills (faseflyt m.fl.) deklareres i `.claude/settings.json` og hentes fra
org-repoet — de kopieres ALDRI inn i dette repoet. Kun prosjektets egen
domenekunnskap bor i `.claude/skills/`.
```

Behandler prosjektet persondata, legg også til (tilpass datakilden):

```markdown
## Personvern: Claude henter aldri produksjonsdata selv

Claude kjører ikke kommandoer som henter data fra <datakilde/API>, og leser
ikke `.env` eller `<datamappe>/`. Arbeidsflyt: Claude forbereder kommandoen,
brukeren kjører den manuelt og limer inn resultatet (uten persondata).

**Denne regelen er hovedvernet, ikke et supplement.** Deny-reglene i
`.claude/settings.json` støtter den, men de er verktøy-scopet og dekker mindre
enn navnene antyder — på Windows ikke PowerShell-verktøyet (se
«Deny-settets grenser» i maler.md). Regel og deny-sett hører sammen som par, og
ingen av dem er en sandkasse.
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

Behandler prosjektet persondata, legg til deny-settet. **Les «Deny-settets
grenser» og kjør integritetsproben under før du stoler på noe av det** — settet
dekker mindre enn navnene antyder, og et vern man tror er tettere enn det er, er
verre enn ingen vern.

Grunnsett (tilpass mappe- og filnavn):

```json
{
  "permissions": {
    "deny": [
      "Read(.env)",
      "Read(.env.*)",
      "Read(**/.env)",
      "Read(data/**)",
      "Bash(curl:*)",
      "Bash(wget:*)",
      "Bash(npx tsx scripts/*)"
    ]
  }
}
```

`Read(**/.env)` står sammen med `Read(.env)` med vilje: stiformen som faktisk
matcher er ikke avklart (se grensene under), og to former koster ingenting.
Cmdlet-navn (`Invoke-RestMethod`, `Get-Content`) hører IKKE i `Bash(...)` — de
finnes ikke i et POSIX-shell, og der de finnes, dekker ikke `Bash(...)` dem.

**Nettverksdeny må differensieres per prosjekttype.** Mønstrene treffer
*kommandonavn*, mens risikoen ligger i *målet*: et kall mot `http://localhost:5173`
(Claude røyktester sitt eget endepunkt — kjernen i fase 0) og et kall mot et
produksjons-API er samme kommando og helt ulike handlinger.

| Type | Nettverk | Hvorfor |
|---|---|---|
| script, dokumentasjon | bredt deny som over | Claude har ingen legitim grunn til nettkall — koster ingenting |
| webapp, API/backend | ikke bredt deny | ellers mister prosjektet evnen til å verifisere eget arbeid; bruk mønstre som treffer produksjonsvertene framfor kommandonavnene |

Asymmetrien favoriserer ellers deny: for bredt gir en synlig blokkering som
fjernes på sekunder, for smalt gir en usynlig lekkasje. Men det gjelder bare så
lenge regelen ikke står i veien for normalt arbeid — da blir den slått av i
irritasjon, og det er den verste utgangen.

Om de to fil-reglene:

- `Read(data/**)` forutsetter at produksjonsuttrekk og syntetiske fixtures ligger
  i ULIKE mapper: `data/` (denied) og `testdata/` (tillatt). Blokkerer settet
  fixtures Claude trygt kan lese, blir hele regelen slått av.
- `Read(.env)` beholdes hardt — behovet finnes ikke: nøkkelNAVN uten verdier,
  `.env.example` og `$env:NAVN`/`process.env.NAVN` dekker alle reelle tilfeller.

### Verifiser at blokken er koblet til — hver gang filen endres

En uverifisert nøkkel i `permissions` kan gjøre at HELE blokken forkastes. Da blir
samtlige deny-regler stille inaktive, og alt ser ut som «vernet virker ikke»
framfor «konfigurasjonen ble avvist». Det er den verste feilmoden, og den er
gratis å utelukke:

1. Ha `Bash(curl:*)` i deny.
2. Be Claude kjøre `curl http://127.0.0.1:9/` med **Bash**-verktøyet.
3. **Blokkert** ⇒ blokken er aktiv, og du kan tolke andre utfall. **Kjørte** ⇒
   filen eller nøkkelen er avvist — fiks det FØR du konkluderer på noen annen
   regel.

Proben må være **ukonfundert**: bruk en regel som IKKE har en tilsvarende regel i
CLAUDE.md. Fil-prober på `.env` duger ikke — Claude avslår dem av eget skjønn uten
å forsøke noe verktøykall, og da er harness-en aldri testet; modellens gode
oppførsel maskerer om deny-regelen i det hele tatt er koblet til. Port 9 (discard)
har ingen lytter, så «kjørte» skiller seg tydelig fra «blokkert»: et kall som når
nettverksstakken feiler på manglende tilkobling.

### Deny-settets grenser (målt 2026-08-17)

1. **Matcherne er verktøy-scopet.** Samme URL, samme økt: `curl` i **Bash** ble
   blokkert av `Bash(curl:*)`, mens `Invoke-RestMethod` i **PowerShell**-verktøyet
   kjørte — `Bash(...)` dekket det ikke. Praktisk følge: på Windows dekker
   deny-settet Bash-verktøyet, ikke PowerShell-verktøyet.
2. **`PowerShell(...)`-formen stoppet ingenting** i samme test, mens blokken
   beviselig var aktiv. Årsaken er ikke avklart (ukjent scope, eller
   prefiksmønster som ikke treffer fordi verktøyet pakker kommandoen i en
   preamble). Ikke bygg vern på den formen før den er verifisert med proben over.
3. **Navnebaserte mønstre kan prinsipielt ikke bli komplette.** Aliaser er bare
   toppen (`irm`, `iwr`, `curl.exe`, `gc`, `type`, `Select-String`, `Import-Csv`).
   Verre er omveiene uten kommandonavn i det hele tatt — `[Net.WebClient]`,
   `Start-BitsTransfer`, `[IO.File]::ReadAllText()` — og indirekte kall
   (`$c='irm'; & $c`), der navnet først finnes ved kjøring. Listen blir aldri
   uttømmende; ikke lat som den er det.
4. **Stiformen i `Read(...)` er uavklart.** Bare filnavn (`Read(fil.txt)`)
   blokkerte ikke et Read på absolutt sti i test. Verifiser din egen form med
   proben over, på en fil UTEN særstatus — `.env` egner seg ikke, siden den kan ha
   innebygd behandling i Claude Code uavhengig av settings.

**Hva dette betyr for løftet i CLAUDE.md:** deny-settet er ETT lag
risikoreduksjon, tynnere på Windows enn på Mac, og ikke en sandkasse. Regelen i
CLAUDE.md («Claude forbereder kommandoen, brukeren kjører den») bærer mesteparten
av vekten. En verktøy-agnostisk PreToolUse-hook — den ser `tool_name` og hele
kommandostrengen, og er testbar fordi den kan logge — er laget som lukker
verktøy-hullet, men den er ikke i pakken ennå og skal ikke loves i
CLAUDE.md-teksten før den er. Også den fanger tekst, ikke kjøretidsnavn: absolutt
isolasjon krever sandbox eller container.

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
