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
  motsetninger og må derfor leses sammen. Inn i STATUS FØR første filskript, ikke
  etter første hendelse. (Se `windows.md`.)
- **Kopierte skills råtner.** En skill som kopieres inn i et prosjektrepo «så
  andre kan overta» drifter fra originalen i stillhet. Deklarér org-skills i
  `.claude/settings.json`; kopier aldri. (Derfor steg 6.)
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

Gjelder all verifisering, ikke bare kode: en probe som kan feile av flere grunner
måler ingenting. Del den i to FØR den kjøres.

- **`[flere-forklaringer]`** Tre varianter fra én eneste økt: en hypotese ført som
  funn uten at noe kall ble forsøkt; ett kall som konflaterte tre spørsmål
  (var konfigurasjonen lastet? traff stiformen? dekket regelen verktøyet?) i ett
  utfall; og en blokkering tilskrevet konfigurasjonen der innebygd
  spesialbehandling av filtypen var like sannsynlig forklaring. Ingen av de tre
  ga et svar som holdt.
- **`[hypotese-vs-funn]`** En overskrift skal ikke påstå mer enn forbeholdene
  under den tillater. Hører sammen med belegg-kravet i logg-malen: observert
  betyr «kall forsøkt, utfall sett» — alt annet er hypotese med en navngitt probe.
- **Et ubekreftet vern er verre enn ingen vern.** Det gir falsk trygghet, og
  modellens egen gode oppførsel kan maskere at regelen aldri var koblet til:
  avslår Claude et kall av eget skjønn, ble harness-en aldri testet. Enhver
  håndhevet regel trenger derfor en **ukonfundert** probe — én som ikke også
  dekkes av en skreven regel. (Oppskrift i `maler.md`.)
