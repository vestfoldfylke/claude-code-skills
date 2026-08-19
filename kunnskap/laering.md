# Læringslogg — selvvurdering per faseslutt

*Append-only, nyeste øverst. Hvert punkt har en stabil stikkordsetikett i
klammer, slik at gjentakelse kan gjenkjennes på tvers av ulikt formulerte
innslag. Et punkt som står i tre påfølgende faseslutt er ikke en påminnelse, men
en manglende regel — da hører det i `CLAUDE.md`, ikke her.*

*Handlingsbart med belegg, ikke stemningsrapport: «Delegér filsøk på tvers av
mapper til Explore — tre runder med Grep i hovedtråden kostet ~15k tokens denne
fasen» er brukbart. «Kunne vært mer effektiv» er det ikke.*

## 2026-08-18 (kveld) — O8-fiksen og målingen av den

**Evaluering av forrige økts punkter — alle tre fulgt, alle tre strykes:**

- **[egen-instruks-er-del-av-riggen]** *(sto på 2. gang)* — **fulgt. Strykes**, og
  dermed ingen promotering til `CLAUDE.md` på telling. Belegg: hostname, rent
  arbeidstre og HEAD mot disk sjekket FØR riggen ble satt opp; nøytralt
  katalognavn (`prosjekt-a`); prompt uten ordene «ordrett», «mal» eller «måling»;
  og jeg anbefalte auto-godkjenning av edits nettopp for at brukerens
  godkjenningsdialog ikke skulle lekke signal om hva som ble sett etter.
- **[diskriminator-før-tolkning]** — **fulgt, tre ganger. Strykes.** Belegg (1):
  installert plugin var 0.1.0, og «selvbærende-testen målte utdatert innhold» var
  en nærliggende og alvorlig konklusjon — jeg leste loggen først og fant at
  forrige økt visste det og målte CLAUDE.md-laget alene med vilje. Ingen falsk
  korreksjon publisert. (2) Sjekkeren rapporterte 12 manglende linjer; jeg
  debugget framfor å melde at fiksen feilet. (3) Mac-skjevheten: jeg leste fila før
  jeg rettet, og fant at den var rettet i PR #2.
- **[probe-må-kunne-vise-det-motsatte]** — **fulgt, gjennomgående. Strykes.**
  Belegg: sjekkeren verifisert i begge retninger før bruk (mal mot seg selv ⇒
  ORDRETT; fremmed fil ⇒ 43 avvik; én parafrasert linje ⇒ nøyaktig 1 avvik med
  linja navngitt). UTF-8-kontrollen brukte ANSI-dekoding som negativ arm.
  Fnr-søket fikk en 4-siffer-kontroll for å bevise at regexen kunne treffe.
  Commit-meldingen ble sjekket mot mojibake-bytesekvensen, ikke bare mot at ordet
  «så riktig ut». Det var denne disiplinen som fanget begge feilene i sjekkeren.

**Nye punkter:**

- **[riggen-fryses-under-måling]** Ikke rediger det som måles mens målingen løper —
  frys det, eller mål mot en snapshot og skriv ned hvilken. Belegg: jeg rettet
  språket i `maler.md` og `windows.md` mens måleøkten kjørte. Malen økten leste og
  malen i repoet var da to ulike filer, og en diff mot repoet ville gitt falske
  avvik for hvert ordbytte. Jeg fanget det og byttet fasit til kopien i prosjektet
  — men det var årvåkenhet, ikke en regel. Regelen: enten fryser jeg, eller så
  noterer jeg snapshot-stien i samme melding som jeg gjør endringen.
- **[todo-er-datert-observasjon-ikke-tilstand]** Før du handler på et TODO-punkt:
  verifiser det mot koden og CHANGELOG. TODO-innslag er daterte observasjoner, ikke
  gjeldende tilstand. Belegg: jeg tilbød å ta Mac-skjevheten på branchen og fikk
  «ja» — den var alt rettet i PR #2 og ført i CHANGELOG 0.2.0. Jeg leste fila før
  jeg redigerte, så ingen skade skjedde, men jeg hadde alt lovet arbeidet. Samme
  fil ledet meg nesten til å utlede deny-funn som var målt ferdig. Kostnaden er
  ikke tokens, det er tillit til egne planer.
- **[egne-verktøy-treffes-av-pakkens-egne-feller]** Kastesripter og sjekkere er kode
  og skal møtes med prosjektets egne dokumenterte feller (encoding, `-like`, tom
  output) før de brukes som målestokk. Belegg: `-like` i sjekkeren mismatchet
  stille på backtick — nøyaktig klassen felle pakken dokumenterer for andre — og
  ga 12 falske avvik. En ubekreftet sjekker er verre enn ingen, av samme grunn som
  et ubekreftet deny-sett: begge gir et utfall som ser ut som et funn.

**Etikett-telling:** `[egen-instruks-er-del-av-riggen]` er strøket etter to ganger
og nullstilles. Ingen etikett har stått tre påfølgende ganger ⇒ ingen promotering
til `CLAUDE.md`. De tre nye er alle første gang.

**Gjelder noe av dette arbeidsflyten selv?** Ja — men dette *er* repoet som eier
skillene, så mekanismen er PR/TODO, ikke `gh issue create`. `-like`-fella og
språkregelen ligger i PR #12; de tre punktene over er øktdisiplin, ikke pakkefeil.

## 2026-08-18 — Selvbærende-testen (riggholder)

**Evaluering av forrige økts punkter:**

- **[egen-instruks-er-del-av-riggen]** *(1. gang)* — **delvis fulgt. VIDEREFØRES,
  utvidet.** Belegg for fulgt: jeg skrev eksplisitte lekkasjeregler for
  måleøktens prompt før den ble sendt (ingen omtale av faser, STATUS, Explore,
  modellmiks), og den nakne arbeidsordren var ren. Belegg for ikke fulgt: riggen
  lakk likevel — gjennom **git-tilstanden**. Et urent arbeidstre fikk måleøkten
  til å navngi «CLAUDE.md har fått en strammere rytmevakt-tekst», altså
  variabelen under test, og trialen måtte forkastes. Punktet var riktig, men for
  smalt formulert: det sa «prompten», og lekkasjen kom et annet sted fra.
- **[forutsetning-som-sjekkbart-faktum]** — **fulgt. Strykes.** Belegg: «ny
  prosess» ble skrevet som en handling brukeren kan se, ikke som adjektivet
  «frisk økt», og det var nettopp denne regelen som avgjorde valget av terminal
  framfor VS Code-utvidelsen — der prosessferskhet ikke kan sjekkes. Uten den
  ville testen kunnet kjøre med den globale fila i minnet uten at noen så det.
- **[teardown-er-del-av-eksperimentet]** — **fulgt. Strykes.** Belegg: rå
  observasjoner (O1–O12) ble ført mens riggen sto, eksplisitt merket «ikke
  tolket», og konklusjonen ble først skrevet etter at `~/.claude/CLAUDE.md` var
  lagt tilbake og verifisert. Gjort to ganger — også rundt O13-proben.

**Nye punkter:**

- **[egen-instruks-er-del-av-riggen]** *(videreført, 2. gang — utvidet fra
  «prompten» til «alt måleøkten kan observere»)* Prompt, filinnhold, git-status
  og katalognavn er alle eksperimentbetingelser. Konkret regel: før en måleøkt
  startes, sjekk at arbeidstreet er rent og at HEAD stemmer med disk — en
  tilbakerulling uten commit er en synlig melding om at noe manipuleres. Belegg:
  O12 over.
- **[diskriminator-før-tolkning]** Har en observasjon flere forklaringer, kjør
  diskriminatoren FØR funnet formuleres — ikke etter. Belegg: fase-slutt-porten
  sviktet og så ut som «tredje svikt for den skjerpede ordlyden». Diskriminatoren
  (les prosjektets `CLAUDE.md`) viste at ordlyden aldri var levert. Uten den
  ville jeg foreslått å skrive om en tekst som beviselig virker, og latt den
  faktiske feilen — steg 8 — stå. Samme mønster reddet O4 fra å bli ført som
  «skillen ignoreres».
- **[probe-må-kunne-vise-det-motsatte]** En probe som ikke kan produsere det
  negative utfallet, måler ingenting — sjekk det før den kjøres, ikke etter.
  Belegg: røyktesten ble brukt som bevis på at «æøå er intakt», men utskriften
  inneholder ingen æøå fra scriptets egne litteraler (navnene kom fra CSV-en,
  lest med `-Encoding utf8`). Den kunne aldri vist mojibake. Avgjort på disk i
  stedet: eneste æøå står i en kommentar på linje 78.

**Etikett-telling:** `[egen-instruks-er-del-av-riggen]` står nå **2 påfølgende
ganger**. Én gang til ⇒ den er en manglende regel og hører permanent i
prosjektets `CLAUDE.md`, ikke i STATUS. Ingen andre etiketter er gjengangere.

## 2026-08-18 — Merge-økten (skriptholder for målesesjonen)

**Evaluering av forrige økts punkter — alle tre fulgt, alle tre strykes:**

- **[edit-mot-gjeldende-fil]** *(sto på 2. gang)* — **fulgt. Strykes.** Belegg: jeg
  leste testprosjektets STATUS før jeg påsto at sesjonen var uprimet, leste
  eksperimentfila før jeg skrev probetekst, og leste `plan.md` linje 74–91 før jeg
  redigerte. Det var også lesing — ikke antakelse — som avdekket at faseslutten
  hadde skrevet vaktpunktet inn i STATUS.
- **[tom-output-er-ikke-måling]** — **fulgt. Strykes.** Belegg: hvert søk hadde
  positiv kontroll i samme kjøring. Primingsøket ga 89 «probe»-treff som bevis på
  at verktøyet kjørte; renhetssjekken hadde `vestfoldfylke`-kontroll og en
  syntetisk 11-sifret kontrollstreng. Det var nettopp den disiplinen som lot meg
  trekke den tidligere «eliminert ved måling»-påstanden med belegg.
- **[enumerér-alle-forskjeller]** — **fulgt. Strykes.** Belegg: da probe 7 motsa
  1a, listet jeg alle fire forskjellene (filnavn, konfigurasjon, Claude
  Code-versjon, udokumentert integritetssjekk) i stedet for å tilskrive den
  nærmeste. Det gjorde probe 8 til en presis test framfor en gjetning.

**Nye punkter:**

- **[egen-instruks-er-del-av-riggen]** Prompten du skriver ER en
  eksperimentbetingelse — revider den for lekkasjer før den sendes, på samme måte
  som konfigurasjonen. Belegg: jeg designet en kontroll som krevde at sesjonen ikke
  visste at porten ble målt, og påla den så å lese `eksperiment-deny-regler.md`,
  som på linje 67 sier «mens rytmevaktene måles». Jeg innførte selv den eneste
  lekkasjen i en trial jeg hadde brukt tre økter på å få ren.
- **[forutsetning-som-sjekkbart-faktum]** Når en instruksjons gyldighet hviler på
  en forutsetning, skriv forutsetningen som noe mottakeren kan sjekke — ikke som et
  adjektiv. Belegg: jeg skrev «lim inn i en frisk sesjon etter omstart». «Frisk»
  leser like naturlig som `/clear`, som ikke laster regler på nytt. Målesesjonen
  stoppet og spurte; hadde den ikke gjort det, ville probe 8 målt den gamle
  konfigurasjonen uten at noen så det.
- **[teardown-er-del-av-eksperimentet]** Ikke ferdigstill dokumentasjonen mens
  instrumentet fortsatt finnes. Belegg: jeg regnet måleperioden som lukket da probe
  8 var rapportert, og committet malteksten. Oppryddingen ga så `rm`-funnet, som
  gjorde grense 2 målt feil — teksten lå allerede i `d168c73` og måtte rettes i en
  ekstra commit. Det var flaks at merge var blokkert av review; ellers hadde
  påstanden gått ut til kollegaer.

**Ingen etikett har stått tre påfølgende ganger** ⇒ ingen promotering til CLAUDE.md
på telling. `[push-før-review]` er ikke ført som punkt her fordi den er skrevet
permanent inn i `plan.md` i stedet — den hører til repoets arbeidsmåte, ikke til
øktenes.

## 2026-08-17 — Funn-PR-økten

**Evaluering av forrige økts punkter:**

- **[uverifisert-nøkkel-uten-kontroll]** — fulgt. **Strykes.** Belegg:
  integritetsproben ble skrevet inn i `maler.md` og i `nytt-prosjekt` steg 6 i
  *samme* endring som deny-settet, og hver instruks til testsesjonen ledet med
  probe 0 som integritetssjekk før noe annet ble tolket.
- **[funn-varighet]** — fulgt. **Strykes.** Belegg: hvert funn gikk på PR #2 ved
  første forekomst, nettopp fordi `kunnskap/` er gitignored. PR-kommentarene ble
  øktens faktiske overleveringsdokument, og det var riktig valg — de er det eneste
  som er lesbart fra en annen maskin.
- **[edit-mot-gjeldende-fil]** — delvis. **Videreføres, skjerpet:** regelen gjelder
  også *påstander* om filers innhold, ikke bare redigeringer. Belegg: jeg hevdet at
  testsesjonen hadde gjengitt STATUS fra hukommelsen, mens den i virkeligheten
  hadde rukket å redigere filen før jeg leste den. Jeg leste riktig, men sluttet
  feil om hvorfor — og antydet noe om en annens pålitelighet på det grunnlaget.

**Nye punkter:**

- **[tom-output-er-ikke-måling]** Et tomt søkeresultat er ingen måling før
  verktøyet er bekreftet å ha kjørt. Belegg: `grep.exe` krasjet og ga tom output,
  som jeg førte som et bekreftet nullresultat i en eksperimentkontroll et helt
  argument hvilte på. `grep.exe.stackdump` lå i katalogen og ble avskrevet som
  søppel i samme melding der jeg brukte resultatet. Feilen ble fanget av
  testsesjonen, som kjørte samme søk med et annet verktøy og fikk tre treff.
  Rettet i pakken som `[tom-output-to-betydninger]`.
- **[enumerér-alle-forskjeller]** Før attribusjon: list HVER forskjell mellom de to
  betingelsene, ikke bare den tilsiktede. Belegg: jeg skrev at forskjellen mellom
  to sesjoner var den bare `"PowerShell"`-linja, mens kontrollsesjonen ikke sto i
  noe prosjekt i det hele tatt — hele settings-filen skilte dem. Måtte publisere
  korreksjon på PR-en.
- **[pr-som-overlevering]** *Mønster som virket, gjenta det:* når prosjektets
  hukommelse er gitignored, er PR-kommentarer den eneste maskinuavhengige kanalen.
  Skriv funn, korreksjoner og gjenstående arbeid dit fortløpende — ikke som
  oppsummering til slutt. Belegg: hele deny-runden er lesbar fra en klone uten
  `kunnskap/`, inkludert de to korreksjonene av mine egne påstander.

## 2026-08-17 — Test 3-økten (første innslag i denne loggen)

Forrige økts punkter: ingen å evaluere — `laering.md` fantes ikke, og STATUS
hadde ingen `## Arbeidsmåte neste økt`. Prosjektet ble satt opp før det leverte
sin egen læringssløyfe. Ingen gjentakelser kan telles ennå; dette er innslag 1.

- **[uverifisert-nøkkel-uten-kontroll]** Legger jeg en utestet konfigurasjonsnøkkel
  inn i et levende eksperiment, skal integritetskontrollen inn i *samme* endring.
  Belegg: jeg la `"ask"` i `permissions` uten å vite om nøkkelen var gyldig. Var
  den ugyldig, kunne hele blokken blitt forkastet, og da ville hver probe lest
  «kjørte» — altså «vernet virker ikke» når sannheten var «konfigurasjonen ble
  avvist». Probe 0 som fanget det, kom først da brukeren rapporterte at
  `/permissions` ikke fantes; jeg la den ikke inn av eget initiativ.
- **[funn-varighet]** Produserer en økt funn som må overleve, sies det ved det
  FØRSTE funnet, ikke ved øktslutt. Belegg: sju funn ble ført til gitignored
  `kunnskap/TODO.md` gjennom hele økten, og jeg nevnte først i siste melding at de
  dermed finnes på én maskin og i ingen historikk. Den opplysningen var mest verdt
  da det var ett funn og valget ennå var åpent.
- **[edit-mot-gjeldende-fil]** Rediger mot filens gjeldende innhold, ikke mot
  hukommelsen om hva jeg selv skrev tidligere i økten. Belegg: to Edit-kall feilet
  på `String to replace not found` fordi jeg hadde konvertert punkter til
  overskrifter senere i samme økt og deretter redigerte mot den gamle formen.

**Gjelder dette arbeidsflyten selv?** Ja — men dette *er* repoet som eier
skillene, så mekanismen er funn-PR-en, ikke et issue. Alle sju pakkefunn ligger i
`TODO.md`. Ingen `gh issue create` nødvendig.
