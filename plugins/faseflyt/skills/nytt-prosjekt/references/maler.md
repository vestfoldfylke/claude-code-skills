# Maler for fase-arbeidsflyten

Malene `nytt-prosjekt` oppretter prosjektfilene fra.

**Kodeblokkene er maltekst og kopieres ORDRETT — tegn for tegn.** Ikke
oppsummer, forkort, slå sammen setninger eller skriv om «med egne ord». Ordlyden
er målt: parafrasert maltekst er beviselig kjørt med feil oppførsel som følge
(rytmevakten utførte faseslutt i stedet for å foreslå den), og flere av
formuleringene er skjerpet gjennom egne runder nettopp for å hindre det.

Det eneste som endres er:

- `<...>`-plassholderne, som fylles inn konkret.
- verdier malen selv sier er prosjektavhengige (mappe- og filnavn i deny-settet,
  datakilde i personvern-avsnittet) — verdiene byttes, teksten rundt består.

Prosjektspesifikt innhold legges til som **egne, nye seksjoner eller punkter**.
Malens egne seksjoner omskrives aldri. Teksten UTENFOR kodeblokkene er
instruksjon til den som setter opp prosjektet — den kopieres ikke, men styrer hvilke blokker
som gjelder for prosjekttypen.

Før et malsteg meldes ferdig: les malen og den skrevne fila på nytt og sammenlign
seksjon for seksjon.

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
som får plass i én økt uten /compact. Fase 0 er alltid oppsett som ender i noe
som kjører — da er hele kjeden bevist før noe bygges oppå. 3–10 faser er
normalområdet. En fase som ikke kan verifiseres selvstendig er feil snitt.>

### Fase 0 — Oppsett, og bevis at det kjører
<hva som settes opp>
**Verifisering:** <det brukeren GJØR og SER for å si ✅ — «åpne siden, se at
listen viser tre rader». Ikke «kjør testene»: en kommando Claude kjører er ikke
brukerens verifisering.>

### Fase 1 — <navn>
<innhold>
**Verifisering:** <det brukeren GJØR og SER for å si ✅ — «åpne siden, se at
listen viser tre rader». Ikke «kjør testene»: en kommando Claude kjører er ikke
brukerens verifisering.>

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

<maks 3 punkter fra siste selvvurdering, hver med stikkordsetikett og rundetall.
Nytt punkt: uten tall. Videreført: tallet økes. Tredje runde = foreslå permanent
regel i CLAUDE.md og ta punktet ut herfra. Tom seksjon er lov.>

- `[<etikett>]` <handlingsbar korrigering>
- `[<etikett>]` (2. runde) <videreført korrigering>

## Det en ny økt må vite

<3–6 punkter: ikke-opplagte beslutninger, kritiske filer, fallgruver som IKKE
fremgår av å lese koden. På Windows-prosjekter står encoding-regelen i
CLAUDE.md (se references/windows.md), ikke her — STATUS overskrives.>
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

- **Observert:** <hva ble kjørt> → <hva skjedde>. Bare dette er et funn. Et TOMT
  resultat er ikke et funn før verktøyet er bekreftet å ha kjørt — sjekk
  exit-koden, eller kontroller med et søk som skal gi treff.
- **Hypotese:** <påstanden> — ikke testet. Avgjøres av: <konkret test, og
  hvilket utfall som betyr hva>

En overskrift skal ikke påstå mer enn forbeholdene under den tillater. Og en test
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
Innslagene er korte: én linje per evaluert punkt, to–tre per nytt punkt.

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

En avklart post **fortettes til én pekerlinje** — hvor innholdet bor nå (dato i
`logg.md`, versjon i `CHANGELOG.md`, commit, issue) — framfor å slettes.
Begrunnelsen for hvorfor noe ble som det ble er ofte det mest verdifulle i fila,
og en tom plass forteller ingenting.

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

**Fasesnittet:** én fase er noe brukeren kan se virke, i én økt. Verifiseringen
i planen skrives som noe brukeren gjør og ser («åpne siden, se at listen viser
tre rader»), ikke som en kommando Claude kjører («kjør testene»). Trengte fasen
`/compact`, eller gikk den over flere økter, var den for stor — si det ved
faseslutt og foreslå et nytt snitt for de gjenstående fasene.

**`/compact` brukes bare midt i en fase som ikke rekker å bli ferdig.** Ellers
er veien alltid `/faseflyt:fase-slutt` → `/clear`: en frisk økt med skarp
STATUS slår en lang tråd.

**Modellvalg:** planlegging, arkitektur og sikkerhetskritiske valg gjøres med
den tyngste modellen. Fasene i planen er mekanisk arbeid og går på Sonnet:
`/model sonnet` før fase 0, og tilbake til tyngste modell før planen endres.
Claude sier fra når en fase ikke er mekanisk, i stedet for å bytte i stillhet.

**Rytmevakter (stående regler for Claude).** Alle tre er varslingsregler: vakten
sier fra og venter. Ingen av dem er en fullmakt til å utføre det den foreslår.

1. **Plan-vakt:** vesentlig nytt arbeid uten godkjent plan i `kunnskap/plan.md`
   → foreslå planmodus (be om byttet via EnterPlanMode) og vent på svar. Ikke
   begynn å kode i mellomtiden.
2. **Fase-slutt-vakt:** når brukeren bekrefter at verifiseringen er OK → si
   straks fra at porten er nådd og **foreslå** `/faseflyt:fase-slutt` + `/clear`.
   Deretter **vent på klarsignal.**

   **Porten, med en test du kan sjekke:** faseslutt skjer bare når brukeren har
   bedt om det i en egen melding — `/faseflyt:fase-slutt`, «avslutt fasen» eller
   tilsvarende. Finner du ikke en slik melding, er dette et vakt-utløst forslag,
   og da gjør du **ingenting** av rutinen: verken å kalle skillen eller å utføre
   stegene selv (logg, STATUS, commit). Begge veier ender i samme sted —
   commit-steget committer og pusher uten eget klarsignal, så en
   verifiseringsbekreftelse ville alene utløst en push, og verifiseringsporten
   som er hele poenget med flyten er omgått. «Verifisert, alt OK» betyr ikke
   «avslutt fasen».

   Dette har gått galt to ganger i test, begge under en svakere formulering —
   regn det som en kjent felle, ikke en teoretisk. Blir konteksten lang midt i en
   fase: si fra FØR kvaliteten faller.
3. **Scope-vakt:** ber brukeren om noe utenfor gjeldende fase → foreslå
   `TODO.md`, fullfør fasen i stedet for å ese. **Ikke argumenter for
   tillegget, og ikke spør hvordan det skal løses** — begge deler er esing med
   ekstra steg, og en valgmeny med «gjør det nå» blant valgene er å utføre.
   Målt 2026-08-25: vakten fyrte riktig, men gjorde begge deler.

## Snakk norsk

Alt brukeren ser skrives på vanlig norsk; et fagord brukes bare hvis det
forklares i samme setning. Ordene flyten består av forklares første gang de
dukker opp i økten: **fase** — en bit arbeid som er liten nok til at du kan
se at den virker. **fase 0** — oppsett, og en sjekk på at det så vidt virker.
**verifisere** — at DU ser at det virker, ikke at Claude sier det.
**faseslutt** — du har godkjent fasen; Claude oppsummerer og lagrer.
**planmodus** — Claude bare planlegger og endrer ingenting; du godkjenner
først. **`/clear`** — tømmer samtalen; alt viktig er lagret i filer.

Vis til ting med navn, aldri med bokstav eller nummer fra en tidligere melding
(«A og B», «punkt 3») — brukeren skal ikke måtte bla opp for å se hva svaret
gjelder. Dette gjelder også den korte teksten som følger hvert verktøykall:
brukeren leser den mens du jobber.

**Hver sjekk forklares før den kjøres.** Skal du kjøre en kommando, et skript
eller et søk for å sjekke noe — at prosjektet virker, at ingen passord ligger i
filene, at forrige økt ble avsluttet — si først i én setning hva den gjør,
hvorfor, og hva et godt utfall ser ut som. Gjelder uansett om Claude Code spør
om lov først eller ikke: uten dialog er setningen det eneste brukeren ser. Det
samme gjelder commit og push: si at du lagrer et sjekkpunkt og sender det til
GitHub før du gjør det.

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
enn navnene antyder — på Windows ikke PowerShell-verktøyet, og de hindrer ikke
at en dekket fil slettes (se «Deny-settets grenser» i maler.md). Regel og
deny-sett hører sammen som par, og ingen av dem er en sandkasse.
```

## `.claude/settings.json`

Grunnform **når fila ikke finnes fra før** — da kopieres dokumentet ordrett.
`enabledPlugins` utvides med `"web-prototype@claude-code-skills": true` for
webapp-typen og `"fint-graphql@claude-code-skills": true` når prosjektet bruker FINT:

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
  },
  "permissions": {
    "allow": [
      "Read(~/.claude/plugins/cache/claude-code-skills/**/.claude-plugin/**)",
      "Read(~/.claude/plugins/marketplaces/claude-code-skills/**/.claude-plugin/**)",
      "Bash(git status:*)",
      "Bash(git log:*)"
    ]
  }
}
```

**Hva `allow`-settet er, og hva det ikke er.** De fire oppføringene dekker
`fase-start` sine egne kall: versjonssjekken (steg 0) leser pakkens to
manifester, og sjekken av om forrige økt ble avsluttet (steg 2) kjører
`git status` og `git log` (remote-sjekken `git fetch` i samme steg er ikke tatt
med, med vilje — målingen i neste setning sier hvorfor). Målt 2026-08-27 på ARM: oppføringer som matcher
ordrett ga likevel dialog, og kall uten oppføring gikk gjennom — allowlisten er
ikke alene om å avgjøre. Oppstarten kan derfor koste noen godkjenninger; «allow
for this project» gjør valget varig. Alle fire er **lesende** — de
rører ikke prosjektets data og kan ikke skrive noe. Merk likevel at pakken her
*utvider* hva Claude får gjøre uten å spørre, i motsetning til deny-settet
lenger ned, og at de to siste er brede: all `git status` og all `git log`, ikke
bare oppstartens egne.

**Formen er målt, ikke valgt.** Kolon-prefiks (`git status:*`) matcher.
Oppføringer med en sti i prefikset gjør det ikke, uansett kolon — se grense 10.
Derfor står det ingen `git -C <sti>`-oppføring her, og derfor sjekker steg 0
ikke org-repoet.

**Oppføringene virker først etter omstart.** `.claude/settings.json` leses ved
oppstart, ikke på nytt midt i en økt. Målt 2026-08-25 på `VPC-5CG3433WMH`:
samme oppføring, samme kall og samme økt ga dialog fra den delte fila og ingen
dialog fra `settings.local.json`, som leses underveis. Skriver du fila i et
oppsett, si det — ellers møter brukeren dialoger malen nettopp har lovet er
dekket.

**Finnes `.claude/settings.json` fra før, er dokumentet over IKKE malen —
flettingen er det.** Pakken eier bare tre ting:
`extraKnownMarketplaces.claude-code-skills`, `enabledPlugins`-oppføringene som
slutter på `@claude-code-skills`, og de fire `permissions.allow`-oppføringene
over. De legges til — en eksisterende `allow`-liste utvides, aldri erstattes — og
alt annet i fila står urørt, også nøkler du ikke kjenner. Vis endringen
som før/etter, vent på klarsignal før du skriver, og etterkontroller: hver
nøkkel som fantes før, skal finnes igjen med samme verdi.

Behandler prosjektet persondata, legg til deny-settet — i tillegg til en
eksisterende `deny`-liste, aldri i stedet for den. **Les «Deny-settets
grenser» og kjør kontrollkallet under før du stoler på noe av det** — settet
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

`Read(**/.env)` står sammen med `Read(.env)` med vilje: bar form er målt å treffe
i prosjektroten og i `.claude/`, men dekningen av vilkårlige undermapper er umålt
(se grense 5), og to former koster ingenting.
Cmdlet-navn (`Invoke-RestMethod`, `Get-Content`) hører IKKE i `Bash(...)` — de
finnes ikke i et POSIX-shell, og der de finnes, dekker ikke `Bash(...)` dem.
`Bash(npx tsx scripts/*)` står som eksempel på å sperre et konkret script-kall,
men **stiformen med `/*` er utestet** — alle de målte Bash-reglene bruker
kolon-prefiksformen (`Bash(curl:*)`), og grense 5 viste nettopp at stiformer
overrasker. Verifiser den med kontrollkallet under før du stoler på den.

**Nettverksdeny må differensieres per prosjekttype.** Mønstrene treffer
*kommandonavn*, mens risikoen ligger i *målet*: et kall mot `http://localhost:5173`
(Claude sjekker at prosjektets eget endepunkt svarer — kjernen i fase 0) og et
kall mot et produksjons-API er samme kommando og helt ulike handlinger.

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
  Bar form er målt å dekke prosjektets egen `.env` (se grense 5), så regelen er
  reell. Glob-formen `Read(**/.env)` beholdes ved siden av fordi undermapper er
  umålt — ligger det en `.env` i en underkatalog, er det glob-formen som fanger
  den. Behold begge.

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

Kontrollkallet må bare kunne feile av **én** grunn: bruk en regel som IKKE har en
tilsvarende regel i CLAUDE.md. Å prøve å lese `.env` duger ikke — Claude avslår det
av eget skjønn uten å forsøke noe verktøykall, og da er Claude Code selv aldri
testet; modellens gode oppførsel maskerer om deny-regelen i det hele tatt er
koblet til. Port 9 (discard)
har ingen lytter, så «kjørte» skiller seg tydelig fra «blokkert»: et kall som når
nettverksstakken feiler på manglende tilkobling.

**Rydd opp etter deg eksplisitt.** Dummy-filene du lager for å teste fil-reglene
(`.env`, `data/dummy.csv`) er som regel nettopp de stiene `.gitignore` dekker — så
`git status` viser dem ikke, og de blir liggende usett. Skriv dem ned mens du
lager dem, og slett dem etterpå. En glemt `data/`-katalog med en dummy i ser ekte
ut for neste person som åpner prosjektet.

### Deny-settets grenser (målt 2026-08-17/18, grense 10 lagt til 2026-08-25)

**Målt å virke:**

1. **En bar tool-navn-oppføring slår ut hele verktøyet.** `"PowerShell"` alene i
   `deny` gjorde PowerShell-verktøyet utilgjengelig; å fjerne den ene linja, med
   resten av blokken intakt, ga det tilbake. På Windows er dette det ene
   deklarative grepet som faktisk lukker cmdlet-hullet — men det er
   alt-eller-ingenting: brukbart for dokumentasjons-, Node- og tsx-prosjekter,
   ubrukelig for et PowerShell-script-prosjekt som må kunne kjøre sine egne
   scripts.
2. **`Read(...)`-deny dekker mer enn Read — men ikke sletting.** Et **Write** til
   en dekket sti avvises («covered by a Read deny rule … cannot be written»), og
   en **Bash**-kommando som *leser* stien avvises også (`ls -la <dekket fil>`).
   Men `rm -f <dekket fil>` **kjørte** — samme økt, samme aktive regel, stien
   nevnt ordrett i kommandoen. Sperren avhenger altså av hvordan kommandoen
   klassifiseres, ikke av at stien forekommer i strengen. Om mekanismen er en
   generell klassifisering eller at slettekommandoer rett og slett faller utenfor
   Read-scopet, er ikke skilt — utfallet er det samme: **`Read(...)`-regler gir
   delvis konfidensialitet og INGEN integritetsbeskyttelse.** Claude kan slette
   en fil den ikke får lov til å lese.
3. **Deny-sjekken går foran eksistenssjekken.** En dekket sti som ikke finnes gir
   «denied», ikke «does not exist». Nyttig når du tester: «blokkert» kan ikke
   forveksles med «feil filnavn».
4. **En `ask`-nøkkel forkaster ikke blokken.** Målt med en `ask`-liste i samme
   `permissions`-objekt: deny virket fortsatt.
5. **Bar filnavn-form virker, og er ikke ankret til `.claude/`.** En bar regel
   `Read(fil.txt)` blokkerte fila både i prosjektroten og i `.claude/` — målt på
   to ulike filnavn, i to økter, med en kontroll i samme økt som bekreftet at
   konfigurasjonen var stabil mellom dem. `Read(.env)` er altså ikke dødvekt.
   **Umålt:** om bar form dekker vilkårlige undermapper — bare rot og `.claude/`
   er testet. Skal en fil dekkes uansett hvor den ligger, bruk glob-formen
   `Read(**/fil.txt)`.

   *En tidligere hypotese om at bare filnavn resolveres relativt til
   `settings.json`s katalog er avkreftet av denne målingen. Den hvilte på én
   avvikende observasjon som ikke lot seg reprodusere — og som var gjort under en
   konfigurasjon som aldri ble verifisert ordrett før kjøring. Lærdommen er verdt
   mer enn funnet: en observasjon fra en uverifisert konfigurasjon kan ikke
   gjenbrukes senere, uansett hvor godt den passer en modell du bygger etterpå.*

**Målt å ikke virke, eller å dekke mindre enn navnet antyder:**

6. **Matcherne er verktøy-scopet.** Samme URL, samme økt: `curl` i **Bash** ble
   blokkert av `Bash(curl:*)`, mens `Invoke-RestMethod` i **PowerShell**-verktøyet
   kjørte — `Bash(...)` dekket det ikke. Cmdlet-navn i `Bash(...)` er derfor
   dødvekt.
7. **`PowerShell(<kommando>:*)`-formen stoppet ingenting**, selv om scopet nå er
   bekreftet gjenkjent (punkt 1). Gjenstående forklaring: verktøyet pakker
   kommandoen i en preamble på et par hundre tegn, så kommandonavnet står ikke
   først og prefiksmønsteret treffer ikke. Praktisk — mønsterformen er ubrukelig;
   bare tool-navn-formen virker.
8. **Bash-dekningen er ikke filsystemvern.** Samme økt: `ls -la <dekket fil>` ble
   avvist, mens `ls -la` på en udekket katalog kjørte og eksponerte filnavn og
   størrelser. Alt som når fila uten å nevne den — kataloglisting, globbing, et
   script som leser den — er ikke dekket. Og som grense 2 viser, er heller ikke
   alt som *nevner* den dekket. Dette er den viktigste enkeltgrensen: reglene
   fanger noen av måtene Claude kan nå stien på, ikke at innholdet faktisk nås
   eller fjernes.
9. **Navnebaserte mønstre kan prinsipielt ikke bli komplette.** Aliaser er bare
   toppen (`irm`, `iwr`, `curl.exe`, `gc`, `type`, `Select-String`, `Import-Csv`).
   Verre er omveiene uten kommandonavn i det hele tatt — `[Net.WebClient]`,
   `Start-BitsTransfer`, `[IO.File]::ReadAllText()` — og indirekte kall
   (`$c='irm'; & $c`), der navnet først finnes ved kjøring. Listen blir aldri
   uttømmende; ikke lat som den er det.
10. **En sti i et `Bash`-prefiks matcher ikke.** Gjelder `allow` like mye som
    `deny`. `Bash(git status:*)` matcher, mens
    `Bash(git -C ~/.claude/... rev-parse:*)` ikke gjorde det for kallet skrevet
    med nøyaktig samme tilde-sti. Samme kall og samme matcher i full sti
    (`/c/Users/<navn>/...`) matchet. Målt 2026-08-25 på `VPC-5CG3433WMH`, med en
    kontrollinje i samme runde som bekreftet at `settings.local.json` leses midt
    i en økt — så de to utfallene er sammenlignbare.
    **Konsekvensen er praktisk:** formen som virker bærer brukernavnet og kan
    aldri stå i en delt `settings.json` eller i en mal. Trenger et prosjekt en
    git-kommando mot en annen katalog uten dialog, hører linja i
    `settings.local.json`, som er per maskin og gitignorert.
    **`Read` oppfører seg annerledes:** der matcher tilde og full sti likt, og
    `**` dekker mellomliggende ledd — begge deler målt samme dag.

**Hva dette betyr for løftet i CLAUDE.md:** deny-settet er ETT lag
risikoreduksjon, ikke en sandkasse. Regelen i CLAUDE.md («Claude forbereder
kommandoen, brukeren kjører den») bærer mesteparten av vekten.

Grensene har ulik karakter, og det bør leses samlet: **filsiden er sterkere enn
navnene antyder på lesesiden** (grense 2 og 3 — deny treffer også Write og
lesende Bash-kommandoer), men **den verner ikke integritet** (grense 2 — `rm`
mot en dekket sti kjørte) og **stopper ikke det som når fila uten å nevne den**
(grense 8). **Nettsiden på Windows har bare det grove grepet** (grense 1) eller
ingenting (grense 7).

En verktøy-agnostisk PreToolUse-hook — den ser `tool_name` og hele
kommandostrengen, og er testbar fordi den kan logge — er laget som gir *selektivt*
vern der bar tool-navn-deny bare gir alt-eller-ingenting. Den er ikke i pakken
ennå og skal ikke loves i CLAUDE.md-teksten før den er. Også den fanger tekst, ikke
kjøretidsnavn: absolutt isolasjon krever sandbox eller container.

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
