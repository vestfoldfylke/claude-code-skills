# Læringslogg — selvvurdering per faseslutt

*Append-only, nyeste øverst. Hvert punkt har en stabil stikkordsetikett i
klammer, slik at gjentakelse kan gjenkjennes på tvers av ulikt formulerte
innslag. Et punkt som står i tre påfølgende faseslutt er ikke en påminnelse, men
en manglende regel — da hører det i `CLAUDE.md`, ikke her.*

*Handlingsbart med belegg, ikke stemningsrapport: «Delegér filsøk på tvers av
mapper til Explore — tre runder med Grep i hovedtråden kostet ~15k tokens denne
fasen» er brukbart. «Kunne vært mer effektiv» er det ikke.*

## 2026-08-27 — Begge punktene fulgt, og det holdt tre kall rene; men jeg pakket det fjerde inn i en filskriving og et avsnitt måledesign, og mistet utfallet

**Evaluering av forrige økts to punkter:**

- **[hold-en-arm-pa-variabelen-du-neytraliserer]** — **fulgt, og strykes.**
  Belegg: da tre kall hadde gått gjennom uten dialog, nektet jeg å skrive
  konklusjonen «fila er variabelen» som forrige STATUS hadde satt opp som
  forventet utfall, fordi `.claude/settings.json` fortsatt bar det samme
  mønsteret. Armen var beholdt — og det var nettopp derfor utfallet ikke kunne
  tilskrives noen av dem. Punktet virket etter hensikten og avdekket samtidig
  sin egen grense, som står som nytt punkt under.
- **[sett-brukerinstruksen-rett-for-kallet]** — **fulgt, men utilstrekkelig.
  Videreføres i skjerpet form.** Belegg: instruksen «trykk No» sto på egen linje
  umiddelbart før både `fint-graphql`-kallet og `hjelp`-kallet. Det første ble
  lest og målt. Det andre gikk tapt likevel, fordi turen rundt instruksen
  inneholdt en filskriving og et avsnitt med måledesign. Plasseringen var
  riktig; mengden var feil.
- **[proev-forslaget-mot-prosjektets-egne-laerdommer]** — **fulgt, tiende
  påfølgende runde.** Belegg: valget av `fint-graphql` som målemål kom direkte
  av prosjektets egen lærdom om at engangsgodkjenninger brenner målfiler, og
  kontrollkallet mot `hjelp/SKILL.md` var arvet fra kontrollinje-metoden fra
  2026-08-25. **Promoteringsforslaget står fortsatt og venter på BKs
  klarsignal.**

**Nye punkter:**

- **[en-maaling-per-tur]** Kallet mot `hjelp/SKILL.md` var designet riktig og ble
  ugyldig av innpakningen: samme tur inneholdt en `Write`, et avsnitt som
  forklarte hvorfor kontrollen trengtes, og selve kallet. BKs ord: «Skjedde for
  mye samtidig.» Runden kostet to kall og en tilbakestilling av
  `settings.local.json`, og ga null data. **Regelen: en måletur inneholder
  instruksen og kallet — ingenting annet. Oppsett, filskriving og begrunnelse
  hører i turen før, og brukeren får si fra når det er klart.**
- **[nullresultat-maa-ha-en-entydig-aarsak]** Riggen la den brede formen i
  `settings.local.json` *ved siden av* den som alt sto i `settings.json`, og
  kalte det å isolere fila. Da alle tre kallene gikk rene, kunne utfallet
  tilskrives to ting samtidig — fila eller omstarten — og økten endte uten svar
  på spørsmålet den var satt opp for. Feilen lå i designet, ikke i
  gjennomføringen. **Regelen: før riggen kjøres, skriv ned hva hvert mulige
  utfall kan tilskrives. Har «ingen dialog» to årsaker, er det ingen måling —
  fjern en arm først.**

## 2026-08-26 — Begge punktene fulgt, og designet var riktig; men jeg konstruerte bort den variabelen som viste seg å være svaret, og la instruksen brukeren måtte følge på feil sted

**Evaluering av forrige økts to punkter:**

- **[tell-forekomstene-for-du-lover-omfanget]** — **fulgt, og strykes.** Belegg:
  da BK meldte tre dialoger, leste jeg `.claude/settings.json` og
  `settings.local.json` FØR jeg sa noe om årsaken, i stedet for å svare ut fra
  STATUS' beskrivelse av allowlisten. Det var avgjørende: STATUS sier at
  org-kallene bor i `settings.local.json`, og den fila fantes ikke på denne
  maskinen. Hadde jeg svart fra STATUS, ville forklaringen vært feil fra første
  setning.
- **[maal-en-variabel-om-gangen]** — **fulgt, og strykes.** Belegg: jeg flyttet
  målfilene ut av `claude-code-skills` og over i `claude-plugins-official`
  nettopp fordi de to brede oppføringene i `settings.json` ellers ville dekket
  alle tre variantene, og jeg holdt `faseflyt`-filene utenfor fordi
  engangsgodkjenningene fra oppstarten ville gitt falsk bestått. Regelen ble
  fulgt. Feilen som likevel oppsto er av en ny familie — se punktene under.
- **[proev-forslaget-mot-prosjektets-egne-laerdommer]** — **fulgt, niende
  påfølgende runde.** Belegg: måledesignet ble bygget på metoden fra 2026-08-25
  (én form isolert om gangen, mot en kontrollinje som skal gå gjennom) framfor
  på min egen første innskytelse, og lastekontrollen `git rev-parse` er direkte
  arvet fra `Bash(whoami)`-kontrollen den dagen. **Promoteringsforslaget står
  fortsatt og venter på BKs klarsignal.**

**Nye punkter:**

- **[hold-en-arm-pa-variabelen-du-neytraliserer]** Jeg fjernet `settings.json`
  sin dekning fra målingen med vilje, for at de tre formvariantene skulle stå
  alene — og nøyaktig den variabelen jeg konstruerte bort var svaret. Runden
  kostet fire kall og tre av dem endte ugyldige, mens ett eneste kall mot en fil
  `settings.json` dekker (`fint-graphql` i cachen) avgjorde saken. Jeg hadde til
  og med skrevet «den variabelen jeg designet meg bort fra» i min egen
  oppsummering uten å se det. **Regelen: nøytraliserer du en variabel for å
  isolere andre, gjør du den samtidig uobserverbar — behold én arm som fortsatt
  tester den, eller mål den først.**
- **[sett-brukerinstruksen-rett-for-kallet]** Målingen hvilte på at BK trykket
  «No», og den instruksen sto i et avsnitt over en tabell, med to andre avsnitt
  etter seg. Tre varianter ble ugyldige fordi den ikke ble lest i tide — BKs
  egne ord: «Fikk ikke lest instruksen godt nok.» Andre runde la instruksen på
  egen linje umiddelbart før kallet, og da virket den. **Regelen: er brukerens
  tastetrykk selve måleresultatet, står instruksen på egen linje rett før
  verktøykallet — ikke i innledningen, ikke etter en tabell, og bare ett sted.**

## 2026-08-25 (dag) — Punktet fra i natt bar hele økten; men omfanget vokste to ganger etter godkjenning, og én måling målte ingenting

**Evaluering av forrige økts tre punkter:**

- **[ikke-rapporter-utfall-du-ikke-kan-se]** — **fulgt, og strykes.** Belegg, og
  det avgjorde økten: fem ganger stilte jeg spørsmålet «kom det dialog?» framfor
  å slutte meg til svaret. Hver av dagens tre målinger hviler på et svar bare BK
  kunne gi. Punktet ble skrevet i natt etter at jeg meldte «null dialoger» om en
  oppstart med fire — i dag var det forskjellen på en måling og en gjetning.
- **[flytt-regelen-dit-den-leses]** — **fulgt, og strykes.** Belegg: jeg skrev
  «README og `hjelp` sier når» i `fase-start`, søkte etter `marketplace update` i
  repoet, og fant at `hjelp` ikke nevner oppdatering i det hele tatt. Pekeren ble
  rettet til README, som faktisk har teksten. Samme kriterium avgjorde hvor
  grense 10 skulle bo.
- **[skriv-forbud-som-treffer-bare-det-du-mener]** — **ikke aktualisert.** Ingen
  forbud ble skrevet denne økten, så punktet ble verken fulgt eller brutt. Føres
  som ubrukt, ikke som innarbeidet, og videreføres ikke — det er ingen gjenganger.
- **[proev-forslaget-mot-prosjektets-egne-laerdommer]** — **fulgt, åttende
  påfølgende runde**, selv om den bor i «Det en ny økt må vite» og ikke i
  arbeidsmåte-lista. Belegg: søk på `marketplace update` og på `seks` før
  forslagene, begge ga treff som endret omfanget. **Promoteringsforslaget står
  fortsatt og venter på BKs klarsignal.**

**Nye punkter:**

- **[tell-forekomstene-for-du-lover-omfanget]** To ganger denne økten la jeg fram
  et endringsomfang, fikk klarsignal, og oppdaget så en forekomst til: org-sjekken
  i `nytt-prosjekt` steg 0 (funnet ved søk på `marketplace update`) og «seks
  oppføringer» i steg 6 (funnet ved søk på `seks`). Begge kostet BK en ekstra
  klarsignal-runde, og den andre ville gjort 0.5.9 internt motstridende hvis den
  ikke var fanget. **Regelen: søk opp alle forekomster av teksten, tallet eller
  regelen du vil endre FØR du legger fram omfanget — ikke etter at det er
  godkjent.**
- **[maal-en-variabel-om-gangen]** Jeg la inn
  `Read(.../faseflyt/*/.claude-plugin/**)` for å teste `*` mot 0.5.3, og lot
  0.4.1 være kontrollen som bare `**`-linja skulle dekke. Men `*`-linja dekket
  0.4.1 like godt, så begge gikk gjennom og runden skilte ingenting. BK svarte på
  et spørsmål som ikke kunne gi informasjon. Beslektet med `[hypotese-vs-funn]`,
  men på en ny kant: feilen lå i oppsettet, ikke i tolkningen. **Regelen: før du
  ber brukeren måle, sjekk at hver variant treffes av nøyaktig én oppføring — en
  test der to regler dekker samme kall måler ingenting.**

## 2026-08-25 (natt) — Alle tre fulgt; men jeg rapporterte et utfall bare brukeren kunne se, og skrev et forbud som traff prosjektets eget ord

**Evaluering av forrige økts tre punkter — alle fulgt:**

- **[proev-forslaget-mot-prosjektets-egne-laerdommer]** — **fulgt, sjuende
  påfølgende runde.** Belegg, to ganger med reell effekt på forslaget: (1) før
  språkfiksen søkte jeg i `maler.md` og fant at «Snakk norsk» alt fantes der med
  innhold — det snudde diagnosen fra «malen mangler reglene» til «bare dette
  repoet mangler dem», og gjorde fiksen liten. (2) Før allowlist-forslaget søkte
  jeg på `allow` i hele `plugins/faseflyt/` og fant tre treff, alle i løpende
  tekst. Jeg var i ferd med å foreslå «legg om formen i malen»; funnet var at
  malen ikke hadde noen allowlist i det hele tatt. **Se promoteringsforslaget
  under — nå sjuende runde.**
- **[foelg-kontrakten-du-selv-leser]** — **fulgt, og strykes.** Belegg:
  oppstarten holdt 0.5.0-formen (åpningslinje, nåsituasjon, ett neste steg,
  kvittering), og jeg sjekket utkastet mot «avvik, ikke gjennomføring» før jeg
  sendte det. Feilen i samme melding var av en annen familie — se det nye punktet
  under.
- **[tilby-valgene-brukeren-faktisk-har]** — **fulgt, og strykes.** Belegg: da
  språkproblemet kom, la jeg «gjør det ferdig nå» inn som anbefalt alternativ
  framfor å tilby å føre det i `TODO.md`; for allowlisten spente de tre
  alternativene fra hele settet via et smalere sett til utsettelse. Begge ble
  besvart uten oppklaringsrunde.

**Nye punkter:**

- **[ikke-rapporter-utfall-du-ikke-kan-se]** Jeg skrev «**null**
  godkjenningsdialoger» om en oppstart der BK hadde fire, og brukte det som
  belegg for at 0.5.4 virket. Jeg kan ikke se permission-dialoger — jeg sluttet
  det fra at mine egne kall var i tilde-form, og oppgav slutningen som
  observasjon. Det er samme feil som `[hypotese-vs-funn]`, men på en kant
  disiplinen ikke dekket: utfallet fantes ikke i noe verktøysvar jeg hadde.
  **Regelen: rapporter bare det verktøysvarene faktisk viser. Utfall bare
  brukeren kan se — dialoger, hva skjermen viste, om noe føltes tregt — spørres
  om eller utelates.**
- **[flytt-regelen-dit-den-leses]** Jeg foreslo først å notere språkfunnet i
  `laering.md`. BK ville ha det løst, og løsningen var å flytte reglene fra en
  fil som lastes ved oppsett til fila som leses hver økt. `TODO.md` hadde alt
  belagt samme årsakskjede, og forrige rettelse ble en *henvisning* — som ikke
  virker bedre enn ingen regel. Femte gang prosjektet betaler for mønsteret.
  **Regelen: foreslår jeg en regel, sjekk i samme åndedrag om den lastes der den
  skal virke — og er svaret nei, er plasseringen fiksen, ikke teksten.**
- **[skriv-forbud-som-treffer-bare-det-du-mener]** Tabellinja mi forbød «porten»
  generelt. Ordet har to betydninger i dette repoet, og den ene — det som må
  passeres før en endring havner på `main` — er innarbeidet og bærer mening. BK
  godtok ordlyden, og jeg måtte stramme den til «kvalitetsport» i samme økt.
  **Regelen: et forbud rettes mot betydningen, ikke mot bokstavene. Før jeg
  forbyr et ord, søk om det har en annen bruk i prosjektet som skal beholdes.**

**Promoteringsforslag — sjuende runde, står fortsatt:**

`[proev-forslaget-mot-prosjektets-egne-laerdommer]` har nå overlevd sju
påfølgende faseslutt og er fulgt uoppfordret i hver av dem. Ratchet-en sier tre.
Forslaget er uendret bortsett fra plasseringen: `CLAUDE.md` har ikke lenger
seksjonen «Målinger og språk» — den ble delt i denne økten — så punktet hører nå
under `## Målinger`. Ut av STATUS samtidig.
**Krever BKs klarsignal — aldri automatisk.**

## 2026-08-25 (sent kveld) — Alle tre fulgt; men jeg brøt utdatakontrakten jeg nettopp hadde lest, og tilbød to valg som begge var feil

**Evaluering av forrige økts tre punkter — alle fulgt:**

- **[proev-forslaget-mot-prosjektets-egne-laerdommer]** — **fulgt, sjette
  påfølgende runde.** Belegg: før jeg foreslo allowlist-ordlyden søkte jeg i
  `maler.md` etter målte permission-former, og fant at alle målte Bash-regler
  bruker kolon-prefiks mens stiformer er eksplisitt utestet. Det endret
  forslaget mitt fra mellomromsform til `Bash(git status:*)`. Uten søket ville
  jeg foreslått en form prosjektet selv har notert som overraskende.
  **Se promoteringsforslaget under — nå sjette runde.**
- **[still-spoersmaal-som-tar-ja-som-svar]** — **fulgt, og strykes.** Belegg: to
  avsluttende spørsmål i økten («Skal jeg gjøre 1 og 2 nå — altså redigere de
  fire filene …», «Skal jeg commite disse fem filene og pushe til `main`?»).
  Begge er formulert så «ja» bare kan bety én ting, og begge ble besvart med et
  bart «kjør» uten oppklaringsrunde. Erstattes av punktet under, som er samme
  familie men en annen kant.
- **[tell-forekomster-ikke-omtaler]** — **fulgt, og strykes.** Belegg: jeg holdt
  «fem kall matchet ikke» (mitt tall, talt) adskilt fra «fem dialoger» (BKs tall,
  observert av BK), og nektet å skrive `&&` som årsak i CHANGELOG uten å ha
  isolert den — formuleringen «`&&` er ikke isolert som variabel» står i
  utgivelsesteksten. Disiplinen holdt der den kostet noe.

**Nye punkter:**

- **[foelg-kontrakten-du-selv-leser]** Jeg skrev ~35 linjer i en fase-start der
  alt var rent og 0.5.0-kontrakten sier normaltilfellet er én linje. Kontrakten
  sto i skillteksten jeg hadde lest samme runde, og BK måtte påpeke det. Dette
  er ikke en pakkefeil: teksten var riktig og til stede. **Regelen: når en skill
  jeg kjører oppgir et konkret utdatamål, sjekk utkastet mot det målet før jeg
  sender — ikke bare mot om innholdet er sant.** Alt jeg skrev var korrekt; det
  var mengden som brøt kontrakten, og korrekthet skjuler den feilen for meg.
- **[tilby-valgene-brukeren-faktisk-har]** Jeg spurte «vil du at jeg legger dem
  i `TODO.md` nå, eller tar vi dem ved faseslutt?». Begge alternativene var
  varianter av *før dem ned*; BK ville ha dem *fikset* («ut av verden») og måtte
  formulere det tredje alternativet selv. Spørsmålet var entydig — feilen var at
  alternativsettet ikke dekket den mest nærliggende handlingen. **Regelen: før
  jeg tilbyr et valg, sjekk at alternativene spenner over det brukeren
  realistisk kan ville — særlig at «gjør det ferdig nå» er med når posten er
  liten nok til det.**

**Promoteringsforslag — sjette runde, står fortsatt:**

`[proev-forslaget-mot-prosjektets-egne-laerdommer]` har nå overlevd seks
påfølgende faseslutt og er fulgt uoppfordret i hver av dem. Ratchet-en sier tre.
Forslaget er uendret: inn i `CLAUDE.md` under «Målinger og språk», ut av STATUS.
**Krever BKs klarsignal — aldri automatisk.**

## 2026-08-25 (kveld) — Alle tre fulgt igjen; men jeg spurte et spørsmål som ikke kunne besvares entydig, og talte omtaler som forekomster

**Evaluering av forrige økts tre punkter — alle fulgt:**

- **[proev-forslaget-mot-prosjektets-egne-laerdommer]** — **fulgt, og nå femte
  påfølgende runde.** Belegg: (1) da BK reiste utdatamengden, søkte jeg i
  `TODO.md` før jeg foreslo noe — og fant både det parkerte
  retningsspørsmålet («én flyt, mindre maskineri») og 2026-08-18-avgjørelsen «ikke
  nedgrader innholdet». Uten det søket ville jeg foreslått en trimming som så ut
  til å gjenåpne en avgjort sak; med det kunne jeg vise at aksene er ulike.
  (2) Jeg leste `logg.md` 61–80 før jeg kommenterte `data-size`, og gjentok
  dermed ikke premisset som alt var avvist der. **Se promoteringsforslaget under.**
- **[maal-det-maalbare-foer-du-spor]** — **fulgt, og strykes.** Belegg:
  tørrkjøringsøkten meldte `data-variant="primary"` som «samme stille-virkningsløse
  felle som `data-size`». Jeg målte `components.md` før jeg skrev noe — og linje
  198 sa det motsatte: attributtet er dokumentert, med `primary` som standard.
  Målingen snudde konklusjonen og stoppet en pakkeendring som ville vært feil.
  Samme disiplin på `.ds-link`: verifisert at klassen finnes før den gikk inn i et
  ordlyd-forslag.
- **[les-status-for-indre-motsigelser]** — **fulgt, og strykes.** Belegg: ved
  fase-start fant jeg at STATUS linje 12 («Fase 3 gjenstår») motsa dens egen
  neste-liste («Fase 2 i tørrkjøringen») — to faseslutt betyr at fase 2 *og* 3
  gjenstår. Meldt i kvitteringen, ikke etter at det hadde styrt en beslutning.

**Nye punkter:**

- **[still-spoersmaal-som-tar-ja-som-svar]** Jeg avsluttet et ordlyd-forslag med
  «si fra hvis ordlyden skal justeres, så redigerer jeg» og fikk «Juster
  ordlyden!». Det kunne bety både *gjør endringen i fila* og *endre teksten du
  foreslo* — to motsatte handlinger. Jeg måtte gjette og flagge gjettingen, og i
  et repo der klarsignal er selve porten er det en dårlig plass å gjette.
  Feilen var min egen formulering: jeg bygde spørsmålet slik at «ja» var
  tvetydig. **Regelen: formuler spørsmålet så et bekreftende svar bare kan bety
  én ting** — «si ja, så redigerer jeg» framfor «si fra hvis den skal justeres».
- **[tell-forekomster-ikke-omtaler]** Jeg meldte `.claude/settings.json`-fenomenet
  som «tre forekomster». Det var to prosjekter; den tredje var samme fil nevnt om
  igjen av fase-slutt-vakten. Tallet var ett steg fra å gå inn i en pakkefil som
  datert måling, der det ville blitt stående som belegg ingen kunne etterprøve.
  **Regelen: skill mellom en ny forekomst og en ny omtale av den samme.** Teller
  du belegg, tell hendelser — en gjentakelse i en samtale er ikke et nytt
  datapunkt.

**Promoteringsforslag — femte runde, står fortsatt:**

`[proev-forslaget-mot-prosjektets-egne-laerdommer]` har nå overlevd fem
påfølgende faseslutt og er fulgt uoppfordret i hver av dem. Ratchet-en sier tre.
Forslaget er uendret: inn i `CLAUDE.md` under «Målinger og språk», ut av STATUS.
**Krever BKs klarsignal — aldri automatisk.** Mønsteret er nå målt i begge
retninger: brutt den ene økten det var strøket, fulgt fem ganger da det sto.

## 2026-08-25 (natt) — Alle tre fulgt; men jeg la en luke i en issue-tekst for noe som var ett kall unna å måles

**Evaluering av forrige økts tre punkter — alle fulgt:**

- **[proev-forslaget-mot-prosjektets-egne-laerdommer]** — **fulgt, tre ganger
  uoppfordret.** Belegg: (1) da BK meldte `data-size`-funnet, søkte jeg i pakkens
  egen `components.md` framfor å ta tørrkjøringsøktens premiss for god fisk — og
  fant linje 1367, som dekker nettopp de fire klassene; det stoppet et issue på
  feil premiss. (2) Jeg leste `fase-slutt/SKILL.md` steg 6 i sin helhet før jeg
  påsto at positiv kontroll mangler, framfor å påstå det fra grep-treffet alene.
  (3) `gh issue list --state all` kjørt før issue-teksten ble skrevet — #7 viste
  seg å ligge nær (kvalitetsporten), men ikke overlappe. **Se
  promoteringsforslaget under: dette er fjerde påfølgende runde.**
- **[begrensning-er-ikke-det-samme-som-hull]** — **fulgt, og strykes.** Belegg:
  ratchet-en ble meldt som «målt i én retning — den gunstige», ikke som lukket
  sløyfe. `data-size`-funnet ble meldt som ekte observasjon med uverifisert
  forklaring, ikke som «referansefila mangler dette». Issue #16 fikk både en
  ærlighetsklausul om hva en positiv kontroll *ikke* dekker (et galt regex kan
  bestå den) og en «ikke løst av dette»-linje om at sjekken fortsatt bare er en
  instruks. Samme disiplin fant feilen i vår egen STATUS: en overskrift som påsto
  mer enn punktlisten under.
- **[bruker-er-kilden-for-tilgangsfakta]** — **fulgt, og strykes.** Belegg:
  spurte BK hvilken maskin tørrkjøringen kjørte på og hvordan fase-slutt-vakten
  faktisk ordla seg, framfor å anta fra natt-loggen. Delelinjen holdt i den andre
  retningen også: `gh issue list` og `gh issue create` mot vårt eget repo kjørte
  jeg selv uten å spørre, siden det er repoets egen tilstand og ikke org-tilgang.
  Begge gikk gjennom.

**Nye punkter:**

- **[maal-det-maalbare-foer-du-spor]** Jeg skrev `‹maskin›` som en luke i
  issue-teksten og spurte BK om å fylle den — men maskinnavnet var ett kall unna:
  `hostname` + `uname -m` kjørte jeg først *etter* at BK hadde svart, og de
  bekreftet det jeg kunne målt før jeg spurte. Delelinjen i
  `[bruker-er-kilden-for-tilgangsfakta]` gjelder *tilgangsfakta*, ikke alt BK vet
  noe om: hva maskinen heter er målbart, hvilken maskin en handling skjedde på er
  BKs kunnskap. Jeg blandet dem og la et hull i en tekst jeg ellers var klar til å
  publisere. **Regelen: er svaret målbart fra denne maskinen, mål det først — spør
  bare om det bare brukeren kan vite.**

  **Andre forekomst, samme økt, i sikkerhetssjekken minutter etter at punktet var
  skrevet:** jeg kjørte `git grep -c 'Renhetsporten' -- CLAUDE.md` som positiv
  kontroll og fikk null treff — ordet står i STATUS, ikke i `CLAUDE.md`. Jeg valgte
  kontrollord fra hukommelsen om en fil jeg hadde i kontekst. En kontroll som selv
  er ukontrollert måler ingenting. Utvidelsen av regelen: **verifiser at
  kontrollstrengen finnes før du bruker den som kontroll** — ellers er den positive
  kontrollen bare et femte søk som kan feile stille.
- **[les-status-for-indre-motsigelser]** Ved fase-start leste jeg hele STATUS og
  kvitterte på arbeidsmåte-punktene, men **oppdaget ikke at fila motsa seg selv
  sju linjer fra hverandre**: linje 22 sa «alle tre rytmevaktene målt i begge
  retninger», linje 29–30 sa «scope-vakten er den eneste uprøvde». Jeg fant det
  først da BK meldte fase 1-resultatet og jeg gikk til loggen. En 69-linjers fil
  jeg nettopp hadde lest i sin helhet. Årsaken er strukturell: «hva som er
  verifisert» og «Neste — start her» skrives som separate seksjoner i `fase-slutt`
  steg 3, så de kan sprike uten at noen leser dem mot hverandre. **Regelen: les
  STATUS' verifisert-påstander mot dens egen neste-liste før du kvitterer — de er
  skrevet i ulike steg og kan motsi hverandre.**

**Promoteringsforslag (fjerde påfølgende faseslutt) — gjentas:**
`[proev-forslaget-mot-prosjektets-egne-laerdommer]` har nå stått i fire
påfølgende faseslutt: innført 2026-08-24, strøket som innarbeidet samme dag
(kveld), **brutt** natten etter, og **fulgt tre ganger uoppfordret** i denne
økten. Mønsteret er nå målt i begge retninger, og det er selve argumentet: regelen
virker når den står der, og ble brutt i den ene økten den var strøket. Det er
definisjonen på en manglende permanent regel, ikke en påminnelse. Forslaget står
uendret — inn i repoets `CLAUDE.md` under «Målinger og språk», ut av STATUS.
**Venter fortsatt på BKs klarsignal.**

**Gjelder arbeidsflyten selv:** `[les-status-for-indre-motsigelser]` er et
pakkefunn så vel som et prosjektpunkt — `fase-start` har ingen sjekk av STATUS mot
seg selv. Det ligger nær issue #15 («fase-start bør liste `kunnskap/` framfor å
stole på at STATUS nevner alt») og hører antakelig som en kommentar der framfor et
eget issue. Tilbudt BK, ikke opprettet.

## 2026-08-24 (natt) — Alle tre fulgt; men jeg ga et råd som prosjektets egne målinger alt hadde avkreftet

**Evaluering av forrige økts tre punkter — alle fulgt, alle strykes:**

- **[maskinen-og-miljoeet-maales-som-alt-annet]** — **fulgt, og strykes.** Belegg:
  `hostname` + `uname -m` kjørt FØR commit-meldingen ble ferdigstilt, ikke etter.
  Og målingen endret teksten: jeg hadde skrevet «AMD64» av vane, `uname -m` ga
  `x86_64`, og meldingen ble rettet til den målte strengen før commit. Samme
  disiplin i cache-målingen, som navngir maskin og arkitektur.
- **[egen-ordlyd-fortjener-samme-blikk-som-diffen]** — **fulgt, og strykes.**
  Belegg: `git diff --cached` lest i sin helhet før commit, og jeg konstaterte
  eksplisitt at den stemte ordrett med det godkjente forslaget. Fire filer rørt,
  fire filer avtalt — ingenting «litt ekstra».
- **[soek-bredt-foer-du-melder-null]** — **fulgt, og strykes.** Belegg:
  cache-diffen gikk over `find . -type f` i hele plugin-treet (11 filer), ikke et
  utvalg, og den hadde positiv kontroll mot 0.4.0 — som ga 2 avvik, presis de to
  filene commiten rørte. Kontrollen målte altså både at søket kunne finne avvik og
  at det fant de riktige.

**Nye punkter:**

- **[proev-forslaget-mot-prosjektets-egne-laerdommer]** — **gjentakelse, og den
  koster denne gangen.** Etiketten ble strøket som innarbeidet i forrige faseslutt.
  Denne økten brøt jeg den: jeg anbefalte `gh pr merge --admin` for å komme forbi
  PR-kravet, med begrunnelsen at BK er repo-admin. Svaret sto i `plan.md`, målt
  2026-08-18 — regelsamlingen `Hardening` ligger på **organisasjonsnivå** med
  **tomme bypass-aktører** og `require_last_push_approval`. Repo-admin har
  ingenting å overstyre med. Jeg leste ikke prosjektets egen måling før jeg ga
  rådet, og BK brukte kveldstid på et forsøk som ikke kunne lykkes. Samme økt
  reviderte jeg alvorlighetsgraden i det samme funnet tre ganger — hver revisjon
  drevet av en måling fra den *andre* økten, ikke av at jeg leste våre egne filer.
  **Regelen er: før et råd om tilgang, regler eller konfigurasjon — søk i
  `plan.md`, `TODO.md` og `logg.md` etter om det alt er målt.** Tre påfølgende
  faseslutt: se promoteringsforslaget under.
- **[begrensning-er-ikke-det-samme-som-hull]** Når jeg melder hva en måling IKKE
  dekket, skal jeg si den smaleste sanne versjonen — ikke den mest dramatiske.
  Belegg: BK gjennomførte hele `/grill-me` og valgte anbefalingen hver gang. Jeg
  meldte det som at «`/grill-me` ble **ikke** målt denne runden» og skrev et helt
  avsnitt om at grillingen som gruppeverktøy var udekket. BK svarte: «Grilling er
  grilling og den fungerte.» Det var riktig — mekanismen kjørte, spørsmålene ble
  stilt, beslutningene ble låst. Det eneste uprøvde var den ene grenen der et svar
  går mot anbefalingen. Jeg gjorde en kant til en kategori, og det svekker de
  grensene som ER reelle: en rapport som overdriver hull blir lest med rabatt.
- **[bruker-er-kilden-for-tilgangsfakta]** Fakta om org-roller, tilganger og hva
  BK *kan* gjøre i GitHub er noe BK vet og jeg må måle. Da spør jeg framfor å
  probe. Belegg: jeg satte i gang fem `gh api`-kall for å finne ut om BK kunne
  skru av hardening per repo. Kallet ble avvist, og svaret kom i én setning: «Jeg
  kan slå av hardening på enkelte repoer… Jeg har jo gjort det med det repoet vi
  holder på med nå.» Det kostet en avvist verktøykjøring og en runde ekstra i en
  samtale sent på kvelden. Skillet: *pakkens* oppførsel måler jeg selv;
  *organisasjonens* oppsett og BKs egne rettigheter spør jeg om først.

**Promoteringsforslag (tre påfølgende faseslutt):**
`[proev-forslaget-mot-prosjektets-egne-laerdommer]` har nå stått i tre påfølgende
faseslutt — innført 2026-08-24, evaluert som fulgt og strøket 2026-08-24 (kveld),
og brutt i kveld. Et punkt som kommer tilbake én økt etter at det ble strøket, er
ikke en påminnelse: **det er en manglende regel.** Foreslår å skrive den inn i
repoets `CLAUDE.md` under «Målinger og språk» og fjerne den fra STATUS. Venter på
BKs klarsignal — promotering skjer ikke automatisk.

**Gjelder arbeidsflyten selv:** org-regelsamlingen som stopper faseslutt for en
person som jobber alene, er et pakkefunn — `fase-slutt` steg 7 antar push rett på
`main`. Ført som issue, se steg 2e i denne faseslutten.

## 2026-08-24 (kveld) — Tre punkter fulgt, det tredje ga tre funn; men jeg navngav maskinen uten å måle den

**Evaluering av forrige økts tre punkter — alle fulgt, alle strykes:**

- **[proev-forslaget-mot-prosjektets-egne-laerdommer]** — **fulgt, og strykes.**
  Belegg: før `hjelp`-forslaget ble lagt fram, søkte jeg etter feilen forslaget
  kunne gjenskape, og fant to — at issue #6 selv advarte mot README-duplisering,
  og at `nytt-prosjekt` alt hadde vært gjennom to-kopier-drift. Det formet
  designet framfor å bli et forbehold etterpå: den STATUS-lesende halvparten kan
  per definisjon ikke drive fra README, og ordforklaringstabellen ble bevisst
  IKKE kopiert inn. Samme sjekk avgjorde issue #4s tilleggsmulighet — fortetning
  framfor sletting, fordi repoets egne to ryddinger begge var pekere.
- **[retning-til-bruker-detaljer-til-meg]** — **fulgt, og strykes.** Belegg: to
  retningsspørsmål stilt (statisk kontra STATUS-lesende, ordliste ja/nei), og alle
  detaljer avgjort selv med etterfølgende melding om hva som ble valgt —
  triggeravgrensning, ingen `references/`-mappe, plassering av steg 4 før
  commit-steget, `--amend` framfor egen fiks-commit, og «commit-steget» framfor
  «steg 7» i `maler.md`. Ingen detaljspørsmål gikk til BK.
- **[verifiser-verktoeyet-ikke-bare-utfallet]** — **fulgt på verktøy, brutt på
  maskinen. Videreføres i skjerpet form, se nytt punkt under.** Belegg for at det
  virket: tre funn kom av å måle verktøyet — (1) `claude plugin validate` skrev
  selv at den leste manifestet, så jeg sjekket om den åpnet `SKILL.md`; den gjør
  ikke det, og porten hadde et hull; (2) issue #4s foreslåtte `--since`-form ble
  prøvd før den ble skrevet inn, og ga 0 treff der seks commits fantes; (3) tom
  verdi i en git-range ble prøvd i et tomt test-repo og feilet stille. Positiv
  kontroll på hvert rapportert søk: kanarifugl på alle fire
  frontmatter-bruddene, cache-diffen mot 0.2.4, «steg 99» for stegsøket.
  **Men samme økt påsto jeg maskinnavn uten et eneste kall.** Punktet dekket
  verktøyene mine og ikke premissene mine.

**Nye punkter:**

- **[maskinen-og-miljoeet-maales-som-alt-annet]** Maskin, arkitektur og miljø er
  måledata på linje med søkeresultater — de utledes ikke av hva som ville passet
  historien. Belegg: jeg skrev «kontor-PC (Snapdragon/ARM)» i loggen og
  «kontor-PC-en» i to commit-meldinger som nå er pushet. `hostname` gir
  `VPC-5CG3433WMH` og `uname -m` gir `x86_64` — hjemme-PC-en. BK stoppet det, ikke
  jeg. Årsaken er verre enn slurv: `TODO.md` sier cache-målingen må gjøres om på
  kontor-PC-en, og jeg leste maskinen jeg satt på som den maskinen fordi det
  gjorde historien hel. Konsekvensen var reell — jeg meldte en TODO-post som
  lukket, og den er fortsatt åpen, siden ARM-leddet er umålt. Repoets `CLAUDE.md`
  krever at målinger navngir maskinen; da er maskinnavnet det første som må måles.
- **[egen-ordlyd-fortjener-samme-blikk-som-diffen]** Ordlyd jeg selv har foreslått
  og fått godkjent, leses ikke på nytt før den committes — og det er nettopp der
  feilen overlever. Belegg: README-raden «Når du har glemt hvordan det gikk» sto i
  et forslag BK godkjente, ble committet, og ble først oppdaget da jeg leste
  `git show` på min egen commit. «Hvordan det gikk» betyr hvordan det *endte*,
  ikke hvordan det *virker* — og README er teksten en fersk kollega leser først.
  Godkjent ordlyd er ikke verifisert ordlyd.
- **[soek-bredt-foer-du-melder-null]** Et søk som er avgrenset for å bli lesbart
  måler smalere enn det påstår. Belegg: ved renummereringen av `fase-start` søkte
  jeg etter linjer med både «fase-start» og «steg» — det ga null, og jeg meldte
  «ingen foreldede referanser». Ved renummereringen av `fase-slutt` søkte jeg
  bredt (`steg [0-9]` over hele `plugins/`) og fant `maler.md`, som pekte på
  commit-steget og installeres i hvert nytt prosjekt. Det brede søket kjørt i
  ettertid viste at den første renummereringen var trygg — men den var heldig,
  ikke målt.

*Kuttet fra denne runden for å holde tre aktive punkter:
[maal-konvensjonen-foer-du-retter-etter-den] — jeg rewrappet en CHANGELOG-linje
til 80 tegn etter en konvensjon jeg ikke hadde målt; repoets maks er 90/101/167.
Harmløst utfall, samme premissfeil som punkt 1, og dekkes av det.*

**Gjelder arbeidsflyten selv:** funnet om at `claude plugin validate` ikke leser
skills er ført i pakken framfor som issue — dette repoet ER pakken, og det er
rettet i `sjekk.sh` og `docs/installasjon.md` i `8eda2c3`.

## 2026-08-24 — Kilden slo notatet fem ganger; men jeg foreslo maskineri prosjektet alt hadde forkastet

**Evaluering av forrige økts punkt:**

- **[kilden-teller-ikke-listen]** — **fulgt, og strykes.** Belegg, fem ganger i
  én økt: (1) ni issues ble lest i sin helhet framfor klassifisert på titlene —
  det avdekket at åtte av dem sa «Timing: etter merge av PR #2», som var merget en
  uke før; (2) tre TODO-poster ført som ugjorte ble verifisert mot kildefilene med
  grep før de ble omtalt som ugjorte; (3) `kunnskap/kollegatest.md` og
  `testplan.md` ble funnet ved å liste mappa framfor å stole på at STATUS nevnte
  alt; (4) `enabledPlugins`-formen ble lest ordrett fra `maler.md` — den er et
  objekt med boolske verdier, og jeg ville skrevet en liste; (5) cache mot repo
  ble målt fil for fil framfor å stole på STATUS' «målt ren». Punktet var
  avgjørende nok at det ble anvendt uoppfordret.

**Nye punkter:**

- **[proev-forslaget-mot-prosjektets-egne-laerdommer]** Før et forslag legges
  fram: sjekk om prosjektet alt har navngitt feilen forslaget gjenskaper. Belegg:
  jeg foreslo en pre-push-hook som 1.0-port. Den kunne ikke verifiseres utenfra
  (én config-kommando per maskin, følger ikke med i klonen, `--no-verify`, hopper
  over halve seg selv uten `claude` på PATH) — altså nøyaktig «formelt på plass,
  reelt borte», som står navngitt tre steder i dette repoet fra før
  (deny-regler, rytmevakter, den inerte workflowen). BK stoppet det med «mye
  styr», ikke jeg. Repoet har en liste over egne lærdommer; den skal leses som
  sjekkliste mot eget forslag, ikke bare som historikk.
- **[retning-til-bruker-detaljer-til-meg]** Spør brukeren om retning, avgjør
  implementasjonen selv, og fortell hva som ble valgt. Belegg: hook-forslaget ba
  BK avgjøre to detaljer — om manglende `claude` skulle stoppe pushen eller
  advare, og om skittent arbeidstre skulle stoppe eller advare. Begge var mine å
  avgjøre. Det kom rett etter at BK hadde sagt at et annet spørsmål var uklart
  formulert, og svaret ble «Dette var vanskelig». To spørsmål om detaljer kostet
  mer tillit enn de sparte i risiko.
- **[verifiser-verktoeyet-ikke-bare-utfallet]** Et søk som ikke kan feile
  synlig, måler ingenting — sjekk at verktøyet ser det du tror før utfallet
  rapporteres. Belegg, tre ganger samme økt: `grep -c $'\r'` ga 75 for både
  CRLF- og LF-fila fordi mønsteret kollapset til tomt og matchet hver linje;
  `ps -p` meldte to levende PID-er som døde fordi Git Bash bare ser
  MSYS-prosesser; lenkesjekken meldte falsk brutt lenke fordi den ikke løste
  relativt til fila. Alle tre ble sagt før de ble avløst av et verktøy som
  faktisk så målet (`git ls-files --eol`/`cmp`, `Get-Process`, korrigert sti).
  Renhetsscriptet i dette repoet har prinsippet innebygd — kontrollsøket først —
  og det gjelder like fullt for engangssøk i chatten.

## 2026-08-21 (sent kveld) — Promoteringen landet; begge nypunktene fulgt

**Evaluering av forrige økts punkter:**

- **[beskrevet-omfang-er-avtalt-omfang]** *(4. gang — fulgt, og PROMOTERT.
  Strykes fra STATUS.)* Belegg: alle tre delpunktene i køpunkt 2 gikk som
  ordlydsforslag med eksplisitt «klarsignal per punkt», og skrivingen startet
  først etter «Kjør alle». Ratchet-en er fullført: regelen står nå permanent i
  repo-CLAUDE.md (`f1b4a68`), som lastes i hver økt i dette repoet.
- **[paaminnelser-utfoeres-ikke-gjengis]** — **fulgt. Strykes.** Belegg:
  hostname ble målt i selve fase-start-kvitteringen (`VPC-5CG3433WMH`, AMD64)
  som handling, ikke gjengivelse — og versjonssjekkens tre ledd ble målt før
  oppsummeringen ble skrevet. Ett datapunkt, men oppførselen var umiddelbar og
  komplett; punktet var en presisering, ikke et brudd som må bevises over tid.
- **[metadata-i-kallet-er-maaledata]** — **fulgt. Strykes.** Belegg:
  skill-kallets basekatalog (`...\faseflyt\0.2.3\...`) ble lest som øktens
  første handling og rapportert i kvitteringen — avvikssituasjonen fra forrige
  økt kunne ikke gjenta seg usett.

**Nytt punkt:**

- **[kilden-teller-ikke-listen]** Når kopier skal speiles, tell avvikene mot
  kilden — ikke mot notatet som omtaler dem. Belegg: `TODO.md` navnga tre
  ordlisterader som skulle speiles; mekanisk sammenligning av websidens
  ordliste mot tabellen fant en fjerde (`økt`), som ble med i leveransen.
  Notater eldes i det kilden endres — sammenligningen gjøres FØR forslaget
  skrives, og notatets liste brukes som kontroll, ikke som fasit.

## 2026-08-21 (kveld) — Vurderingspunktet lukket; påminnelser skal utføres, ikke gjengis

**Evaluering av forrige økts punkter:**

- **[beskrevet-omfang-er-avtalt-omfang]** *(4. gang — fulgt)*. Belegg: begge
  leveransene gikk som ordlyd-forslag pluss eksplisitte beslutningsspørsmål før
  noe ble skrevet — installasjonsvernet ventet på fire valg, versjonssjekken på
  tre, og skrivingen startet først etter «Ja, som foreslått». **Ratchet-en:**
  fjerde påfølgende innslag, og blokkeringen (vurderingspunktet) er nå borte —
  promoteringen til en repo-CLAUDE.md er klar til beslutning og ligger som eget
  købunkt i STATUS. Punktet står i STATUS til den beslutningen er tatt.
- **[beslutninger-forplanter-seg]** — **fulgt. Strykes.** Belegg: da
  versjonssjekk-målingen drepte premisset «disk-måling er nok», ble konsekvensen
  ført gjennom alt som hvilte på det i samme runde — måleprosedyren fikk
  omstarts-leddet i CHANGELOG, STATUS og TODO, og unntakslisten ble oppdatert i
  samme redigering som linjebrytingen som brøt den.

**Nye punkter:**

- **[paaminnelser-utfoeres-ikke-gjengis]** En per-økt-påminnelse er en handling,
  ikke en opplesning. Belegg: «sjekk hostname først» sto i STATUS og ble gjengitt
  i fase-start-kvitteringen, men hostname ble først målt midt i økten, da
  versjonssjekk-målingen tilfeldigvis trengte den. Gjør påminnelsen til et steg
  som utføres idet den kvitteres — ellers er kvitteringen teater.
- **[metadata-i-kallet-er-maaledata]** Skill-kallets basekatalog bar
  versjonsnummeret hele tiden. Belegg: `...\faseflyt\0.1.0\...` sto synlig i
  øktens FØRSTE melding, og avviket mot STATUS («0.2.2 verifisert») ble ikke
  flagget før BK stilte versjonsspørsmålet timer senere. Les metadataene i
  kallet som måledata, ikke som pynt.

## 2026-08-21 — Alle tre fulgt; beslutninger forplanter seg

**Evaluering av forrige økts punkter:**

- **[beskrevet-omfang-er-avtalt-omfang]** *(3. gang)* — **fulgt. Videreføres én
  økt til.** Belegg: hele klarspråkrunden gikk som nummererte forslag med
  eksplisitt vent-på-godkjenning — to diskusjonsrunder, 13 punkter, ingenting
  skrevet før «Alt ok — kjør». Da BK sa «vi diskuterer ferdig før du gjør noe»,
  ble også lesingen gjort som diskusjonsgrunnlag, ikke som retting. Videreføres
  likevel: forrige økt var et brudd, og ett fulgt-datapunkt etter et brudd er
  ikke innarbeidet. **Merk ratchet-en: tre påfølgende innslag = manglende regel.
  Landingen (en repo-CLAUDE.md) er alt utformet, men parkert av BK bak
  vurderingspunktet om installasjon — promoteringen venter der.**
- **[artefakter-divergerer-uten-eier]** — **fulgt, og strukturelt løst. Strykes.**
  Belegg: Utstyrsskapet-sitatet i `TODO.md` ble oppdatert i samme runde som
  websiden og likheten verifisert mekanisk med positiv kontroll. Viktigere: BKs
  kanalbeslutning fjernet selve kopisettet — én delt kanal (artefakten), én kilde
  (`ki-samling-oppgaver.html`), ett tracket sitat.
- **[scratchpad-er-ikke-lagring]** — **fulgt. Strykes.** Belegg: ingenting ble
  lagt i scratchpad denne økten; alle leveranser gikk til `kunnskap/lokalt/` og
  artefakten.

**Nytt punkt:**

- **[beslutninger-forplanter-seg]** Når brukeren fatter en beslutning som dreper
  en premiss, gå gjennom alt som hviler på premissen i samme runde — navn,
  metaforer, instrukser — i stedet for å vente på neste korreksjon. Belegg begge
  veier fra samme økt: footerens «Dette er arket dere som deltar får» fanget jeg
  selv og flagget etter kanalbeslutningen; men omdøpingsforslaget mitt,
  `ki-samling-deltakerark.html`, ble avvist av BK fordi «ark» var nøyaktig den
  metaforen beslutningen tre meldinger tidligere hadde drept. Samme økt lot jeg
  også STATUS-instruksen om `build-docx.ps1` bli stående til den ble ryddet av
  selve fase-slutten.
## 2026-08-20 — Klarspråkrunden: to punkter innarbeidet, ett gjentok seg

**Evaluering av forrige økts punkter:**

- **[mønsteret-koder-eksempelet-ikke-hensikten]** *(1. gang)* — **fulgt sterkt.
  Strykes.** Belegg, seks separate tilfeller der jeg fanget en måling som ikke
  kunne feile: (1) `$pid` er skrivebeskyttet i PowerShell, så `Get-Process` målte
  øktens egen prosess og svarte «LEVENDE» uansett input — oppdaget og målt om.
  (2) Byte-hashing meldte 10 cache-avvik der 9 var reelle; CRLF mot LF. Bygget
  normalisering *pluss* to kontroller: fanger ett innsatt tegn, ignorerer CRLF.
  (3) `[char]0x72 + 'oyktest'` ble to søk, så «røyktest» ble aldri sjekket.
  (4) `bash` finnes ikke på PATH fra PowerShell, så «renhetssjekk exit 0» kom fra
  forrige kommando — porten hadde ikke kjørt. (5) En ordrett-sammenligning
  strippet `>` bare i strengens start og meldte avvik i identisk tekst.
  (6) Før jeg påsto at steg 6 mangler «ikke overskriv»-klausulen, leste jeg
  `maler.md` for å se om malen dekket det steget ikke sa. Punktet fyrte
  forebyggende, ikke i ettertid.
- **[ingen-lukker-todo]** *(1. gang)* — **fulgt. Strykes.** Belegg: (1) Etter
  språkvasken søkte jeg `TODO.md` på det berørte og annoterte linje 53 framfor å la
  posten stå som åpen defekt. (2) Den ordrette Oppgave 6-kopien i `TODO.md` ble
  oppdatert i samme runde som lappen, og likheten verifisert mekanisk. (3) STATUS
  punkt 3 lukket med belegg. (4) Jeg rettet STATUS **to** ganger da mine egne
  endringer gjorde den usann — først da `784f039` sluttet å være HEAD, så da cachen
  ble ren igjen.
- **[beskrevet-omfang-er-avtalt-omfang]** *(2. gang)* — **delvis fulgt.
  Videreføres.** Belegg for: jeg beskrev omfang før hver av de to «småtingene», sa
  eksplisitt fra da jeg avvek fra eget forslag (beholdt `test-faseflyt`-deklarasjonen
  framfor å fjerne den), og stoppet helt på konsekvensspørsmålet — «jeg rører
  ingenting før du sier fra». Belegg mot, og det er tungt: BK sa «raffinere disse
  oppgavene **litt ekstra**». Jeg skrev om hele Ark 2, la til ordliste, skrev om
  designsporet, endret alle seks bestillingene og la inn en ny
  fasilitatorseksjon — i **én** `Write`, rett etter diagnosen, uten å vente på
  svar. Jeg beskrev, men jeg avtalte ikke. «Litt ekstra» og en full omskriving er
  ikke samme bestilling.

**Nye punkter:**

- **[artefakter-divergerer-uten-eier]** Samme tekst i N kopier divergerer innen én
  økt hvis ingen kopi er kilde. Enten generér de andre fra én, eller verifiser
  likhet mekanisk i samme runde — aldri «jeg skrev det samme begge steder». Belegg:
  ordlisten endte i tre kopier (arket, websiden, pakketabellen), og jeg skapte selv
  et avvik på to rader ved å legge `verifisere` og `mock-data` i to av dem. Oppdaget
  bare fordi en mekanisk sammenligning ga `mock-data = 0` i `.docx`-en. Motgiften
  virket der jeg brukte den: `.docx`-en bygges *fra* `oppgavelapper.md`, så den kan
  ikke drifte. Websiden er i dag den ene kopien uten den koblingen — og etter to
  ordlydsrunder ligger den to runder foran arket. Det er nøyaktig samme
  råtneproblem som pakken alt har en regel mot for skills («deklarer, aldri
  kopier»); jeg gjentok det med prosatekst.
- **[scratchpad-er-ikke-lagring]** Leveranser hører i prosjektet, aldri i øktens
  scratchpad — den er midlertidig og forsvinner med økten. Belegg, og det er
  pinlig presist: **tidligere i samme økt** målte jeg at en scratchpad-sti fra 18.08
  var `BORTE` (den lå som foreldreløs rad i plugin-registeret nettopp fordi mappen
  var slettet). Likevel skrev jeg både websidens kildefil og `build-docx.ps1` dit,
  og oppdaget det først da BK sa «fortsetter i morgen». Kopiert til
  `kunnskap/lokalt/` (gitignorert, varig) før avslutning. Beviset lå i min egen
  måling én time tidligere, og jeg koblet det ikke.

**Ført i loggen, ikke som aktivt punkt** (dekket av en varig instruks i STATUS i
stedet): **[måling-dør-når-du-pusher]** — «installert = repoet» er sant til neste
push. Vi målte cachen ren, pushet 0.2.2, og gjorde vår egen STATUS-påstand usann i
samme økt.

**Gjelder arbeidsflyten selv, men ingen issue opprettet:** funnene om steg 6 og om
klarspråkregelens plassering gjelder pakken. Dette *er* pakkerepoet, og
issue-mekanismen finnes for kollegaer som ikke kan redigere pakken selv — samme
begrunnelse som står i `TODO.md`. Ført som vurderingspunkter i stedet, etter BKs
beslutning om at ingenting rettes før konsekvensene er gjennomgått.

## 2026-08-19 (sen kveld) — Arket strammet, TODO ryddet, og et omfang jeg utvidet underveis

**Evaluering av forrige økts punkter — alle tre fyrte, alle tre strykes:**

- **[git-add-alt-er-å-publisere-usett]** *(2. gang)* — **fulgt, og den fyrte
  forebyggende. Strykes.** Belegg: (1) Jeg committet ikke, og viste
  `git status --short` + diffstat + `git check-ignore -v` framfor å påstå at
  endringene var som forventet. (2) Jeg navnga hva renhetssjekken IKKE dekker: det
  nye arket er untracket, så ingen av de ti søkene leser det. (3) Sterkeste belegg:
  punktet fyrte *før* feilen skjedde. `.gitignore` dekket bare Office-formater, så
  arbeidsdokumentet jeg var i ferd med å skrive som `.md` ville blitt tracket og
  klonet til hver kollega. Jeg tettet det før jeg skrev fila, ikke etter. Forrige
  gang var samme klasse feil oppdaget i ettertid, på en `.docx` som alt var pushet.
- **[grønn-sjekk-er-ikke-grønn-port]** *(2. gang)* — **fulgt. Strykes.** Belegg:
  (1) BK ba om en forklaring på PowerShell-hullet; jeg nektet å svare fra `TODO.md`
  alene og målte malene først — og fant at teksten TODO pekte på (`maler.md:235-236`)
  ikke finnes lenger, og at hullet var innarbeidet som grense 6–9. Hadde jeg svart
  fra hukommelsen, hadde jeg beskrevet et løst problem som åpent. (2) Før 293 linjer
  ble slettet, dumpet jeg de elleve grenselinjene og verifiserte hver skjøt. (3) Jeg
  målte at den nye ignore-regelen faktisk fyrer, framfor å anta at mønsteret var
  riktig skrevet.
- **[mvp-drift]** *(2. gang)* — **fulgt, men svakest av de tre. Strykes med
  forbehold.** Belegg for: jeg holdt frysen, foreslo blank økt framfor mer bygging,
  og flagget at PreToolUse-hooken ikke er på kritisk vei til samlingen. Belegg mot:
  TODO-ryddingen var mitt forslag, ikke BKs behov — den forsvares av at den fjerner
  villedende informasjon foran en tørrkjøring, og av at den *krympet* 212 linjer
  framfor å legge til, men den var initiert av meg.

**Nye punkter:**

- **[beskrevet-omfang-er-avtalt-omfang]** Når brukeren sier ja til et forslag, er
  det forslagets *ordlyd* de har godkjent — ikke det du finner ut er riktig når du
  er inne i fila. Utvider du, si det først. Belegg: jeg tilbød å «rette den
  foreldede TODO-seksjonen», entall. Da jeg målte, var fire seksjoner foreldet, og
  jeg fjernet alle fire — 293 linjer — og viste diffstat etterpå framfor å beskrive
  omfanget først. Utfallet var riktig og reversibelt (backup tatt, boundaries
  verifisert, innholdet finnes i `logg.md` og `maler.md`), så dette er ikke en
  skade. Men det er samme form som `[arvet-regel-prøves-før-den-etterleves]`, som
  ble strøket for to økter siden nettopp fordi jeg hadde utvidet en regel før jeg
  spurte. Testen neste gang: sier tilbudet «seksjonen» og målingen sier «fire
  seksjoner», er det en ny setning til brukeren, ikke en større Edit.
- **[mønsteret-koder-eksempelet-ikke-hensikten]** Står hensikten i en kommentar og
  eksemplene i mønstrene, er mønstrene feilen — ikke kommentaren. Sjekk alltid en
  filter-, deny- eller ignore-regel mot et tilfelle som *ikke* er blant dem den ble
  skrevet for. Belegg: `.gitignore`-kommentaren sa «arbeidsdokumenter i `kunnskap/`
  holdes lokale», mens mønstrene var `*.docx|xlsx|pptx|pdf`. Hensikten var
  filtype-uavhengig; implementasjonen dekket bare de fire formatene det tilfeldigvis
  hadde vært et dokument av. Første `.md` ville gått rett i git og videre til hver
  kollega. Dette er samme form som grense 9 i `maler.md` (navnebaserte mønstre kan
  ikke bli komplette) — pakken kjente lærdommen på ett sted og ikke på et annet,
  som er nøyaktig det mønsteret vi alt har betalt for tre ganger.
- **[ingen-lukker-todo]** Arkivfiler forfaller stille fordi ingen eier lukkingen.
  `fase-slutt` overskriver STATUS, føyer til `logg.md` og `laering.md` — men rører
  aldri `TODO.md`. Den vokser derfor monotont, og et løst funn som står der leses
  som en åpen defekt. Belegg: 293 av 598 linjer var rettede funn; det alvorligste
  punktet pekte på maltekst som ikke finnes lenger, og en HYPOTESE-seksjon beskrev
  en testrigg for et spørsmål grense 5 alt hadde besvart. Konkret vane til neste
  gang: retter du noe i pakken, søk på filnavnet i `TODO.md` i samme økt og lukk
  posten der. Dette gjelder **arbeidsflyten selv**, ikke bare dette prosjektet — se
  vurderingen under.

**Gjelder dette skillene?** Ja, `[ingen-lukker-todo]` er en reell mangel i
`fase-slutt`: den har ingen TODO-hygiene-steg. Issue er likevel **ikke** opprettet,
samme begrunnelse som den beslektede skjevheten lenger ned i `TODO.md`: dette *er*
pakkerepoet, og issue-mekanismen finnes for kollegaer som ikke kan redigere pakken
selv. Ført her og i `TODO.md` i stedet.

## 2026-08-19 (kveld) — CI-porten, språkvasken, og en scope-korreks jeg burde tatt selv

**Evaluering av forrige økts punkter:**

- **[todo-er-datert-observasjon-ikke-tilstand]** *(3. gang)* — **fulgt, og den fyrte
  gjentatte ganger. Nådd tre påfølgende faseslutt ⇒ foreslått promotert til
  `CLAUDE.md`, ut av STATUS.** Belegg for etterlevelsen: (1) STATUS påsto hardening
  var av per 19.08; jeg målte om før jeg anbefalte rett-på-main, framfor å arve
  påstanden. (2) Loggen sa «renhetssjekk: ren» — jeg kjørte søkene om mot gjeldende
  tre før jeg skrev dem inn som CI-regler, og to av dem viste seg å slå ut på seg
  selv. (3) Jeg nektet å føre CI-porten som verifisert da Actions viste seg avslått.
  (4) Da `printf` slukte `\U` og en kanarifugl aldri ble plantet, forkastet jeg det
  grønne resultatet framfor å kreditere det. Fulgt konsistent i tre økter ⇒ dette er
  en stående regel, ikke en korrigering jeg trenger påminnelse om.
- **[arvet-regel-prøves-før-den-etterleves]** *(2. gang)* — **fulgt, den fyrte to
  ganger. Strykes.** Belegg (1): før sveipet på 27 språkvask-steder stoppet jeg og
  ba om godkjenning av ordtabellen, med eksplisitt henvisning til at jeg sist utvidet
  en regel før jeg spurte og at commit 2 måtte reversere commit 1. BK godkjente, og
  sveipet ble gjort én gang. Belegg (2): jeg målte de arvede kanoniske søkene fra
  `docs/installasjon.md` før jeg gjorde dem til porter — og fant at to av dem traff
  sin egen regeltekst. Hadde jeg kodet dem ordrett, ville CI feilet ved hver kjøring
  på seg selv.
- **[explore-delegering]** *(2. gang)* — **kunne ikke prøves, VIDEREFØRES OMFORMULERT.**
  Årsak: Explore-delegering var ikke tilgjengelig denne økten (økt-instruksen forbød
  å kalle Agent-verktøyet uten at brukeren ba om det). Punktet var altså skrevet mot
  en mekanisme som ikke alltid finnes. Målet bak det holder likevel, og ble fulgt med
  andre midler: jeg leste linjeintervaller framfor hele filer, brukte `git grep -c`
  for oversikt før innhold, og hentet ut én seksjon med `sed` framfor å lese
  `fase-slutt/SKILL.md` på nytt. Omformuleres til `[hent-bare-det-du-trenger]`, som
  er verktøyuavhengig og derfor faktisk etterprøvbar.

**Nye punkter:**

- **[grønn-sjekk-er-ikke-grønn-port]** Når leveransen er en *mekanisme*, mål at
  mekanismen er koblet til — ikke bare at delene virker. Rekkefølgen er poenget: den
  billige målingen skal komme før byggingen. Belegg: jeg skrev 276 linjer
  renhetsport, kanarifugl-testet alle sju krav, committet og pushet — og *deretter*
  oppdaget at Actions er avslått for repoet (`enabled: false`, `gh run list` tom).
  Ett `gh api`-kall, tilgjengelig fra første minutt, ville avdekket det før noe ble
  skrevet. Scriptet er bevist; porten er ikke i drift. Jeg meldte det ærlig som umålt
  underveis, men det er ikke det samme som å ha målt det først. Dette er pakkens egen
  lærdom («et ubekreftet vern er verre enn ingen») anvendt på meg selv.
- **[mvp-drift]** STATUS rangerer etter «høyest verdi», men ikke mot brukerens
  nærmeste mål. Sjekk rangeringen mot det målet før du bygger, ikke etter. Belegg:
  STATUS ga CI-porten som punkt 1 og jeg bygget den; BK bestemte samme økt at den
  holdes internt — den var altså ikke på kritisk vei til det faktiske målet, som er
  å teste på et par kollegaer. Det var BK som måtte si «jeg tror jeg har gått litt
  langt», ikke jeg. Målingen som burde utløst spørsmålet fra min side: `TODO.md` 535
  linjer + `plan.md` 605 linjer utredning mot en pakke som alt var testbar (README
  dekker begge de målte oppstartsfellene). Kontrast i samme økt: språkvasken kom fra
  en ekte bruker som ikke forsto tre ord, og traff kollegatesten direkte. Skillet
  mellom de to er hvem som etterspurte det.
- **[git-add-alt-er-å-publisere-usett]** `git add -A` er en publiseringshandling.
  Se hva som stages før du committer — særlig i et repo som klones av andre. Og en
  sjekk du melder som «ren» må navngi hva den *ikke* dekker. Belegg: jeg pushet en
  130 KB `.docx` jeg aldri hadde åpnet; alle ni renhetssøk hoppet over den fordi
  `git grep -I` ignorerer binærfiler, og porten meldte «0 feil» på en fil den ikke
  kunne lese. Min egen steg 5-glob traff `csv|xlsx|json` og aldri `.docx` — utsagnet
  «ingen uttrekksfiler tracket» var sant som skrevet, men lød bredere enn mønsteret
  det hvilte på. Rettet med et tiende søk som feiler på tracked binærfiler, men
  feilen var én `git status` unna å bli oppdaget før pushen. To lærdommer i én:
  `-I` er en stille avgrensning i ethvert `git grep`, og en glob i en sikkerhetssjekk
  må leses som «dette er alt jeg ser etter».
- **[les-pakkens-egne-regler-før-du-skriver-i-den]** Før du skriver brukerrettet
  tekst i et prosjekt som har stilregler, les reglene prosjektet selv håndhever.
  Belegg: klarspråk-regelen sto i `nytt-prosjekt/SKILL.md` og pakken brøt den to
  linjer nedenfor (27 treff) — og jeg la selv inn to nye brudd («positiv kontroll»,
  «kanarifugl») samme dag, i `docs/installasjon.md`, mens regelen lå i repoet jeg
  redigerte. Regelen er nå en tabell med åtte par pluss en fanget-alt-klausul, så
  denne konkrete feilen er institusjonalisert bort — punktet føres for mønsteret, og
  bæres ikke videre som aktiv korrigering.

## 2026-08-19 — Synkeøkten: `kunnskap/` inn i git, og regelsettet som målte én maskin

**Evaluering av forrige økts punkter:**

- **[riggen-fryses-under-måling]** *(1. gang)* — **fulgt, men svakt prøvd. Strykes.**
  Ingen måleøkt kjørte i dag, så regelen ble ikke satt på prøve slik den var tenkt.
  Det som fantes: renhetssjekken ble kjørt, deretter ble både reglene og filene
  endret, og sjekken ble kjørt om mot det nye treet framfor at det første
  resultatet ble gjentatt som fortsatt gyldig. Riktig oppførsel, men billig — jeg
  krediterer den ikke som mer enn det.
- **[egne-verktøy-treffes-av-pakkens-egne-feller]** *(1. gang)* — **fulgt, og den
  fyrte. Strykes.** Belegg: sti-mønsteret som skulle inn i det kanoniske
  regelsettet fikk egen positiv kontroll, og kontrollen avslørte en **falsk
  positiv i min egen test**. `printf` tolket `\U` og `\x` som egne escapes, så
  backslashen foran brukernavnet forsvant fra teststrengen — mønsteret traff, men
  fordi wildcarden `.` slukte første bokstav i navnet, ikke fordi Windows-armen
  virket. Nøyaktig
  klassen `-like`-fella tilhører. Hadde jeg stoppet ved «3 treff, mønsteret
  virker», ville en uverifisert sjekk gått inn i `docs/installasjon.md` som
  kanonisk krav. Kjørt om med korrekt streng: alle tre armer treffer, ingen
  selvtreff.
- **[todo-er-datert-observasjon-ikke-tilstand]** *(1. gang)* — **fulgt tre ganger,
  men VIDEREFØRES SKJERPET (2. gang)**, fordi regelen viste seg å gjelde bredere
  enn den ble skrevet. Belegg for etterlevelsen: (1) instruksen oppgav `main =
  e11f857` som faktum, og jeg fetchet før jeg bekreftet — før fetch viste lokal
  `main` «behind 9» mot en ref fra forrige økt. (2) Jeg nektet å kjøre
  `fase-start` på en `STATUS.md` fra 18.08. (3) `plan.md` påsto, **eksplisitt som
  målt 2026-08-18**, at hardening var på og ikke kunne slås av på repoet; målt
  19.08 ga `rules/branches/main` og `rulesets` begge `[]`.
  **Skjerpingen:** punkt 3 er ikke et TODO-punkt. Det er en måling, med dato og
  metode, i prosjektets egen plan — og den var like foreldet. Regelen ble skrevet
  om TODO-innslag; den gjelder alt datert, «målt» inkludert. En måling er et
  faktum om et tidspunkt, ikke om nå. Videreføres til skjerpingen faktisk er
  prøvd, ikke bare oppdaget.

**Nye punkter:**

- **[arvet-regel-prøves-før-den-etterleves]** En nedskrevet regel er en beslutning
  noen tok med informasjon jeg ikke har — men den er ikke immun. Før jeg
  gjennomfører et mekanisk sveip fra en arvet regel: sjekk at den generaliserer
  til dem den påstår å tjene, og at omgåelsene den bærer med seg fortsatt binder.
  Belegg (1): jeg utførte hele ryddetabellen, oppdaget at kontonavnet manglet i
  den, og løste hullet ved å **utvide** regelen — hyphenerte den inn i to filer til
  — framfor å spørre om en regel som navngir én person i det hele tatt er riktig i
  et repo som distribueres til andre. Den er ikke: `<brukernavn> = 0 treff` går ren
  for alle andre enn den ene personen. Commit 2 reverserte deler av commit 1.
  Belegg (2): jeg kopierte hyphenerings-omgåelsen fra `(v-t-f-k)` fordi den var
  presedens. Da samme problem dukket opp for stier, fant jeg en konstruksjon som
  er selvsikker uten å skjemme teksten — den fantes hele tiden. Presedens forklarer
  hvorfor noe ble gjort, ikke at det er den beste måten.
- **[explore-delegering]** Søk på tvers av flere filer der jeg trenger
  konklusjonen, ikke treffene, skal til Explore-subagenten — det står i den globale
  arbeidsflyten og jeg brukte den ikke i dag. Belegg: søket etter hvor
  `.claude/`-beslutningen sto trakk **60 linjer fra 7 filer** inn i hovedtråden.
  Jeg trengte to av dem (`STATUS.md:65` og `plan.md:171`). Resten var
  `~/.claude`-treff fra fem andre sammenhenger. Et delegert søk ville gitt de to
  linjene og latt konteksten være i bruk til arbeidet.

**Etikett-telling:** `[riggen-fryses-under-måling]` og
`[egne-verktøy-treffes-av-pakkens-egne-feller]` er strøket etter 1 gang og
nullstilles. `[todo-er-datert-observasjon-ikke-tilstand]` står nå på **2**
påfølgende faseslutt. `[arvet-regel-prøves-før-den-etterleves]` og
`[explore-delegering]` er første gang. **Ingen etikett har stått tre påfølgende
ganger ⇒ ingen promotering til `CLAUDE.md`.** Merk for neste faseslutt: står
`[todo-er-datert-observasjon-ikke-tilstand]` igjen, er den en manglende regel og
hører permanent i `CLAUDE.md`.

**Gjelder noe av dette arbeidsflyten selv?** Ett punkt, og som 18.08: dette *er*
repoet som eier skillene, så mekanismen er TODO/PR, ikke `gh issue create`.
Observasjonen: `fase-slutt` steg 4 definerer kvalitetsporten som «bygg/typecheck/
tester slik de er definert i `CLAUDE.md` eller `package.json`. Finnes ingen: hopp
over og si det». Dette repoet har ingen `package.json`, men har siden PR #13 en
reell port i `claude plugin validate` — ordlyden peker altså mot å hoppe over en
port som finnes. Ført i `TODO.md`. Ingen persondata eller interne detaljer i den
formuleringen, så den kan gjenbrukes ordrett hvis den skal bli et issue senere.

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
