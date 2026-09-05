# Fallgruver og mønstre som beviselig virker

Destillert fra prosjektene som formet denne arbeidsflyten (PoC-er og
integrasjonsprosjekter over flere måneder). Ikke synsing — hvert punkt har
skjedd og er loggført.

## Mønstre som beviselig virker — gjenta dem

- **Verifiseringsporten er brukeren, aldri Claude.** Hver fase brukertestes
  (browser, curl, kjøring) før neste fase starter. Ingen fase bygges videre på
  en uverifisert forutsetning. Loggfør hver fase to ganger: «skrevet
  (verifisering hos bruker)» og «verifisert ✅».
- **Beslutninger loggføres med navngitt beslutningstaker OG begrunnelse**
  (`**Beslutning (<beslutningstaker>, <tema>):** <valg> — <hvorfor>`). Det er den
  enkeltvanen som sparer mest tid ved tilbakelesing uker senere — «hvorfor gjorde
  vi det slik?» og «hvem bestemte?» får svar uten å spørre noen. Temaordet er for
  skanning; personen er poenget, og faller ut hvis plassholderen leses som tema.
- **Håndhevede regler slår skrevne regler.** En personvernpolicy som bare står
  i CLAUDE.md kan glemmes; den samme policyen som deny-regler i
  `.claude/settings.json` holdt gjennom et helt prosjekt. Regel + håndheving
  hører sammen som par. **Med ett forbehold, lært siden:** håndhevingen teller
  bare der den beviselig er koblet til og faktisk dekker verktøyet som brukes —
  ellers er den skrevne regelen alt du har, og da må teksten si det (se
  «Et ubekreftet vern …» under).
- **Generaliser UX-funn til mønstre, ikke lapper.** Da en lagring uten
  bekreftelse ga en feiltasting rett i databasen, ble ikke det ene tilfellet
  fikset — en generell bekreftelsesdialog-regel ble innført for ALL lagring i
  admin. Én konkret friksjon → én regel, ikke én lapp.
- **Observert oppførsel slår dokumentert oppførsel.** Når et API (særlig beta)
  oppfører seg annerledes enn dokumentasjonen/skillen sier, dokumenteres det
  observerte i `kunnskap/` med eksplisitt forrang-regel over skillen. Ikke anta
  at dokumentasjonen vinner.
- **En regel omgås ikke i én melding — den endres skriftlig.** Ber brukeren om
  noe en stående regel (deny-sett, personvernregel, CLAUDE.md-punkt) forbyr, er
  riktig svar å foreslå at regelen endres i filen den bor i — ikke å gjøre et
  unntak «bare denne gangen». Regelen er verdt like mye som antallet unntak den
  ikke har.

## Fallgruver — ikke gjenta dem

- **TODO.md kom sent.** Gjenstående punkter samlet seg først i egen fil etter
  at planens faser var ferdige. En tom TODO.md fra dag 1 gir «må huskes, men
  ikke nå» et hjem gjennom hele prosjektet. (Derfor oppretter skillen den i
  steg 5.)
- **Windows-encoding-fella oppdages alltid for sent.** `Get-Content` uten
  `-Encoding utf8` mojibaker æøå — stille. Og motsatt vei: en `.ps1` med æøå
  lagret UTEN BOM mojibaker sine egne litteraler i 5.1. De to reglene ser ut som
  motsetninger og må derfor leses sammen. Inn i CLAUDE.md FØR første filskript,
  ikke etter første hendelse — og ikke i STATUS, som overskrives ved hver
  faseslutt. (Se `windows.md`.)
- **Kopierte skills råtner.** En skill som kopieres inn i et prosjektrepo «så
  andre kan overta» drifter fra originalen i stillhet. Deklarér de felles
  skillene i `.claude/settings.json`; kopier aldri. (Derfor steg 6.)
- **Planpekere til `~/.claude/plans/` råtner.** Planmodus-filer har
  autogenererte navn og ryddes — en STATUS som peker dit feiler måneder senere.
  Kanonisk plan bor i `kunnskap/plan.md`. (Derfor steg 4.)
- **Diff-baserte sikkerhetsverktøy forutsetter en diff.** Ved
  helhetsgjennomgang av et ferdig prosjekt er working tree clean — da må
  gjennomgangen gjøres manuelt langs de samme kategoriene. Planlegg
  helhetsgjennomgangen som egen fase, ikke som en avsluttende kjøring av
  `/security-review`.
- **Designverktøy-oppslag overrasker første gang.** `list_projects` i
  DesignSync viser kun design-system-prosjekter, ikke wireframe-prosjekter —
  de må leses via projectId. Ikke anta at listen er komplett.

## Testdisiplin — «én observasjon, ett utfall, én forklaring»

Gjelder all verifisering, ikke bare kode: en test som kan feile av flere grunner
måler ingenting. Del den i to FØR den kjøres.

- **`[flere-forklaringer]`** Tre varianter fra én eneste økt: en hypotese ført som
  funn uten at noe kall ble forsøkt; ett kall som konflaterte tre spørsmål
  (var konfigurasjonen lastet? traff stiformen? dekket regelen verktøyet?) i ett
  utfall; og en blokkering tilskrevet konfigurasjonen der innebygd
  spesialbehandling av filtypen var like sannsynlig forklaring. Ingen av de tre
  ga et svar som holdt.
- **`[hypotese-vs-funn]`** En overskrift skal ikke påstå mer enn forbeholdene
  under den tillater. Hører sammen med belegg-kravet i logg-malen: observert
  betyr «kall forsøkt, utfall sett» — alt annet er hypotese, med den konkrete
  testen som ville avgjort den navngitt.
- **`[tom-output-to-betydninger]`** Et tomt søkeresultat betyr «ingen treff» ELLER
  «målingen kjørte ikke» — og de to ser helt identiske ut. Belegg: et `grep`
  krasjet (etterlot en stack dump i katalogen) og ga tom output, som ble ført som
  et bekreftet nullresultat i en kontroll et helt argument hvilte på. Feilen ble
  oppdaget først da noen kjørte samme søk med et annet verktøy og fikk tre treff.
- **`[uverifisert-konfigurasjon]`** En observasjon gjort under en konfigurasjon
  som ikke ble skrevet ned ORDRETT før kjøring, kan ikke gjenbrukes senere.
  Belegg: én avvikende måling ble bærebjelken i en hypotese som styrte tre økter
  — helt til noen replikerte den og den ikke lot seg reprodusere. Konfigurasjonen
  den var målt under var da overskrevet flere ganger, så avviket kunne ikke
  forklares, bare lukkes som ikke-reproduserbart. Skriv oppsettet ordrett i
  loggen FØR du måler, ikke etter: det koster fire linjer og er forskjellen på en
  måling som kan gjenbrukes og en som må kastes.
  Før du kaller et null for målt: sjekk exit-koden, eller kjør et kontrollsøk som
  SKAL gi treff. Gjelder like fullt når du selv er den som «bare sjekket raskt».
- **`[selvobservasjon-i-samme-artefakt]`** Selvobservasjon og selvkorrigering kan
  ikke bo i samme artefakt. En korrigering skrevet til `## Arbeidsmåte neste økt`
  havner i den ene seksjonen `/fase-start` leser først og kvitterer på — så neste
  økt får den oppførselen instruert før den gjør noe som helst. Belegg: tre forsøk
  på å måle om en rytmevakt (at Claude foreslår `/fase-slutt` av seg selv) slår inn
  uoppfordret. Det første kunne forklares av to ting, det andre var ikke uavhengig
  av det første, og det tredje målte en økt som hadde lest instruksen på forhånd.
  Sløyfen virket som designet; det var målingen som ikke kunne gjøres innenfra.
  Skal du måle hva modellen gjør **uoppfordret**, mål ved første eksponering — i et
  prosjekt der korrigeringen ikke står i STATUS — eller skriv ned at målingen ikke
  var ren, så ingen senere tror den var det.
- **Et ubekreftet vern er verre enn ingen vern.** Det gir falsk trygghet, og
  modellens egen gode oppførsel kan maskere at regelen aldri var koblet til:
  avslår Claude et kall av eget skjønn, ble Claude Code selv aldri testet. Enhver
  håndhevet regel trenger derfor et kontrollkall som **bare kan feile av én
  grunn** — altså ett som ikke også dekkes av en skreven regel.
  (Oppskrift i `maler.md`.)
