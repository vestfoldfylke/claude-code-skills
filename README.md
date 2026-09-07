# Claude Code-skills — Vestfold fylkeskommune

Faseinndelt arbeidsflyt for Claude Code: **planen skrives først, én fase
implementeres om gangen, du verifiserer før neste fase starter — og prosjektet
husker alt som skjedde mellom øktene.** I tillegg: skills for web-prototyping
(SvelteKit + Designsystemet) og FINT GraphQL.

Internt repo for Vestfold fylkeskommune. Skal ikke deles utenfor organisasjonen.

## Hvorfor faser?

1. **Kvalitet** — modellkvalitet degraderer i svært lange samtaler. En frisk økt
   som starter med et skarpt statusdokument slår en oppblåst tråd. Dette, ikke
   tokensparing, er hovedgrunnen.
2. **Tokens og kostnad** — hver økt starter med STATUS + plan i stedet for hele
   historikken. Kortere kontekst gir også raskere svar.
3. **Feil fanges nær årsaken** — du verifiserer hver fase før neste starter, så
   feil oppdages i fasen de oppsto — ikke i en stor-smell-integrasjon til slutt.
4. **Sporbarhet** — én fase = én commit/push. Git-historikken speiler planen,
   og `kunnskap/logg.md` forklarer hvorfor.
5. **Overtakbarhet** — prosjektets hukommelse ligger i filer, ikke i en
   chattetråd. En kollega (eller du om tre uker) kan plukke opp midt i.

## Installasjon

**Forutsetninger:** Claude Code (CLI eller VS Code-utvidelsen), git, og
GitHub CLI innlogget (`gh auth login`) med en konto som er **medlem av
`vestfoldfylke` på GitHub** (tilgang til claude.ai er ikke det samme — spør
IT om GitHub-medlemskap hvis du mangler det).

**Installasjonen gjøres i en terminal** (VS Codes innebygde terminal holder) —
`/plugin` finnes ikke som slash-kommando i VS Code-utvidelsens chat. Kjør:

```
claude plugin marketplace add vestfoldfylke/claude-code-skills
claude plugin install faseflyt@claude-code-skills
claude plugin list
```

Siste linje skal vise `faseflyt`. Foretrekker du den interaktive formen: start
`claude` i terminalen og skriv `/plugin marketplace add …` og `/plugin install …`
der — samme resultat. Utvidelsen plukker opp pluginene etterpå, siden begge
leser samme `~/.claude`-konfigurasjon.

Det er alt. `faseflyt` er den alle trenger. I tillegg, etter behov:

```
claude plugin install web-prototype@claude-code-skills   # bygger du webapper/prototyper
claude plugin install fint-graphql@claude-code-skills    # jobber du mot FINT
```

Ingenting sendes til noen ekstern tjeneste — «marketplace add» kloner bare
dette repoet til din maskin. Oppdatere senere:
`claude plugin marketplace update claude-code-skills`.

**Bruker du claude.ai eller Claude Desktop-chat (ikke Claude Code)?** Da får du
ikke disse skillene. Pakken distribueres kun som plugin i Claude Code — det
finnes ingen versjon i skill-katalogen på claude.ai.

## Trenger du alt dette?

Nei. Tommelfingerregel: bruk `/faseflyt:nytt-prosjekt` når prosjektet skal
overleve `/clear` **minst én gang**. Et script du skriver ferdig på én
ettermiddag trenger ikke læringssløyfen — installer heller `web-prototype`,
beskriv hva du vil ha, og bygg. Vil du tenke gjennom valgene først, er
`/faseflyt:grill-me` nyttig helt alene.

Vokser prototypen til noe som går over flere økter, kjører du
`/faseflyt:nytt-prosjekt` i mappa som allerede finnes: den oppretter bare det
som mangler, og rører ikke det du har.

## Kom i gang: ditt første prosjekt

Slik ser et prosjekt ut fra tom mappe til første fase i mål. Det du skriver,
i rekkefølge:

1. **`/faseflyt:nytt-prosjekt`** — Claude spør om prosjekttype (webapp, script,
   dokumentasjon eller API/backend), om prosjektet behandler persondata, og
   setter opp strukturen:

   ```
   mittprosjekt/
   ├── kunnskap/
   │   ├── STATUS.md      ← «hvor er vi» — leses først i hver økt
   │   ├── plan.md        ← planen (kommer i steg 3)
   │   ├── logg.md        ← datert logg over alt som skjer
   │   ├── laering.md     ← Claudes selvvurderinger
   │   └── sikkerhet.md   ← sjekkliste
   ├── TODO.md            ← «må huskes, men ikke nå»
   ├── CLAUDE.md          ← prosjektregler
   └── .claude/settings.json
   ```

2. **`/faseflyt:grill-me`** — Claude intervjuer deg nådeløst om prosjektet, ett
   spørsmål om gangen, til beslutningene er låst. Frivillig, men anbefalt: det
   er billigere å svare på spørsmål nå enn å rive opp kode senere.

3. **Bytt til planmodus** (Shift+Tab i Claude Code) og beskriv hva som skal
   bygges. Claude skriver en faseplan — hver fase liten nok til å verifiseres
   for seg. Når du godkjenner planen, kopieres den til `kunnskap/plan.md`.
   Glemmer du planmodus, sier Claude fra — det er en av prosjektreglene.

4. **Fase 1 implementeres.** Claude bygger, du følger med.

5. **Du verifiserer.** Kjør appen, klikk deg gjennom, test. Dette er porten:
   ingen ny fase før du har sagt at denne virker.

   Virker det ikke: beskriv feilen, og arbeidet fortsetter i samme fase. Det er
   normalt, ikke et avvik — `fase-slutt` kjøres først når du har bekreftet at
   det virker.

6. **`/faseflyt:fase-slutt`** — Claude oppdaterer logg og STATUS, vurderer sin
   egen arbeidsmåte, sjekker at prosjektet fortsatt virker, kjører en rask
   sikkerhetssjekk, committer og pusher.

7. **`/clear`** — tøm samtalen. Alt som er verdt å huske ligger nå i filer.

8. Neste dag: **`/faseflyt:fase-start`** — Claude leser STATUS og planen,
   oppsummerer hvor dere er, og foreslår neste steg. Ingen «hva var det vi
   holdt på med?».

Gjenta 4–8 til planen er levert.

## Innholdet i pakken

| Skill | Hva den gjør | Når |
|---|---|---|
| `/faseflyt:nytt-prosjekt` | Setter opp fase-strukturen i et nytt eller eksisterende prosjekt | Én gang per prosjekt |
| `/faseflyt:grill-me` | Nådeløst intervju som låser beslutningene før koding | Før planen skrives |
| `/faseflyt:fase-start` | Leser STATUS + plan, oppsummerer, foreslår neste steg | Første handling i hver økt |
| `/faseflyt:fase-slutt` | Logg, STATUS, selvvurdering, sikkerhetssjekk, commit | Når du har verifisert en fase |
| `/faseflyt:hjelp` | Flyten, kommandoene og hvor du står nå | Når du har glemt flyten |

| Plugin | For hvem |
|---|---|
| `web-prototype` | Alle som bygger webapper/prototyper — SvelteKit + Designsystemet, brukertestingsklart |
| `fint-graphql` | Alle som integrerer mot FINT — datamodell, spørremønstre, fallgruver |

## Filene i `kunnskap/`

| Fil | Rolle | Livssyklus |
|---|---|---|
| `STATUS.md` | Oppstartsdokumentet — «hvor er vi, hva er neste» | **Overskrives** ved hver faseslutt |
| `plan.md` | Den godkjente planen | Endres kun når planen faktisk endres |
| `logg.md` | Datert arkiv: hva skjedde, hvilke valg ble tatt og hvorfor | Append-only, nyeste øverst |
| `laering.md` | Claudes selvvurderinger per faseslutt | Append-only, nyeste øverst |
| `sikkerhet.md` | Sjekkliste tilpasset prosjekttypen | Oppdateres ved nye dataflater |
| `arkitektur.md` | Beslutninger som ikke er selvforklarende fra koden | Kun kodeprosjekter |

Ikke rediger STATUS for hånd — den skrives av `fase-slutt` og skal alltid
speile siste faseslutt. Vil du korrigere noe, si det til Claude i økten.

## Læringssløyfen

Ved hver `fase-slutt` vurderer Claude sin egen arbeidsmåte og skriver 1–3
konkrete korrigeringer («delegér filsøk til Explore — tre Grep-runder kostet
15k tokens»). De overlever `/clear`: neste `fase-start` leser dem og forplikter
seg til dem, og neste `fase-slutt` sjekker om de ble fulgt. Punkter som går
igjen tre ganger blir permanente regler i prosjektets CLAUDE.md. Prosjektet
blir altså målbart bedre å jobbe i for hver fase — ikke bare større.

## Prosjekttypene

| Type | Kjennetegn |
|---|---|
| Webapp/prototype | SvelteKit + Designsystemet, `web-prototype` deklareres automatisk |
| Script/automatisering | PowerShell/bash/tsx, ingen designdel. Utvikler du på Windows: encoding-reglene inn fra dag 1 |
| Dokumentasjon/utredning | Ingen kode, ingen arkitektur-fil, sikkerhetssjekk = datahåndtering |
| API/backend | Full sikkerhetssjekkliste, arkitektur-dokumentasjon påkrevd |

## Overta andres prosjekt

Klon repoet, installer pakken med de to kommandoene over, åpne prosjektet og
kjør `/faseflyt:fase-start` — så fortsetter du der forrige person slapp.

Kopier **aldri** disse skillene inn i prosjektrepoet: kopier råtner når pakken
oppdateres. Prosjektets `.claude/skills/`-mappe er kun for prosjektets egen
domenekunnskap (API-særegenheter o.l.).

## Gi tilbakemelding

Er noe i selve arbeidsflyten klønete? Opprett et issue i dette repoet —
`fase-slutt` tilbyr det automatisk når en av Claudes selvvurderinger handler om
skillene i stedet for prosjektet. Slik blir pakken bedre av å bli brukt.

## Vanlige spørsmål

**Må jeg bruke alle fire skillene?**
Nei. `grill-me` fungerer alene. Men `fase-start`/`fase-slutt` gir bare mening
sammen med strukturen `nytt-prosjekt` setter opp.

**Jeg har allerede et prosjekt i gang — kan jeg ta dette i bruk?**
Ja. Kjør `/faseflyt:nytt-prosjekt` i prosjektet — den oppretter bare det som
mangler og rører ikke eksisterende filer.

**Claude spør om lov til å kjøre ting — kommer den til å mase hele tiden?**
Nei. Dialogene gjelder å *kjøre* noe: et script, et program, en `git commit`.
Å lese filer spør den normalt ikke om, og før hver sjekk sier den i én setning
hva den gjør. Velger du «allow for this project», står valget og kommer ikke igjen.

**Hva er forskjellen på `/clear` og `/compact`?**
`/clear` tømmer samtalen helt (riktig etter `fase-slutt` — alt viktig ligger i
filer). `/compact` komprimerer samtalen og beholder tråden (kun midt i en fase
som ikke rekker å fullføres).

**Hvorfor heter kommandoene `/faseflyt:fase-start` og ikke `/fase-start`?**
Skills fra en plugin får pluginnavnet som prefiks. Det hindrer navnekollisjoner
med dine egne skills.

**Hvorfor kjører `/faseflyt:fase-start` noen ganger på en annen modell enn jeg har valgt?**
Skrevet som kommando kjører skillen alltid på Sonnet — det står i dens egen
definisjon. Sagt i vanlig tekst («start økten») kjører den på øktens modell.
Derfor ber `fase-start` deg alltid skrive `/model` selv.

**Hvordan oppdaterer jeg pakken?**
`/plugin marketplace update claude-code-skills`. Endringer står i
[CHANGELOG.md](CHANGELOG.md).

**Hvordan skrur jeg dette av igjen?**
I terminalen, ikke i VS Code-chatten:

```
claude plugin disable faseflyt@claude-code-skills     # skru av, behold installasjonen
claude plugin uninstall faseflyt@claude-code-skills   # fjern pluginen
claude plugin marketplace remove claude-code-skills   # fjern hele pakken
```

Filene i `kunnskap/` blir liggende — vanlig markdown, slett eller behold dem
som dokumentasjon.

## For administrator

Sentral utrulling og vedlikehold:
[docs/installasjon.md](docs/installasjon.md). Tredjepartsattribusjon:
[NOTICE.md](NOTICE.md).
