# Changelog

Semver per plugin. Endringer som brekker eksisterende `kunnskap/`-struktur i
scaffoldede prosjekter markeres **BRYTENDE** med migreringsnotat — `fase-start`
skal ellers alltid tåle eldre struktur.

## 0.9.2 — 2026-09-08

Ingen plugin endrer oppførsel; bumpen er fordi marketplace-manifestet er rørt.

- **README: manuell installasjon som reserveløsning** for maskiner med policyen
  «No external marketplaces are allowed» — de fem skill-mappene kopieres til
  `~/.claude/skills/`, uten prefiks og uten automatisk oppdatering.
  Forutsetningene rettet: `gh auth` og GitHub-medlemskap trengs ikke for et
  åpent repo.
- **Siste «internt»-påstander fjernet** etter åpningen 2026-09-07: README,
  `NOTICE.md` og beskrivelsen i `marketplace.json`.

## 0.9.1 — 2026-09-07

Repoet er åpent fra i dag. Ingen plugin endrer oppførsel; bumpen er fordi tre
pakkefiler er rørt.

- **Maskinnavn erstattet med alias** i hele repoet — `fase-start`, `fase-slutt`,
  `maler.md`, CHANGELOG og `kunnskap/`. Målinger navngir nå
  `hjemme-win-x86`/`kontor-win-arm`; tabellen mot hostname er gitignorert.
  Renhetssjekken har fått en hard regel mot organisasjonens hostnavnmønster.
- **Kravene til `kunnskap/` strammet:** initialer og alias, ikke fulle navn og
  hostnavn — mappa var «internt arbeidsarkiv», nå er den åpent lesbar.
- **Historikken er skrevet om** (forfatteradresse i alle commits). Eksisterende
  kloner må hentes på nytt: `git fetch` + `git reset --hard origin/main`, eller
  klon på nytt.
- **`LICENSE` (MIT)** lagt til — uten lisens kunne andre lese, men ikke bruke.

## 0.9.0 — 2026-09-05

`faseflyt` 0.9.0. Fryse-runden før samlingen 14. september: alle planens
nummererte faser er levert, og verifiseringslista er gått gjennom punkt for
punkt (BK). 1.0 avgjøres av samlingen, slik planen definerer den.

- **Repoet satt åpent 2026-09-07 (BK), ingen bump.** README kaller det ikke
  lenger «privat»; kravet om `gh auth`/org-medlemskap er strøket i
  `docs/installasjon.md`, gruppeleder-sjekklisten og planen, og planens
  synlighetspunkt er merket omgjort. Åpenheten løser *ikke* sperren mot
  eksterne marketplaces — den er policy på kildeklassen, og løses i managed
  settings. Sikkerhetsvurdering av konsekvensene samme dag.
- **README strammet inn, ingen bump** (README endrer ikke hva en plugin gjør).
  Installasjonen sier «i en terminal» først og skriver ut `claude plugin`-formene,
  med `claude plugin list` som kvittering — formene observert i `--help` på
  `hjemme-win-x86` 2026-09-05. «Overta andres prosjekt» lovet at
  `.claude/settings.json` gir et installasjonstilbud ved kloning; det er
  motbevist i planens verifiseringspunkt 9, og seksjonen sier nå bare det som
  er målt: klon, installer, `fase-start`. Samme løfte står fortsatt i
  `nytt-prosjekt` steg 6 — måles på samlingen (`kunnskap/gruppeleder-sjekkliste.md`)
  før skillen rettes. Tre FAQ-svar kortet ned.
- **Org-katalogen er droppet som kanal** (BK). Pakken distribueres bare som
  plugin. README sier det rett ut til claude.ai-brukere; `docs/installasjon.md`
  har mistet kanaltabellen, opplastingsseksjonen og PR-steget (repoet bestemmer
  sin egen flyt). «Org-skills» heter nå «felles skills til bruk i Vestfold» i
  `nytt-prosjekt`.
- **`nytt-prosjekt` tørrkjørt for dokumentasjons- og API-typen og i et
  eksisterende ikke-tomt prosjekt** (`hjemme-win-x86`, hostname kjørt; mot
  0.8.3 i isolerte scratch-kataloger). Alle sjekkpunkter grønne — ingen
  `arkitektur.md` for dokumentasjon, påkrevd for API; `web-prototype` bare
  deklarert for webapp; eksisterende `CLAUDE.md`, `settings.json` og
  `.gitignore` utvidet uten at én nøkkel gikk tapt. Funnene i skillens egne
  instrukser rettet her:
  - `prosjekttyper.md` sa fortsatt «inn i STATUS» om encoding-reglene — rest
    fra før 0.6.1; nå `CLAUDE.md`.
  - Windows-snutten har fått egen overskrift (`## Windows og PowerShell`) og et
    entydig sted: etter hele CLAUDE.md-blokken. «Rett etter
    fase-arbeidsflyt-avsnittet» ble lest på to måter av tre uavhengige
    kjøringer.
  - Kontrollkall-regelen i steg 6 gjelder nå persondata-settet, og sier rett
    ut at webapp- og API-typen ikke har en test med bare én feilgrunn — `curl`
    skal ikke sperres der. Før krevde regelen noe `prosjekttyper.md` forbød.
  - Eksempelbeslutningen «AB, git-remote» i plan-malen er en
    `<...>`-plassholder — ordrett kopiering ga hvert prosjekt en fiktiv
    beslutning.
  - Læringsmalen sier at eksempelseksjonen er formatet og står til første
    faseslutt; plattform-spørsmålet står i spørsmålsrunden i steg 2;
    `.gitignore`-regelen dekker «repo og fil finnes» og tar med
    `.claude/settings.local.json`; `allow`/`deny` utvides uten duplikater;
    pakkens avsnitt legges UNDER eksisterende CLAUDE.md-avsnitt; API-typens
    arkitekturkrav skrives inn i `arkitektur.md`.
- **Opprydding utenfor pakken:** fire issues lukket som forkastet (#3, #9,
  #10, #15); verifiseringspunktene 5, 9, 10 og 11 merket DROPPET i planen med
  dato; to promoteringsforslag avgjort — ett inn i `CLAUDE.md` som sjekkpunkt
  før push, ett arkivert.

## 0.8.3 — 2026-09-05

`faseflyt` 0.8.3 (fase 8: `fase-start`, `hjelp` og README, kort utdata,
instruks sist).

- **Modell-instruksen i `fase-start` står nå alene som siste linje**, uthevet
  og formulert som handling («Skriv `/model sonnet` nå, før du gir
  klarsignal.»). Skillen påstår aldri hva økten kjører på. Belegg: linja lå
  tidligere midt i teksten og ble ikke handlet på; én gang påsto den «Sonnet»
  mens økten sto på Opus.
- **Tak på ti linjer for `fase-start`s rene tilfelle**, fasebeskrivelsen kuttet
  til én linje — planen har resten. Målt: 0.6.1 lå på ~15 linjer.
- **Kommandoform vs. trigger-frase dokumentert** i `fase-start`, `hjelp` og
  README: skrevet kommando kjører skillen på dens `model: sonnet`-felt,
  trigger-frase i vanlig tekst kjører på øktens modell.
- **README sier hvem pakken er for:** `/faseflyt:nytt-prosjekt` når prosjektet
  skal overleve `/clear` minst én gang — et script på én ettermiddag trenger
  ikke læringssløyfen.

## 0.8.2 — 2026-09-05

`faseflyt` 0.8.2. Etter tørrkjøring av 0.8.1 i `test-faseflyt` økt 10
(`hjemme-win-x86`, hostname kjørt; Sonnet via kommandoformen): fem av seks
holdt, 3 min / 18k tokens — halvert fra 0.8.0 av turplanen alene.

- **Turplanens tur 4 nevner STATUS-linjetallet.** Observert: `wc -l` ble kjørt
  i tur 3 og tallet aldri skrevet — tur 4 sa bare «tidslinja inn i
  logginnslaget». Modellen fulgte turplanen; turplanen manglet ordet.
- **`kvalitetsport` i ordlekkasje-lista.** Observert som overskrift i to
  logginnslag på rad, arvet fra en STATUS skrevet av en eldre versjon.

## 0.8.1 — 2026-09-05

`faseflyt` 0.8.1. Rettelser etter tørrkjøring av 0.8.0 i `test-faseflyt` økt 9
(`hjemme-win-x86`, hostname kjørt; Sonnet via kommandoformen). Fire av seks
verifiseringspunkter holdt; målt 6 min etter skillens klokke, over 7 etter
brukerens, og over 37k tokens for en økt som ikke hadde gjort noe.

- **Turplan.** Sju turer, med hva som deler melding: lesninger og `date` i én,
  de tre skrivingene i én, tellinger og alle søk og `date` i én, så rettinger,
  `git add`, commit, push. «Færre rundturer» sto i 0.8.0 som prosaregler; det
  som manglet var å si hvilke kall som går sammen. Én-adresse-sjekken var selv
  skrevet som ett `Grep` per punkt — nå ett mønster, én tur.
- **«Ikke utløst» i et prosjekt uten plan strykes.** Observert: skillen fant opp
  et fjerde utfall («tatt ut av STATUS, ikke strøket, videreført i arkivet») og
  en fotnote om det, i stedet for å stryke.
- **0–3 nye punkter, ikke 1–3.** Observert: to «nye punkter» uten et brudd bak
  seg, i en økt der ingenting gikk galt.
- **Rapportlinja for sikkerhetssjekken gis ordrett.** Observert: «omtal søket
  uten ordet» sto i instruksen, og loggen fikk ordet likevel, pluss et nytt navn
  på sjekken. `røyktest` er lagt til ordlekkasje-lista — observert i samme
  logg.
- **Portbevis:** `<command-name>`-taggen i inputen, når den finnes; fritekst-søk
  bare når den mangler. Ideen kom fra tørrkjøringens egen selvvurdering.

## 0.8.0 — 2026-09-05

`faseflyt` 0.8.0. Fase 7 i planen: `fase-slutt` får ærlig ratchet og færre
rundturer. Belegget er fem faseslutt i `klengenavn` og to i dette repoet
(2026-09-04/05, `hjemme-win-x86`, hostname kjørt). Ingen tørrkjøring av 0.8.0
ennå — den er fasens verifisering.

- **Tredje utfall i ratchet-en (steg 2a/2b).** *Fulgt* strykes, *brutt igjen*
  videreføres med rundetall +1, *ikke utløst* videreføres uten tall eller
  strykes hvis ingen gjenstående fase kan utløse det. Bare «brutt igjen» teller
  mot tredje runde. Observert: et punkt nådde «3. runde» uten å ha blitt prøvd
  én gang. STATUS-malen i `maler.md` sier det samme.
- **Én adresse per regel.** Et punkt bor i STATUS *eller* i prosjektets
  `CLAUDE.md`. Promoteres det, tas det ut av STATUS i samme redigering; hvert
  «må vite»-punkt sjekkes mot `CLAUDE.md` før det skrives. Observert: fire av
  tolv punkter i dette repoets STATUS sto begge steder.
- **STATUS telles, ikke anslås:** tak 45 linjer, `wc -l` etter skriving, tallet
  i loggen. Målt: 42–47 over fem faseslutt; «~30» var uoppnåelig.
- **Issue-kriteriet (steg 2e) utvidet** med «pakken kunne ha vernet mot det i
  neste prosjekt». Observert: nettleser-forsøket ble avvist som «ikke pakkens
  sak» fordi det kom fra en generell skill — og ble 0.7.0 likevel.
- **Steg 5 hopper over sjekken** når den var grønn i samme økt etter siste
  kodeendring, og sier det med klokkeslett. Målt: 51 s på en sjekk som var
  grønn åtte minutter tidligere.
- **Steg 6 omtaler søket uten å sitere søkeordet.** Observert: loggens egen
  setning var eneste treff, to faseslutt på rad.
- **Ordlekkasje-søk** etter steg 1–3 i det skillen selv skrev, mot en liste som
  bare vokser med observerte ord.
- **Planen kollapser ferdige faser** til én linje med klarsignal, og et endret
  verifiseringspunkt endres i `plan.md`, ikke bare i STATUS.
- **Tid fra kommando til FERDIG føres** via `date` ved porten og før commit.
  Koster to kall og én `Edit` per faseslutt — målingen er prisen verdt til
  tallet foreligger.

## 0.7.1 — 2026-09-05

`faseflyt` 0.7.1. Rettelse etter tørrkjøring av 0.7.0 i `faseflyt-0.7-test`
(`hjemme-win-x86`, hostname kjørt).

- **Kontrollkallet for nettleser-deny er tatt ut.** 0.7.0 sa at
  `npx playwright --version` var trygt å prøve fordi `npx` bare henter
  npm-pakken. Det var en hypotese skrevet som fakta: `playwright` laster ned
  nettlesere i install-scriptet. Og kallet ber Claude bryte forbudet —
  observert: ny økt avslo ordren med henvisning til regelen, to ganger samme
  dag. Forbudet er laget som testes; deny-settet er andre lag med målt form og
  uprøvd streng. Malen, steg 6 og planens verifiseringslinje sier det.

## 0.7.0 — 2026-09-05

`faseflyt` 0.7.0. Fase 6 i planen: funnene fra tørrkjøringen av `klengenavn`
(fase 0–4, 2026-09-04/05, `hjemme-win-x86`, hostname kjørt) som gjelder
`nytt-prosjekt`.

- **Deny mot nettleserinstallasjon i `settings.json`-grunnformen**, for alle
  prosjekttyper og uavhengig av persondata: `npx playwright`, `npx puppeteer`
  og `npm install` av pakkene. Observert: Claude ba om `npx playwright install
  chromium` for å sjekke layout på smal skjerm selv; senere samme dag ble det
  installert, og Defender flagget kjøringen. Pakken eier nå fire ting i fila.
  Kolon-prefiksformen er den målte; jokertegn midt i mønsteret er merket
  utestet, og kontrollkallet (`npx playwright --version` skal avvises) står i
  malen og i steg 6.
- **CLAUDE.md-avsnittet forbyr det samme:** «Claude installerer aldri verktøy
  for å se resultatet selv». Definisjonen «verifisere = at DU ser det» stoppet
  ikke impulsen når fasen inviterte til den; bare regler Claude Code selv
  håndhever holder, så deny-settet og forbudet står sammen. Etterkontrollen i
  steg 8 sjekker at forbudet er med.
- **Plan-malen og Fasesnittet viser feilformen** «layouten sjekkes på smal
  skjerm» — en oppgave uten den som gjør den leses som Claudes — og riktig form
  «du ser at siden holder i et smalt vindu».
- **Encoding-snutten skrives uansett maskin:** full snutt på Windows (som i
  0.6.1), to linjer på Mac og Linux — ny seksjon i `windows.md`, steg 8 og
  `prosjekttyper.md` peker dit. Et Mac-prosjekt klones av en Windows-kollega.
- **STATUS-malen:** tak 45 linjer, verktøyversjoner hører i loggen, og et
  «må vite»-punkt som alt står i CLAUDE.md hører ikke i STATUS. Målt: fem
  faseslutt i `klengenavn` ga 45 → 47 → 43 → 44 → 42; «~30» er uoppnåelig med
  malens faste deler. `fase-slutt` får tellingen i neste versjon.

## web-prototype 0.1.4 — 2026-09-05

- **Designsystemet er responsivt ut av boksen** — nytt designprinsipp (punkt 9).
  Observert i `klengenavn` fase 4 (Sonnet, `hjemme-win-x86`): skillen sa ikke
  at komponentene skalerer selv, så mobil-layout ble behandlet som noe som
  måtte bygges og testes — og det var det som ledet til Playwright-forsøket.
  Prinsippet sier også at Claude aldri installerer nettlesere eller
  skjermbildeverktøy for å sjekke layout.

## web-prototype 0.1.3 — 2026-09-05

`web-prototype` 0.1.3. Skillen oppdatert til det Svelte CLI (`sv`) 0.17.0 og
Designsystemet 1.21.0 faktisk gjør, målt 2026-09-04/05 på `hjemme-win-x86` (hostname kjørt)
ved å lese npm-pakkene og kjøre tokens-verktøyet i en scratch-mappe; bekrefter
tørrkjøringsfunnene fra 2026-08-30 (`test-oppgave-samling`, ARM-maskinen) og
2026-09-04 (`klengenavn`).

- **`.gitignore` overlever `sv create` i et eksisterende prosjekt.** `sv create`
  kopierer malens `.gitignore` rett over prosjektets, og med `--no-dir-check`
  (flagget som gjør kommandoen kjørbar fra Claude Code) skjer det uten spørsmål.
  Observert i `klengenavn`: den committede fila mistet kommentarene og
  `dist/`-linjen og ble gjenopprettet for hånd. Steg 1 skiller nå tom mappe fra
  eksisterende prosjekt, viser kommandoen slik den faktisk ble kjørt, og krever
  at `.gitignore` leses før og flettes etter, med før/etter vist. Nevnt der også:
  tom-mappe-sjekken i `sv` ser bort fra alt som begynner med `.git`, så en mappe
  med bare `.git` og `.gitignore` får ingen advarsel selv med spørsmålet på.
- **`svelte.config.js` finnes ikke lenger i det `sv` skriver.** Adapter og
  `compilerOptions` sendes til `sveltekit()` i `vite.config.ts`. Prosjektstruktur
  og steg 4 viser fila slik `sv` genererer den, adapter-byttet for statisk deploy
  på samme sted, og én linje om eldre prosjekter som fortsatt har `svelte.config.js`.
- **Hovedfarge byttes med Designsystemets tokens-verktøy, ikke med én variabel.**
  Fargeskalaen er 16 hardkodede verdier uten basefarge (funn 2026-08-30). Nytt
  steg 9: `designsystemet.config.json` + `tokens create` + `tokens build`, og
  `design-tokens-build/theme.css` erstatter `@digdir/designsystemet-css/theme` i
  layouten. Kommandoflaggene for farger er avviklet til fordel for config-fila
  (målt mot `--help` 1.21.0). Fargeregelen under «What you must NEVER do» peker dit.
- **Favicon:** `sv` legger ikonet i `src/lib/assets/favicon.svg` og lenker det
  fra layouten; skillens `app.html` pekte på `static/favicon.png`, som ikke
  finnes lenger. Lenken er flyttet til layout-malen i steg 7.
- Malnavnet i steg 1 rettet fra «Skeleton project» til «SvelteKit minimal».

## 0.6.1 — 2026-09-04

`faseflyt` 0.6.1. Funn fra første tørrkjøring av 0.6.0: `klengenavn` (webapp)
fra tom mappe gjennom fase 0, fase-slutt og fase-start, på `hjemme-win-x86`
(hostname kjørt); oppsettet på Fable 5.1, resten på Sonnet.

- **Windows-snutten bor i CLAUDE.md, ikke i STATUS.** fase-slutt overskrev
  STATUS og byttet encoding-regelen, commit-F-regelen og PowerShell
  5.1-manglene mot en peker til `laering.md`, som ikke hadde dem. Samme lærdom
  0.6.0 brukte på tre arbeidsflytregler: en regel som skal gjelde alltid,
  ligger der den alltid lastes, og STATUS overskrives per design. Forskjellen
  er at denne er plattformspesifikk — bare Windows-prosjekter får den (~19
  linjer per økt). `nytt-prosjekt` skriver snutten i steg 8, `windows.md` og
  STATUS-malen peker dit. fase-slutt: et punkt tas ut av STATUS bare med en
  peker som er lest; står snutten i STATUS i et eldre prosjekt, følger den med
  ordrett eller flyttes med klarsignal, én gang. fase-start tåler begge.
- **fase-slutt tilbyr issue når et punkt navngir en skill eller oppskrift**
  eller sier at en instruks var feil, og stegrapporten sier alltid om tilbudet
  kom. Observert: to punkter navngav `web-prototype`, ingen tilbud, og
  rapporten viste det ikke.
- **fase-slutt søker etter fasens overskrift i loggen før den skriver.** Et
  innslag skrevet underveis i fasen lå nederst; toppen-lesingen fra 0.6.0 ser
  det ikke i en ny økt. Søket hindrer dobbeltføring, lesingen sparer tokens.
- **Modellvalg i laget som lastes hver økt:** CLAUDE.md-avsnittet sier at
  fasene går på Sonnet og planarbeid på tyngste modell; `nytt-prosjekt` sier
  det etter godkjent plan, `fase-start` per fase. Gjelder øktens hovedmodell,
  ikke Explore-subagenter (lagt på vent av BK 2026-09-04). Skillene kan ikke
  bytte for brukeren, bare si det. Posten sto i `TODO.md`. **Umålt:** at
  `/model sonnet` virker i alle oppsett.
- **Rettet i 0.6.0-innslaget:** maskinnavnet for målingene var
  `hjemme-win-x86`; riktig er `kontor-win-arm` (BK 2026-09-04).
- **Bekreftet i tørrkjøringen, på Sonnet:** forklaringssetning før hver
  kommando (også midt i fasen), rundetall i STATUS, verifiseringslinjen
  gjengitt ordrett i fasen, i STATUS og i fase-start, kvittering på tre
  punkter, porten holdt, ett ✅-innslag. **Fortsatt umålt:** `limit` på Read av
  loggen — drukner i utskriften.
- **Sett og ikke gjort:** Sonnet forsøkte brukerens verifisering selv
  (nettleserautomasjon) før den stoppet; læringssløyfen fanget det som eget
  punkt, første runde. Ingen regel før det gjentar seg.

Ikke brytende. Windows-prosjekter satt opp før 0.6.1 kan flytte snutten fra
STATUS til CLAUDE.md for hånd, eller si ja når fase-slutt tilbyr det.

## 0.6.0 — 2026-09-04

`faseflyt` 0.6.0. Kvalitetsheving før samlingen 14. september, bestilt av BK som
bevisst unntak fra MVP-frysen. Grunnlaget er en gjennomgang av pakken mot de tre
formålene — dele oppdrag i små biter, være brukbar for ikke-utviklere, og holde
øktene korte — med filstørrelser målt 2026-09-04 på `kontor-win-arm`.

- **`fase-slutt` leser bare toppen av `logg.md` og `laering.md`.** Begge får
  nye innslag øverst og vokser for hver faseslutt; for å legge inn et innslag
  trengs bare de første ~15 linjene. Bakgrunn: Read-verktøyet leser inntil 2000
  linjer og kapper på 25 000 tokens per fil, og i pakkerepoet er loggen 2508
  linjer og læringsloggen 1418 — så én faseslutt der kan bære rundt 50 000
  tokens i arkivlesing, i turen der konteksten alt er størst. **Hypotese, ikke
  målt:** ingen faseslutt er inspisert kall for kall. Avgjøres av om `Read` på
  `logg.md` bærer `limit` i neste faseslutt, og av Usage-tall før og etter.
- **Læringssløyfen teller rundene i STATUS, ikke i læringsloggen.** Hvert punkt
  i `## Arbeidsmåte neste økt` får et rundetall (`(2. runde)`); tredje runde
  utløser forslaget om permanent regel i `CLAUDE.md`. **Forslaget legges fram
  én gang** — sier brukeren nei, arkiveres punktet. Bakgrunn: i pakkerepoet er
  samme forslag gjentatt i fjorten faseslutt. Innslagene får tak: én linje per
  evaluert punkt, to–tre per nytt. Eldre STATUS uten rundetall leses som første
  runde — ikke brytende.
- **CLAUDE.md-malen fikk tre regler som manglet i det laget som er aktivt i
  hver økt:** fasesnittet (én fase = noe brukeren kan se virke, i én økt;
  verifisering skrives som en brukerhandling), `/compact` bare midt i en fase
  som ikke rekker å bli ferdig, og **hver sjekk forklares i vanlig språk før
  den kjøres** — uansett om Claude Code spør om lov først eller ikke (BKs
  bestilling: uten dialog er setningen det eneste brukeren ser). Rundt 16
  linjer, anslagsvis 250 tokens per økt. Alle tre sto til nå bare i tekst som
  lastes ved oppsett; selvbærende-testen 2026-08-18 predikerte at
  `/compact`-regelen faller bort.
- **Sjekk-forklaringen er skrevet inn der sjekkene kjøres**, med setningen
  skillen skal bruke: `fase-start` før steg 0 og 2, `fase-slutt` steg 5, 6 og 7,
  kontrollkallet i `nytt-prosjekt` steg 6. README sier det under «Vanlige
  spørsmål».
- **Plan-malens `**Verifisering:**` krever noe brukeren gjør og ser**, ikke
  «kjør testene». `prosjekttyper.md` fikk en tabell over hva en fase er per type
  — for dokumentasjon er fase 0 disposisjon og ett ferdig avsnitt, ikke «noe
  som kjører». Posten sto i TODO.md siden 2026-08-18.
- **`fase-slutt` spør om fasesnittet** i selvvurderingen: fikk fasen plass i én
  økt uten `/compact`? Og steg 7 sier hva som skjer når push feiler: commiten er
  trygg lokalt, si det i vanlig språk, ikke løs det selv.
- **`fase-start` sjekker om noen har pushet siden sist** (`git fetch` +
  `git rev-list --count HEAD..@{u}`, myk feiling uten remote eller nett).
  Observert 2026-08-28 på `kontor-win-arm`: STATUS var overskrevet på remote før
  økten begynte, og de lokale spørsmålene så det ikke. Ingen nye
  allow-oppføringer — allowlist-saken er lukket. Sak nr. 8 lukkes for denne
  delen.
- **`fase-start` gjengir fasens verifiseringslinje**, leser ikke hele `plan.md`
  når den er over ~150 linjer (finn fasene med `Grep`, les med `offset`), og
  leser `TODO.md` bare når STATUS peker dit. Bakgrunn: i pakkerepoet er
  `plan.md` 628 linjer og `TODO.md` 564, begge lest hver økt.
- **`nytt-prosjekt` stiller oppsettsspørsmålene samlet**, gjør `git init` og
  første commit uten å spørre (remote tilbys), og skriver CLAUDE.md-avsnittet
  uten å tilby det som valg — uten det finnes ingen av rytmevaktene.
  **Beslutning (BK, oppsett):** git og CLAUDE.md som standard, ikke tilbud.
- **Oppfølgingsspørsmål når prosjektet behandler persondata:** skal reelle
  persondata inn i selve løsningen, eller bare leses av brukeren underveis? Det
  første er ikke en prototype lenger, og avklaringen skrives som første post i
  `TODO.md`. **Beslutning (BK, dataregime):** minimalversjonen nå; full variant
  venter.
- **`hjelp` svarer på spørsmålet når det ikke gjelder flyten**, i stedet for å
  gjengi flyten. `grill-me` svarer på brukerens språk.
- **`maler.md` lover ikke lenger at allowlisten fjerner oppstartsdialogene** —
  setningen sto igjen fra før 0.5.10.
- **Vurdert og ikke gjort (BK 2026-09-04):** modellvalg for Explore-subagenter
  i CLAUDE.md-malen venter til det er målt om en sperret modell ignoreres eller
  feiler; begrunnelsestekst i skillene står; PreToolUse-hook er ikke på kritisk
  vei.

Ikke brytende. Eksisterende prosjekter kan lime de nye avsnittene i
CLAUDE.md-malen («Fasesnittet», «`/compact`», «Hver sjekk forklares») inn i sin
egen `CLAUDE.md` for hånd.

## 0.5.12 — 2026-08-30

- **`fase-slutt` og `fase-start` kjører nå på Sonnet** (`model: sonnet` i
  frontmatter). Bakgrunn: Usage-avlesning 2026-08-30 på `hjemme-win-x86` viste
  `fase-slutt` på 11 % og `fase-start` på 7 % av forbruket — mekaniske rutiner
  som arvet øktens modell, også når den var tyngste. Feltet gjelder per tur:
  pauser skillen for en brukeravklaring (f.eks. steg 4 i fase-slutt), kjører
  resten på øktens modell igjen. Er verdien sperret av organisasjonens
  modell-liste, ignoreres feltet stille. Kjent avveining: selvvurderingen i
  læringsloggen skrives nå av Sonnet — reverseres i en senere versjon om
  kvaliteten faller.
- **`fase-slutt` samler turene der konteksten er størst.** Steg 6 sender alle
  sikkerhetssøkene som parallelle kall i samme melding (hvert kall fortsatt én
  enkelt kommando, så allowlist-matching er uendret), og filskrivingene i steg
  1–3 sendes samlet når innholdet er bestemt. Samme arbeid, færre turer som
  sender hele konteksten på nytt.

## 0.5.11 — 2026-08-27

- **`fase-slutt` steg 6 krever nå ett kontrollsøk som skal gi treff.** Fire søk
  som alle gir null treff er ikke skillbare fra fire søk som ikke virker, og
  steget hadde ikke noe krav om å vise at søkene faktisk treffer. Observert i
  tørrkjøringen av 0.4.1 (2026-08-24): samme skill kjørte kontrollen uoppfordret
  i én fase og ikke i den neste. Ærlighetsklausulen følger med — kontrollen viser
  at søket virker i katalogen, ikke at mønstrene er de riktige. Issue #16.

## 0.5.10 — 2026-08-27

- **Påstanden om at allowlisten fjerner oppstartsdialogene er tatt ut av
  `nytt-prosjekt` steg 6.** Målt 2026-08-27 på ARM: oppføringer som matcher
  ordrett ga likevel dialog, mens kall uten oppføring gikk gjennom — allowlisten
  er ikke alene om å avgjøre. Steget sier nå at oppstarten kan koste noen
  godkjenninger, og at «allow for this project» gjør valget varig.
- **README svarer på maset.** Ny post under «Vanlige spørsmål»: dialogene gjelder
  å kjøre noe, ikke å lese, og en hel `/faseflyt:fase-slutt` ga fire.

## web-prototype 0.1.2 — 2026-08-25

- **Designsystemet feiler stille på ukjente attributtnavn — nå advart om i
  SKILL.md.** Et attributt klassen ikke kjenner blir ignorert, elementet rendres
  ustilt, og `svelte-check` melder ingenting. To målte tilfeller i tørrkjøringen:
  `data-size` utenfor `.ds-heading`/`.ds-paragraph`/`.ds-avatar`/`.ds-spinner`,
  og `data-variant="primary"` på `.ds-button`, der primær er basisstilen uten
  attributt. Samtidig presisert at `data-size` ikke er universell — linja om
  `font-size` antydet at den gjaldt generelt.
- **Advarselen ligger i `SKILL.md`, ikke i `components.md`.** Referansefila er
  auto-generert fra `digdir/designsystemet`, så håndskrevet tekst der forsvinner
  ved neste regenerering.

## 0.5.9 — 2026-08-25

`faseflyt` 0.5.9. Regelen om tilde-form i Bash var motbevist, og
versjonssjekkens tredje ledd kunne ikke gjøres billig.

- **En sti i et `Bash`-prefiks matcher ikke — 0.5.7-regelen sa det motsatte.**
  `fase-start` instruerte om tilde-form (`Bash(git -C ~/... rev-parse:*)`) og
  begrunnet det med at matchere er tekstlige. Målt 2026-08-25 på
  `hjemme-win-x86`: det kallet ga dialog, mens samme kall og samme oppføring i
  full sti gikk gjennom — isolert mot en kontrollinje som bekreftet at
  `settings.local.json` leses midt i en økt. Målingen fra 0.5.7 skilte aldri
  form fra lasting, fordi oppføringen den gangen kom inn via dialogens egen
  knapp. Funnet står nå som **grense 10** i `maler.md`, som gjelder `allow` like
  mye som `deny`. `Read` oppfører seg annerledes, målt samme dag: der matcher
  tilde og full sti likt, og `**` dekker mellomliggende ledd.
- **Versjonssjekkens org-ledd er tatt ut** av steg 0 i både `fase-start` og
  `nytt-prosjekt`. Formen som virker bærer brukernavnet og kan derfor aldri stå
  i en delt `settings.json` eller i en mal, så leddet kostet to
  godkjenningsdialoger i hver økt hos hver bruker — for et varsel, ikke en port.
  Ledd 1 og 2 står igjen og fanger feilen som faktisk har rammet: installert
  nyere enn kjørende, altså «start Claude Code på nytt». Oppdatering av pakken
  er dokumentert i README under «Vanlige spørsmål».
- **Allowlisten virker først etter omstart — nå sagt der den skrives.**
  `.claude/settings.json` leses ved oppstart og ikke på nytt midt i en økt:
  samme oppføring, samme kall og samme økt ga dialog fra den delte fila og
  ingen dialog fra `settings.local.json`. Målt 2026-08-25 på `hjemme-win-x86`.
  `nytt-prosjekt` skriver fila i steg 6 og skal nå si det, ellers møter
  brukeren dialoger malen nettopp har lovet er dekket. Funnet forklarer
  samtidig hvorfor 0.5.7-målingen konkluderte som den gjorde.
- **Allowlisten i malen er fire oppføringer, ikke seks.** De to
  `git -C ~/...`-linjene fra 0.5.7 er fjernet — de var dødvekt, og en oppføring
  som ser ut som en tillatelse uten å være det er verre enn ingen. Eksisterende
  prosjekter kan la sine to stå; de gjør ingen skade.

## 0.5.8 — 2026-08-25

`faseflyt` 0.5.8. Faseslutten sa hva stegene gjorde, men ikke hva økten leverte.

- **`fase-slutt` starter nå med hva økten leverte.** «Avvik, ikke
  gjennomføring» fra 0.5.0 er skrevet om stegene i skillen, men ble lest som at
  også arbeidet skulle vekk: en faseslutt med to utgivelser, tre pusher og en
  målt permission-form rapporterte ingen av dem. Ny åpning krever en kort del
  med utgivelser, commits, hva som ble målt og hva som er utestet — brukeren skal
  kunne avgjøre om fasen er ferdig uten å bla opp i økten.
- **Rekkefølgen er samtidig fastsatt:** stegene rapporteres i sin egen
  rekkefølge. Det lukker den opprinnelige halvdelen av posten, som har stått
  åpen siden 2026-08-25 (sent kveld) da sluttrapporten kom som 5, 6, 4, 2.
  Tredje observasjon på samme post, meldt av brukeren hver gang.

## 0.5.7 — 2026-08-25

`faseflyt` 0.5.7. Kollegaprosjekter fikk aldri allowlisten oppstarten trenger.

- **`.claude/settings.json`-malen har nå seks `permissions.allow`-oppføringer.**
  Pakken har til nå bare *begrenset* hva Claude får gjøre uten å spørre
  (deny-settet); dette utvider det. De dekker `fase-start` sine egne kall —
  versjonssjekken i steg 0 og «ble forrige økt avsluttet» i steg 2 — som ellers
  koster hver kollega fire godkjenningsdialoger i hver oppstart, i hvert
  prosjekt. Alle seks er lesende og rører ikke prosjektets data; de to siste er
  brede (all `git status`, all `git log`) og malen sier det.
- **Kolon-prefiksformen er nå målt, ikke antatt.** 0.5.6 førte hypotesen som
  sluttet. Bekreftet 2026-08-25 på `hjemme-win-x86`: omleggingen fra eksakt-form
  til `rev-parse:*`/`ls-remote:*` fjernet dialogen på det samme kallet, i samme
  økt. Malen fører målingen, så formen ikke blir gjettet på om igjen.
- **«Pakken eier bare to ting i denne fila» rettet til tre**, i både
  `nytt-prosjekt/SKILL.md` steg 6 og `maler.md`. Uten den rettelsen forbyr
  flettingsregelen sin egen nye mal — samme form for motsetning som steg 0 hadde
  i 0.5.6. En eksisterende `allow`-liste utvides, aldri erstattes.
- **«Snakk norsk» dekker nå teksten som følger hvert verktøykall.** Beskrivelsen
  brukeren leser mens Claude jobber er brukervendt tekst, og «Kjør
  renhetssjekken» er like utilgjengelig der som i en fil. Meldt av brukeren
  2026-08-25, i samme økt som forrige språkfunn.

## 0.5.6 — 2026-08-25

`faseflyt` 0.5.6. 0.5.4 beskrev hullet i steg 0 uten å lukke det.

- **Steg 0 sier nå at basekatalogen kommer absolutt, og skal skrives om.**
  Avsnittet «Kall som ikke skal koste en godkjenning» krever tilde-form, mens
  «Kjørende»-punktet to linjer under peker på skillens egen basekatalog — som
  Claude Code oppgir som absolutt brukersti. Regelen og instruksen motsa
  hverandre, og instruksen vant. Observert 2026-08-25 på `hjemme-win-x86`:
  første oppstart som kjørte 0.5.5 kostet fortsatt en dialog på `Read` av
  kjørende `plugin.json`, i et prosjekt der allowlisten dekket fila i
  tilde-form.
- **CLAUDE.md-malen: vis til ting med navn, ikke med bokstav eller nummer.**
  Ny linje i «Snakk norsk». Regelen fanget ikke referanser til egne tidligere
  punkter, og en oppsummering som sier «A og B er gjort» tvinger brukeren til å
  bla opp for å se hva som ble gjort. Observert 2026-08-25 i en økt i
  pakkerepoet, meldt av brukeren.
- **Ikke rørt i denne runden, men målt samtidig:** to `Bash`-oppføringer i
  eksakt-form (`Bash(git -C ~/… rev-parse HEAD)`) ga dialog i samme oppstart,
  mens `Bash(git status:*)` og `Bash(git log:*)` ikke gjorde det. Hypotesen om
  at bare kolon-prefiksformen matcher er **sluttet, ikke isolert** — repoets
  egen `.claude/settings.json` er lagt om til prefiks-form som måling, og
  bekreftes eller avkreftes av neste oppstart. Holder den, må
  `maler.md`-allowlisten følge etter.

## 0.5.5 — 2026-08-25

`faseflyt` 0.5.5. To småposter ut av verden.

- **Eksempellinja i `fase-start` er versjonsløs.** Den sa «Faseflyt 0.4.1
  kjørende og installert» som illustrasjon på normaltilfellets ene linje, og et
  hardkodet versjonsnummer i en eksempeltekst råtner ved hver utgivelse.
  `<versjon>` i stedet.
- **`Bash(git add:*)` i repoets egen `.claude/settings.json`.** Mellomromsformen
  `Bash(git add *)` er ikke blant de målte formene i `maler.md` — alle målte
  Bash-regler bruker kolon-prefiks. **Ikke en bevist feil:** formen ble aldri
  isolert, fordi kallet som kunne målt den ble kjedet med `&&` og dermed rotet
  til begge variablene. Endringen bringer linja i tråd med det som er målt.

## 0.5.4 — 2026-08-25

`faseflyt` 0.5.4. Oppstartens egne kall skal ikke koste godkjenninger.

- **`fase-start` sier nå hvordan steg 0 og 2 skal skrives.** Nytt avsnitt «Kall
  som ikke skal koste en godkjenning»: tilde-form framfor absolutt brukersti, og
  ett kall per kommando framfor `&&`/`;`-kjeder. Målt 2026-08-25 på
  `hjemme-win-x86`: fem godkjenningsdialoger i én oppstart i et prosjekt der
  allowlisten dekket alle kallene. Tilde mot absolutt sti er direkte observert —
  samme fil, to skrivemåter, én prompt og én ikke. At kjeding bryter matchingen
  er sluttet fra at nøyaktig de fem kallene som ikke matchet ga nøyaktig fem
  dialoger; `&&` er ikke isolert som variabel.
- **Vurdert og forkastet:** å korte ned steg 6 (kvitteringen på
  `## Arbeidsmåte neste økt`) til etiketter. Steget krever «konkret forpliktelse,
  ikke bare gjengivelse», og en etikettliste er gjengivelse — komprimeringen
  ville gjeninnført feilen teksten ble skrevet for å hindre, for tolv linjer.
  Den lange oppstarten som utløste vurderingen var brudd på 0.5.0-kontrakten,
  ikke en svakhet i steg 6. **Beslutning (BK).**

## 0.5.3 — 2026-08-25

`faseflyt` 0.5.3. Selvvurderingen skrives, men leses ikke opp.

- **`fase-slutt` steg 2d gjengir ikke lenger punktene i chatten.** Poenget med
  selvvurderingen er at den skrives til `laering.md` og STATUS for å overleve
  `/clear`; en opplesning i tillegg er samme tekst to ganger, og det var den
  største gjenværende utdatakilden etter 0.5.0. Én linje om hvor punktene ble
  ført, og hva som ble strøket eller promotert, erstatter den.

## 0.5.2 — 2026-08-25

`faseflyt` 0.5.2. Steg 2 kjenner igjen sin vanligste falske positiv.

- **`.claude/settings.json` flagges ikke lenger som uavsluttet arbeid.** Fila
  er tracket — pakken skriver den ved oppsett — og enhver permission-godkjenning
  endrer den, så `fase-start` steg 2 meldte «arbeid STATUS ikke vet om» i
  prosjekter der ingenting var galt. Observert i to prosjekter 2026-08-25;
  begge øktene dempet det på eget initiativ, men det er to modellkjøringer, ikke
  en regel. En ren `permissions`-endring nevnes nå i én linje.
- **Absolutte brukerstier i den fila skal påpekes.** Målt samme dag: en
  godkjenning skrev inn full sti med brukernavn. Fila følger med i klonen, så
  stien havner hos alle som henter prosjektet.

## web-prototype 0.1.1 — 2026-08-25

- **Navigasjonseksempelet brukte `<ds-button>`, som skillen selv forbyr.**
  Linje 207 og 215–218 sier at custom-elementet ikke finnes; linje 303 brukte
  det som anbefalt løsning, og bar `<a>` på linje 294 brøt regelen på linje 223.
  Funnet i tørrkjøringen 2026-08-25 — koden der gikk klar bare fordi
  prosjektets egen `CLAUDE.md` alt bar regelen. Et ferskt scaffoldet prosjekt
  har ikke det vernet. Eksempelet bruker nå `<a class="ds-button">` for vanlig
  navigasjon og `<button class="ds-button" type="button">` for programmatisk,
  og peker på `.ds-link` når lenken skal leses som tekst.

## 0.5.1 — 2026-08-25

`faseflyt` 0.5.1. Scope-vakten hardet etter første måling.

- **Scope-vakten i CLAUDE.md-malen sier nå hva den ikke skal gjøre.** Målt
  2026-08-25 i tørrkjøringen: vakten fyrte riktig og utførte ikke, men senket
  sin egen terskel («det er ikke et nei fra meg, det bryter ingenting») og
  stoppet fasen for å spørre hvor tillegget skulle bo — med en firevalgs meny
  der to av valgene implementerte det med én gang. Første ledd av regelen ble
  fulgt, andre ledd («fullfør fasen i stedet for å ese») ikke. Malen forbyr nå
  begge deler eksplisitt, med målingen som belegg. To linjer blir fem; formen
  følger fase-slutt-vakten over, som ble hardet på samme måte etter å ha feilet
  to ganger i test. Dette var den siste umålte rytmevakten.

## 0.5.0 — 2026-08-25

`faseflyt` 0.5.0. Skillene rapporterer avvik framfor gjennomføring.

- **`fase-start` og `fase-slutt` fikk en utdatakontrakt.** Et steg som gikk rent
  får én linje i en samlelinje; et steg som fant noe får plassen funnet trenger.
  Bakgrunn (BK, fra bruk 2026-08-25): utdataet hadde vokst til ~60 linjer per
  fasestart, og det meste av det rapporterte at ingenting var galt. Ingen steg og
  ingen sjekk er fjernet — dette gjelder utskriften, ikke arbeidet.
- **Unntaket er `fase-slutt` steg 5 og 6.** Kvalitets- og sikkerhetsrapporten er
  selve belegget for at sjekken ble kjørt, og skal alltid si hva som ble kjørt og
  hva som skjedde. Å stryke den ville vært «formelt på plass, reelt borte» —
  mønsteret pakken har navngitt fem ganger — så den er komprimert, ikke fjernet.
- **`fase-start` gjengir ikke lenger per-økt-påminnelser som fast liste.** Den
  relevante nevnes der den gjelder; behandler prosjektet persondata og neste steg
  rører data, sies det der og da. Utskriften gjentok en fil brukeren selv skrev.
  Dagens steg 8 renummerert til 7.
- **`fase-slutt` skriver fallback-oppstartsmeldingen kun på forespørsel** — den
  er forsikring for økter i verktøy uten skillen, og kostet en kodeblokk hver
  eneste faseslutt.
- **Kvitteringen i `fase-start` steg 6 er strammet** til én linje per punkt,
  maks tre. Forpliktelsen er poenget, ikke utbroderingen.

## 0.4.1 — 2026-08-24

`faseflyt` 0.4.1. Én linje om hvorfor arbeidsflyten ikke kan måle seg selv.

- **`fallgruver.md` navngir konfunderingen i læringssløyfen.** Nytt
  testdisiplin-punkt `[selvobservasjon-i-samme-artefakt]`: en korrigering skrevet
  til `## Arbeidsmåte neste økt` blir instruks for den økten som skulle måles.
  Belegg fra tre forsøk på å måle en rytmevakt (issue #11). Sløyfen virker som
  designet — begrensningen er at målingen ikke kan gjøres innenfra, og den skal
  stå skrevet framfor å oppdages på nytt.

## 0.4.0 — 2026-08-24

`faseflyt` 0.4.0. Porten sjekker skills, og `TODO.md` fortettes framfor å slettes.

- **`fase-slutt` foreslår å fortette avklarte `TODO.md`-poster.** Nytt steg 4:
  har økten avklart noe fila beskriver som åpent, foreslås seksjonen erstattet av
  én pekerlinje til hvor innholdet bor nå. Før/etter vises, og klarsignal kreves;
  ingenting slettes av seg selv, og bare det økten selv avklarte er kandidat.
  Bakgrunn (issue #4, tilleggsmuligheten): fila vokser ellers i det uendelige, og
  en åpen post leses som en åpen defekt. **Fortetning framfor sletting** er valgt
  fordi begge gangene dette repoet har ryddet sin egen `TODO.md`, var den
  verdifulle handlingen å peke videre — ikke å fjerne. Samme regel i TODO-malen.
  Dagens steg 4–7 renummerert til 5–8.
- **Renhetsporten sjekker skill-frontmatter.** `claude plugin validate` leser
  bare manifester — målt 2026-08-24: begge former meldte «Validation passed» uten
  å ha åpnet en `SKILL.md`. Ellevte søk i `.github/renhet/sjekk.sh` krever nå
  lukket frontmatter, `name` lik mappenavnet og `description` for hver
  `plugins/*/skills/*/SKILL.md` i indeksen. Bevist med kanarifugl på alle fire
  bruddene.
- **`docs/installasjon.md` lovet en CI som ikke finnes.** Seksjonen sa at
  scriptet kjøres av GitHub Actions ved hver push, mens Actions er droppet og
  workflowen inert — og sa åtte linjer lenger ned det motsatte. Rettet.
- **Referansen til `fase-slutt`s commit-steg i CLAUDE.md-malen er avnummerert**,
  så renummerering ikke kan brekke den stille i nye prosjekter.

## 0.3.0 — 2026-08-24

Batchen som testes på kollegaer. README-en svarer nå på det en fersk bruker
lurer på før flyten er lært — og flyten kan slås opp i chatten.

- **Ny skill: `/faseflyt:hjelp`.** Flyten, de fem kommandoene og — hvis
  `kunnskap/STATUS.md` finnes — hvilken fase prosjektet står i og hva neste steg
  er. Bevisst kort, og bevisst ikke et README-utdrag: halvparten som leser STATUS
  kan per definisjon ikke drive fra README, og resten peker dit framfor å gjenta
  den. Bakgrunn (issue #6): tre uker etter installasjon husker ingen flyten
  utenat, og forklaringen lå på GitHub framfor i chatten der spørsmålet oppstår.
  Ordforklaringene fra `nytt-prosjekt` er **ikke** kopiert inn — ordene forklares
  i setningen de brukes i, slik at det ikke finnes to tabeller å holde i takt.
  Umålt, og derfor ikke lovet: om triggeren «hjelp» slår inn på generelle
  hjelpespørsmål som ikke gjelder flyten.
- **`fase-start` oppdager en økt som ikke ble avsluttet.** Nytt steg 2: er det
  ucommittet arbeid, eller commits som kom etter at `kunnskap/logg.md` sist ble
  endret, sier skillen at STATUS er utdatert og tilbyr å oppsummere hva som
  faktisk er gjort. Aldri automatisk opprydding eller commit. Bakgrunn (issue
  #4): flyten antar at hver økt avsluttes med `fase-slutt`, og hullet er usynlig
  til noen faller i det. Målingen som formet mekanismen: issue-ens egen foreslåtte
  form, `git log --since=<dato fra loggen>`, ga **0 treff mens seks commits fra
  samme dag fantes** — git tolker en bar dato som er i dag som «nå», ikke som
  midnatt. Den commit-forankrede formen har ingen dato å tolke feil. Målt også:
  tom verdi fra `git log -1 -- kunnskap/logg.md` gir `..HEAD`, som er gyldig
  syntaks og svarer tomt uten å feile. Begge kanter står som eksplisitte regler
  i skillen.
- **README: «Trenger du alt dette?»** Ny seksjon rett før «Kom i gang»: for en
  liten prototype på et par timer holder `web-prototype` alene, og
  `/faseflyt:grill-me` virker uten resten. Fase-opplegget lønner seg først når
  prosjektet går over flere økter — og den som starter enkelt kan kjøre
  `/faseflyt:nytt-prosjekt` i mappa senere, uten at noe overskrives. Bakgrunn
  (issue #5): en kollega som møter hele oppsettet første gang kan konkludere
  «dette er ikke for meg» og aldri komme tilbake. Plasseringen er valgt slik at
  innvendingen er besvart før filtreet i steg 1 utløser den.
- **README: feil underveis er normalt.** «Kom i gang» steg 5 sier nå at arbeidet
  fortsetter i samme fase når verifiseringen ikke går, og at `fase-slutt` først
  kjøres når brukeren har bekreftet at det virker.
- **README: hvordan skru det av.** Nytt FAQ-punkt med `claude plugin disable`,
  `uninstall` og `marketplace remove`, `--scope`-valget, og at prosjekter satt
  opp med `nytt-prosjekt` også har en oppføring i `.claude/settings.json`.
  Kommandoene er verifisert mot `claude plugin --help` (Claude Code 2.1.237,
  2026-08-24). Umålt, og derfor ikke lovet: om den ubekvalifiserte formen
  `faseflyt` virker like godt som `faseflyt@claude-code-skills`.

`faseflyt` bumpes til 0.3.0 for de to skill-endringene. README-endringene over
utløste ingen bump alene: README endrer ikke hva en plugin gjør, og leses fra
repoet framfor fra plugin-cachen.

## 0.2.4 — 2026-08-21

`faseflyt` 0.2.4. Språkregelen dit den alltid leses, og ordforklaringene i takt
med samlingsmaterialet.

- **Språkregel i CLAUDE.md-malen.** Ny seksjon «Snakk norsk» i malen i
  `maler.md`: vanlig norsk, fagord bare med forklaring i samme setning, og
  én-setnings-forklaringer på ordene som møter brukeren i hver økt (fase,
  fase 0, verifisere, faseslutt, planmodus, `/clear`). Bakgrunn (målt
  2026-08-20): klarspråkregelen bodde bare i `nytt-prosjekt`, som lastes ved
  oppsett — en økt som skrev brukervendt materiale hadde den aldri aktiv.
  Malen er den eneste teksten som lastes i hver økt i hvert prosjekt.
  Additivt: teksten skrives bare ved oppsett, steg 8 legger til uten å
  overskrive.
- **Arbeidsflytord-tabellen speiler samlingsmaterialets ordliste.** Tre nye
  rader i `nytt-prosjekt/SKILL.md` — økt, fasestart, sikkerhetssjekk — og
  `fase` utvidet med «én fase, én ting å sjekke». Ordlisten på websiden og
  tabellen forklarer nå samme ordene; radene står i samme rekkefølge.

## 0.2.3 — 2026-08-21

`faseflyt` 0.2.3. To vern: oppsett i eksisterende prosjekter overskriver
ingenting, og hver økt kan oppdage at den kjører en foreldet pakke.

- **`nytt-prosjekt` steg 6 fikk flettregel, forhåndsvisning og etterkontroll.**
  Pakken eier bare `extraKnownMarketplaces.claude-code-skills` og
  `enabledPlugins`-oppføringene som slutter på `@claude-code-skills`. Finnes
  `.claude/settings.json` fra før, legges kun disse nøklene til; endringen
  vises som før/etter og venter på klarsignal, og etterkontrollen er målbar —
  hver nøkkel som fantes før, skal finnes igjen med samme verdi. Deny-settet
  tilbys som tillegg til en eksisterende `deny`-liste, aldri som erstatning.
  Malen i maler.md er nå merket som mal for ny fil — «Grunnform (alle
  prosjekter)» trakk mot å skrive hele dokumentet også der en fil fantes.
  Steg 7: en eksisterende `.gitignore` får kun manglende linjer lagt til.
  Bakgrunn: vurderingspunkt reist 2026-08-20 — kollegaer skal kunne kjøre
  oppsettet uten at noe overskrives; installasjonen selv var målt ren, hullet
  var `/nytt-prosjekt` i et prosjekt med eksisterende fil.
- **Versjonssjekk som steg 0 i `fase-start` og `nytt-prosjekt`.** Tre versjoner
  kan sprike: den økten kjører, den som er installert, og den i org-repoet.
  Målt 2026-08-21: en økt kjørte 0.1.0 mens installasjonsregisteret sa 0.2.2 —
  en kjørende prosess beholder versjonen den startet med, så
  `/plugin marketplace update` virker ikke før Claude Code også startes på
  nytt. Sjekken er et varsel, aldri en port: den feiler mykt uten nett og
  sammenligner versjonsnummer og commit, ikke innhold. Cache-oppbygningen den
  leser er observert på våre maskiner, ikke dokumentert kontrakt.

## 0.2.2 — 2026-08-20

`faseflyt` 0.2.2. Klarspråkregelen fra 0.2.1 virket, men dekket feil ordklasse.

- **Arbeidsflytordene forklares, de byttes ikke ut.** Tabellen i 0.2.1 er en
  erstatningstabell («si dette, ikke dette»), og den virker ikke på ordene
  arbeidsflyten *består av*: `fase` har ikke noe synonym, og `/clear` er et
  literalt kommandonavn som skal stå. Ny forklaringstabell i
  `nytt-prosjekt/SKILL.md` med ti arbeidsflytord og setningen som skal følge
  hvert av dem første gang brukeren møter det — skill, planmodus, grilling, fase,
  fase 0, faseslutt, `/clear`, verifisere, mocke, prototype. Navnene skal fortsatt
  brukes; det er begrepet bak navnet som trenger sin setning, og bare første gang.
- **Målt, ikke antatt:** en ikke-teknisk leser fikk oppgavematerialet til en
  samling og fikk ikke noe ut av det. Etterpå målt til **20 uforklarte fagord på
  det ene arket hun fikk i hånda**, uten ordliste noe sted — og materialet brukte
  `scaffold`, `røyktest` og `trigge`, tre ord som alt sto i «Ikke dette»-kolonnen.
  Ingen av ordene som faktisk stoppet henne sto i tabellen, fordi tabellen bare
  dekket ord Claude bruker om *seg selv*.
- **En ordliste er svakere enn en forklaring på stedet**, og det står nå som regel:
  står ordet i en instruksjon brukeren skal utføre, hører forklaringen i samme
  setning. En liste krever at leseren husker å slå opp.
- **Kjent begrensning, ikke rettet her:** regelen bor fortsatt bare i
  `nytt-prosjekt`, som lastes ved oppsett. `fase-slutt` skriver STATUS og
  læringspunkter i hver økt uten å kjenne den. Samme strukturfeil som er målt for
  deny-regler, rytmevakter og modellmiks.

## 0.2.1 — 2026-08-18

`faseflyt` 0.2.1. En retting av leveransen, ikke av innholdet: malteksten i 0.2.0
var riktig, men `nytt-prosjekt` ba bare om filer «fra malene» — og i praksis ble
det parafrase, som kastet bort ordlydsrettingene fra 0.2.0 uten at noen så det.

- **Maltekst skal kopieres ORDRETT.** Målt med parafrase kontra ordrett som eneste
  variabel i samme prosjekt: parafrase ⇒ faseslutt-rutinen kjørte uten klarsignal
  fra brukeren, ordrett ⇒ porten holdt med korrekt begrunnelse. Ordlyden er altså
  ikke smakssak. Ny seksjon i `nytt-prosjekt/SKILL.md`, kodeblokk-kontrakt øverst
  i `maler.md`, og krav gjentatt i steg 5, 6 og 8. Prosjektspesifikt innhold
  legges til som egne seksjoner; malens seksjoner omskrives aldri.
- **Etterkontroll før et malsteg meldes ferdig:** sammenlign malen og den skrevne
  fila seksjon for seksjon. Obligatorisk for CLAUDE.md-avsnittet, som er den
  eneste teksten i prosjektet som er aktiv i hver økt — skills lastes bare når de
  kalles, så en parafrase der slår ut rytmevaktene permanent.
- **`windows.md` har nå en kopieringsklar STATUS-snutt** med begge BOM-halvdelene
  (BOM uønsket i output-filer, påkrevd i `.ps1`-kildekode med æøå). Tidligere fant
  steget bare en instruks om å legge inn «de viktigste reglene», og halvdelen falt
  ut i sammendraget — den ene lest alene leses som en motsigelse av den andre.

- **Norsk til brukeren.** `nytt-prosjekt` omtalte seg selv som å «scaffolde», og
  en måleøkt svarte brukeren i samme ordelag. Plan-malens fase het «Fase 0 —
  Scaffold og røyktest», så ordet fulgte med inn i hvert prosjekts egen
  `plan.md`. Ordbyttet er gjort, og en stående regel sier nå at brukervendt tekst
  er vanlig norsk — literale navn (`deny`-nøkler, `commit`, filnavn) oversettes
  aldri. Engelske triggerfraser i `description` beholdes.
- **Ny syntaksfelle i `windows.md`: `-like` er ikke literal.** Backtick er
  escape-tegn i wildcard-mønstre, så tekstsammenligning av linjer med
  `kodeformat` mismatcher stille. Målt under bygging av etterkontrollen over —
  12 av 54 linjer ble rapportert manglende i en fil der de sto ordrett.
  `.Contains()` er svaret.
- **Manifestene stemte ikke overens i første 0.2.1-push.** `plugin.json` ble
  bumpet til 0.2.1, mens `marketplace.json` ble stående på 0.2.0. Ved
  installasjon vinner `plugin.json`, så pakken som installeres er riktig — men
  `/plugin`-listen viser feil versjon, og avviket er stille. Oppdaget ved
  installasjon på en ny maskin. Rettet, og `claude plugin validate` er lagt inn
  som fast steg i release-rutinen i `docs/installasjon.md`.

Ikke brytende: ingen endring i `kunnskap/`-strukturen. Prosjekter scaffoldet med
0.2.0 kan hente inn de manglende malavsnittene ved behov — særlig
CLAUDE.md-avsnittets rytmevakter og STATUS-snutten på Windows.

## 0.2.0 — 2026-08-18

`faseflyt` 0.2.0. Rettinger fra testplanens test 1–3 — flere av dem gjør malteksten
mindre lovende enn før, fordi det er den som var feil.

- **Deny-settet: `Bash(...)`-matchere er verktøy-scopet.** Målt: `curl` i Bash
  blokkert, `Invoke-RestMethod` i PowerShell-verktøyet kjørte — samme URL, samme
  økt. `Bash(Invoke-WebRequest:*)`/`Bash(Invoke-RestMethod:*)` fjernet fra malen
  (dødvekt), og «Deny-settets grenser» lagt til: verktøy-scoping, uvirksom
  `PowerShell(...)`-form, alias- og omveisflaten, stiform i `Read(...)`.
  Personvern-avsnittet sier nå at CLAUDE.md-regelen er hovedvernet.
- **«Deny-settets grenser» skrevet om til målte funn**, delt i det som virker og
  det som ikke gjør det. Nytt og målt: bar tool-navn-oppføring (`"PowerShell"`)
  slår ut hele verktøyet — det ene deklarative grepet på Windows, men
  alt-eller-ingenting; `Read(...)`-deny dekker også Write og Bash-kommandoer som
  nevner stien; deny-sjekk går foran eksistenssjekk; `ask`-nøkkel forkaster ikke
  blokken. Og den viktigste grensen: Bash-dekningen er **tekstmatching**, ikke
  filsystemvern — `ls -la` på katalogen kjørte og eksponerte navn og størrelser,
  mens `ls -la <dekket fil>` ble avvist.
- **Stiformen i `Read(...)` er målt:** bar filnavn-form virker, og er IKKE ankret
  til `settings.json`s katalog — en bar regel blokkerte fila i både prosjektroten
  og `.claude/`, målt på to ulike filnavn med kontroll for
  konfigurasjonsstabilitet. `Read(.env)` er dermed ikke dødvekt. En tidligere
  hypotese om det motsatte er **avkreftet og trukket**; den hvilte på én
  observasjon som ikke lot seg reprodusere, gjort under en konfigurasjon som
  aldri ble verifisert ordrett. Umålt: dekning av vilkårlige undermapper —
  derfor står glob-formen (`Read(**/.env)`) fortsatt ved siden av.
- **`Read(...)`-deny hindrer ikke sletting.** Målt: `rm -f <dekket fil>` kjørte i
  Bash med regelen aktiv og stien nevnt ordrett, mens `ls -la <dekket fil>` ble
  avvist i samme økt. Sperren avhenger av hvordan kommandoen klassifiseres, ikke
  av at stien står i strengen. Grense 2 sa tidligere at «en Bash-kommando som
  nevner stien avvises også» — det var for sterkt. Praktisk konsekvens skrevet
  inn: deny-regler gir delvis konfidensialitet og **ingen
  integritetsbeskyttelse**, og CLAUDE.md-malen sier det nå eksplisitt.
- **`Bash(npx tsx scripts/*)` merket som utestet mønsterform** i deny-eksempelet.
  Den bruker sti med `/*` der de målte reglene bruker kolon-prefiks
  (`Bash(curl:*)`), og lånte troverdighet fra målingene rundt seg.
- **Integritetsprobe påkrevd** ved endring av `permissions`: en uverifisert nøkkel
  kan gjøre hele blokken stille inaktiv. Ukonfundert oppskrift i `maler.md`;
  `nytt-prosjekt` steg 6 skal levere den i samme endring som deny-settet.
- **Nettverksdeny differensieres per prosjekttype** — bredt for script/dokumentasjon,
  målbasert for webapp/API, som ellers mister evnen til å verifisere eget endepunkt.
- **Fase-slutt-vakten:** «foreslå … med én gang» ble lest som en ordre om å utføre
  (fase-slutt kjørte og committet uten klarsignal — reprodusert to ganger).
  Omformulert, og porten er gjort eksplisitt **både** i `fase-slutt/SKILL.md` og i
  CLAUDE.md-avsnittet — sistnevnte fordi en skill bare lastes når den kalles, så en
  port som bare står der fanger ikke det å utføre rutinen for hånd. Porten har nå
  en observerbar test (finn meldingen der brukeren ba om det) framfor skjønn, og
  dekker eksplisitt begge veier: kalle skillen og gjøre stegene selv.
  **Verifisert:** en frisk økts første verifiseringsbekreftelse, med reelt arbeid
  og en commit innen rekkevidde, ga et forslag og ingen utført rutine — målt på
  CLAUDE.md-laget alene, uten skill-porten installert.
- **`.ps1`-kildekode med æøå må lagres MED BOM** i Windows PowerShell 5.1 —
  motsatt regel av BOM-forbudet i output-filer; de to står nå sammen i `windows.md`.
- **Beslutningsmønsteret:** `Beslutning (<navn>)` → `Beslutning
  (<beslutningstaker>, <tema>)` alle seks steder, med konkret eksempel.
  Plassholderen ble lest som tema, og sporbarheten «hvem bestemte?» falt ut.
- **Belegg-krav i logg-malen** (observert kontra hypotese) og testdisiplin i
  `fallgruver.md`: «én observasjon, ett utfall, én forklaring».
- **Plattformskjevhet rettet i `prosjekttyper.md`** — Windows-regler var ubetinget
  for script-typen; plattform er en egen akse.
- **Installasjon skjer i terminal-CLI-en:** `/plugin` finnes ikke i
  VS Code-utvidelsen, og `/permissions` ligger under «Customize». Dokumentert som
  generelt mønster i README + installasjonsdokumentet.

Ikke brytende: eksisterende `kunnskap/`-struktur er uendret. Prosjekter scaffoldet
med 0.1.0 kan hente de nye reglene ved behov — særlig deny-avsnittene, hvis
prosjektet behandler persondata på Windows.

## 0.1.0 — 2026-08-08

Første versjon.

- `faseflyt` 0.1.0: `nytt-prosjekt` (prosjekttyper, læringssløyfe, rytmevakter,
  deklarerte skills, deny-sett for persondata), `fase-start`/`fase-slutt`
  (selvvurdering til fil, kvalitetsport, sikkerhetsrøyktest), `grill-me`
  (beslutninger inn i planens «Avklarte beslutninger»).
- `web-prototype` 0.1.0: uendret innhold fra org-skillen; repoet er nå master.
- `fint-graphql` 0.1.0: renset for prosjektspesifikke antakelser
  (fakturaregel for sperret adresse generalisert til personvernregel).
