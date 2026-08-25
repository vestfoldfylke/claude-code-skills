# Changelog

Semver per plugin. Endringer som brekker eksisterende `kunnskap/`-struktur i
scaffoldede prosjekter markeres **BRYTENDE** med migreringsnotat — `fase-start`
skal ellers alltid tåle eldre struktur.

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
