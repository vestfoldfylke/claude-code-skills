# Løpende logg

Datert logg over funn, overraskelser og beslutninger. Nyeste øverst.

## 2026-08-20 — Klarspråk: en ikke-teknisk leser målte pakken, og pakken tapte

Hjemme-PC-en `VPC-5CG3433WMH` (AMD64). `main` = `095a1c1` + denne. **faseflyt
0.2.1 → 0.2.2.** Økten avsluttes midt i ordlydsgjennomgangen av websiden.

### Levert

**Synk målt, og de tre `faseflyt`-oppføringene forklart.** `installed_plugins.json`
hadde to foreldreløse project-scope-rader fra testkjøringene 17.–18.08
(`test-faseflyt` og en siden slettet scratchpad), begge pinnet til 0.1.0 /
`cfc4558`. Radene fjernet; `plugin list` viser nå én per plugin. Deklarasjonen i
`test-faseflyt/.claude/settings.json` beholdt — den er riktig, det var raden som
var foreldet. **Observert:** `claude plugin uninstall -s project` nekter med «is
installed in user scope, not project» når samme plugin finnes i user scope, så
opprydding krevde redigering av registeret (backup tatt først).

**Språkvask av samlingsmaterialet** etter tilbakemelding fra en ikke-teknisk
kollega som ikke fikk noe ut av oppgavene. Hun leste `.docx`-en — den før
strammingen. **Observert ved å pakke ut `document.xml`:** 20 av 20 søkte fagord
finnes på ÉN deltakerlapp, 22 forekomster, og blokken gjentas på alle seks
lappene. Dokumentet bruker i tillegg `scaffold`, `røyktest` og `trigge` — tre ord
som alt sto i «Ikke dette»-kolonnen i pakkens egen klarspråktabell. Kontrollsøk på
et ord som ikke finnes ga 0.

Funnet var at **bestillingene virket** — det var arket rundt dem som ikke var
lesbart. `kunnskap/lokalt/oppgavelapper.md` har nå ordliste på Ark 2, og
mock-setningen som sto sist i alle seks bestillingene er erstattet.

**faseflyt 0.2.2:** ny forklaringstabell i `nytt-prosjekt/SKILL.md` ved siden av
erstatningstabellen. Ti arbeidsflytord med setningen som skal følge dem første
gang. Begge manifestene bumpet og krysssjekket — i forrige runde ble
`marketplace.json` stående igjen.

**To artefakter til finpuss:** en privat webside (deltakerark: ordliste + Ark 2 +
Ark 3, fasilitatorarket bevisst utelatt) og en utskriftsklar `.docx` på nytt
filnavn — originalen urørt, verifisert på tidsstempel. `.docx`-en bygges **fra**
`oppgavelapper.md` av `kunnskap/lokalt/build-docx.ps1`, så teksten har én kilde.
Scriptet er rent ASCII (verifisert byte for byte) og leser norsk med
`-Encoding utf8` — nettopp fella `windows.md` advarer mot. Verifisert etter bygg:
194 æøå intakt, alle seks bestillinger med, 0 jargontreff i deltakerdelen.

**Websiden er språkvasket to runder** etter BKs funn: «Det er dere som er porten»
(hvilken port?), `økt` brukt tre ganger uten forklaring, «Målet er rytmen», og at
steg 1 ikke sa *hvordan* man kommer i planmodus. Deretter: `/clear` mangler et
**hvorfor**, og samme mangel fantes i `planmodus`, `fase 0` og `mock-data`.

### Beslutninger

- **Beslutning (BK, installasjonssikkerhet):** ingenting rettes i pakken før
  konsekvensene er gjennomgått i detalj. Kravet er at kollegaene skal kunne
  installere pluginen uten at noe overskrives. Ført som vurderingspunkt.
- **Beslutning (BK, klarspråk):** tabellen utvides, men skill-navn skal fortsatt
  kunne brukes i opplegget — de må bare forklares godt. Derfor en
  *forklaringstabell*, ikke flere erstatninger: `fase` har ikke noe synonym, og
  `/clear` er et literalt navn. BKs begrunnelse tatt inn i pakken som regel: «jeg
  har jobbet med dette i ukesvis, så ikke rart at det blir uforståelig for en som
  ikke har vært med på reisen» — den som har skrevet materialet er dårligst egnet
  til å bedømme om det er lesbart.
- **Beslutning (BK, rekkefølge):** ordlyden gjennomgås før arket og `.docx`-en
  oppdateres, slik at de tre kopiene pusses én gang framfor tre.

### Funn og overraskelser

- **Observert: byte-hashing gir falske avvik mellom cache og repo.**
  Cache-checkouten er CRLF, repoet LF. Første måling meldte 10 avvik der 9 var
  reelle — `fase-start/SKILL.md` var innholdslik hele tiden. Normaliser linjeskift.
- **Observert: en måling av «installert = repoet» dør i det du pusher.** Vi målte
  cachen ren mot `784f039`, pushet 0.2.2, og gjorde vår egen STATUS-påstand usann i
  samme økt. STATUS måtte rettes to ganger.
- **Observert: klarspråkregelen var til stede i pakken og fraværende i arbeidet.**
  Arket ble skrevet av en økt i dette repoet; repoet har ingen `CLAUDE.md`; regelen
  bor bare i `nytt-prosjekt`, som lastes ved oppsett. Sjekket samtidig at
  CLAUDE.md-malen i `maler.md` ikke har noen språkregel i det hele tatt.
- **Observert: `nytt-prosjekt` steg 6 mangler «ikke overskriv»-klausulen** som steg
  1 og steg 8 har, og malen er et komplett JSON-dokument merket ordrett. Verste
  utfall er at en kollegas `enabledPlugins` for andre plugins forsvinner.
  Ikke rettet — vurderingspunkt.
- **Målt som ikke risiko:** ingenting i pakken skriver utenfor prosjektmappa (fire
  treff på `~/.claude`, alle lesing av planmodus-fila); skills er inert tekst;
  installasjon legger bare til en versjonert mappe (observert: `0.2.1/` opprettet
  ved siden av `0.1.0/`); `CLAUDE.md` er vernet i to steg.
- **Fire målinger som ikke kunne feile, fanget underveis:** `$pid` er
  skrivebeskyttet i PowerShell, så `Get-Process` målte øktens egen prosess og svarte
  «LEVENDE» uansett input; `[char]0x72 + 'oyktest'` ble to separate søk, så
  «røyktest» ble aldri sjekket; `bash` finnes ikke på PATH fra PowerShell, så
  `$LASTEXITCODE` ga «renhetssjekk exit 0» uten at porten hadde kjørt; og en
  ordrett-sammenligning strippet `>` bare i strengens start og meldte avvik i
  identisk tekst. Alle rettet og gjentatt med kontroll.

### Sjekker

Renhetssjekk `bash .github/renhet/sjekk.sh`: **10 søk / 0 feil / 0 advarsler** på
hver av seks commits. `claude plugin validate .`: **Validation passed**.
Cachen målt mot repoet etter oppdatering: **0 avvik på alle 10 filer**, med to
kontroller (fanger ett innsatt tegn, ignorerer CRLF).

## 2026-08-19 (sen kveld) — Samlingsarket strammet, TODO ryddet for løste funn ✅

Hjemme-PC-en `VPC-5CG3433WMH` (AMD64). `main` = `fba8674` + denne. faseflyt 0.2.1
uendret — ingen endring i `plugins/`, pakken står fortsatt fryst for MVP-test.

### Levert

**Oppgavearket til septembersamlingen lest og strammet.** `.docx`-en pakket ut
(en `.docx` er en zip; `document.xml` → tekst) og vurdert. Funn i strukturen:
13 av ~22 linjer per lapp var **ordrett like på alle seks lappene** («Slik kommer
dere i gang», «Vil dere dele dere», «Rammer»). Omskrevet til tre ark i
`kunnskap/lokalt/oppgavelapper.md`: fasilitatorark, ett felles ark til alle
grupper, og seks lapper som nå bare er bestilling + to uavklarte spørsmål +
notatfelt. Bestillingene er uendret — de skal være muntlige og upresise, det er
grillingens råstoff.

**`TODO.md` ryddet: 598 → 386 linjer.** Hele «Funn fra testplanen», HYPOTESE-
seksjonen om `Read(...)`-stiformer, testdisiplin-seksjonen og
deny-differensieringen er erstattet av én tabell som peker på hvor kunnskapen
faktisk bor. Sikkerhetskopi i scratchpad (`TODO.md.bak`) for denne økten;
innholdet ligger permanent i `logg.md` (17.–18.08), i `maler.md` og i
git-historikken.

**`.gitignore`:** `kunnskap/lokalt/` lagt til.

### Beslutninger

**Beslutning (BK, arbeidsordre):** rette den foreldede TODO-seksjonen og skissere
arket i strammere form, begge i denne økten. Begrunnelse: BK avslutter dagen her
og vil videre til tørrkjøring i blank økt.

**Beslutning (BK/Claude, tørrkjøringscase): Oppgave 6, Utstyrsskapet.**
Begrunnelse: den er unionen av 1 (liste, detalj, utlån til navngitte), 3
(datoberegnet status) og 4 (markering) — går den gjennom på 3–4 faser, går resten.
Reserve ved lite tid: 1, Donald Pocket. **Ikke** 5, Vaffelvakta: rotasjon + bytte
+ ferier er der en gruppe lettest bruker opp økta på domenelogikk framfor på
arbeidsflyten.

**Beslutning (Claude, lokal mappe framfor filnavn i `.gitignore`):**
`kunnskap/lokalt/` som mappe, ikke `kunnskap/oppgavelapper.md` som filnavn.
Begrunnelse: neste arbeidsdokument skal ikke kreve en ny `.gitignore`-vurdering.

**Beslutning (Claude, bestillingen inn i tracked fil):** arket er untracket og
synker derfor ikke til kontor-PC-en. Bestillingen til case 6 står ordrett i
`TODO.md`, som ER tracked, så tørrkjøringen kan kjøres på en annen maskin uten
arket.

### Funn

**Observert — `.gitignore` dekket hensikten i kommentaren, men ikke i mønstrene.**
Kommentaren over mønstrene sier at arbeidsdokumenter i `kunnskap/` holdes lokale.
Mønstrene var `kunnskap/*.docx|xlsx|pptx|pdf` — altså bare Office-formater. Et
arbeidsdokument skrevet som `.md` ville blitt **tracket og klonet til hver kollega
som installerer pakken**. Målt: `git check-ignore -v` på den nye fila ga treff
først etter at `kunnskap/lokalt/` ble lagt inn. Samme form som grense 9 i
`maler.md` (navnebaserte mønstre kan ikke bli komplette) — pakken kjente lærdommen
på ett sted og ikke på et annet.

**Observert — `TODO.md` var foreldet på sitt alvorligste punkt.** Bulletpunktet
merket ALVORLIGST pekte på `maler.md:235-236` for døde `Bash(Invoke-*)`-regler.
Målt med `grep`: de linjene finnes ikke lenger, og `maler.md:313` sier nå
eksplisitt at cmdlet-navn ikke hører i `Bash(...)`. Videre var HYPOTESE-seksjonen
om at bar filnavn-form aldri matcher **avkreftet** av grense 5 (bar form virker i
både prosjektrot og `.claude/`), samtidig som seksjonen fortsatt beskrev en rigg
for «neste økt». Nesten hele seksjonen var løste problemer som leses som åpne
defekter.

**Observert — arket påstår tre ting pakken ikke har målt.** (1) «Si "nytt
prosjekt"» hviler på at skillen trigger av seg selv, ikke på et eksplisitt
`/faseflyt:nytt-prosjekt` — slår den ikke inn, står gruppa fast på minutt null.
(2) «`web-prototype` trigger av seg selv» for webapp-typen, som står som umålt i
STATUS. (3) Designsporets mekanikk (`list_projects` viser bare
design-system-prosjekter, wireframe-prosjekt må åpnes med `projectId`,
token-overstyring i `app.css`) — arket er kanskje eneste kilde. Ført som
fasilitatorseksjon i arket.

**Antatt, ikke målt — kontor-PC-ens tilstand.** STATUS sier «Begge ferdig satt
opp»; `TODO.md`s Maskinstatus-seksjon (17.–18.08) sier at kontor-PC-en fortsatt
har gammelt oppsett. De motsier hverandre, og det kan ikke avgjøres fra
hjemme-PC-en. STATUS er nyest og veier tyngst, men det som ville avgjort det er
`claude plugin list` + en ordlydssjekk mot repoet på den maskinen.

**Ikke ryddet:** `.docx`-en ligger fortsatt i git-historikken fram til `cd50841`.
Uendret vurdering.

### Kvalitetsport og røyktest

`bash .github/renhet/sjekk.sh`: **10 søk, 0 feil, 0 advarsler.** Dekker ikke det
nye arket — det er untracket, og alle ti søkene leser bare trackede filer. Lest
manuelt i stedet: bare de oppdiktede navnene fra bestillingene, ingen stier,
ingen secrets. `claude plugin validate .`: se under. Røyktest: ingen env-filer ut
over `.env.example`, ingen treff på fødselsnummer eller `client_secret`.

## 2026-08-19 (kveld) — Renhetsport i CI, språkvask, og en scope-korreks fra BK ✅

Hjemme-PC-en `VPC-5CG3433WMH` (AMD64). `main` = `5ba65ed` → `a33a11e` + denne.
faseflyt 0.2.1 uendret.

### Levert

**Renhetskravene ble en port** (`ed04300`). `.github/renhet/sjekk.sh` — ni søk,
kjøres av både CI og lokalt, samme kode, slik at prosaen i `docs/installasjon.md`
og porten ikke kan drifte fra hverandre. Pluss workflow, unntaksliste for
FINT-deklarasjonslogikken, og `.gitattributes` (`*.sh` = LF — `bash script.sh`
feiler på CR på Linux-runneren).

**Språkvask** (`a33a11e`). Se beslutning under. 27 steder i pakken; TODO-punktet
om at `fase-slutt` steg 4 pekte mot å hoppe over en sjekk som finnes ble rettet i
samme endring, fordi det var samme formulering som skapte problemet.

**Steg 5 styrket som instruks** (denne commiten): datauttrekk mot `.gitignore`,
filene arbeidsflyten selv lager (former og feltnavn, aldri verdier), skjermbilder
som persondata, krav om å melde *hva* som ble kjørt, og en ærlighetsklausul om at
dette er en instruks og ikke en håndhevet regel.

### Beslutninger

- **Beslutning (BK, actions-omfang):** Actions holdes til dette repoet, ikke ut i
  kollegaprosjekter. Begrunnelse: innholdet er pakkeregler (gammel forkortelse,
  FINT-innhold utenfor `fint-graphql`, stier i `plugins/`) og hensikten er å verne
  distribusjonskanalen. Et kollegaprosjekt er ikke en kanal inn til andre.
- **Beslutning (BK, kollegavernet):** styrke `fase-slutt` steg 5 som **instruks**,
  ikke som mekanisme. Alternativene som ble vurdert og lagt bort: Action ut i hvert
  prosjekt (krever GitHub + Actions + org-avklaring per repo — friksjonen dreper
  bruk), og lokal `pre-push`-hook (best passform, men hooks følger ikke med i git,
  så den svekker overtakelseshistorien).
- **Beslutning (BK, MVP):** pakken fryses og testes på et par kollegaer framfor å
  poleres videre. Begrunnelse: den har vokst forbi MVP, og «helhetsvurdering»-
  spørsmålet (hvem pakken er for, hvor mye maskineri kollegaene skal ha) besvares
  bedre av to reelle brukere enn av mer analyse.
- **Beslutning (BK, direkte til main):** pakkeendring går rett på `main` når
  hardening er av; branch + PR gjelder når den er på. Målt samme dag, se under.

### Funn

- **Observert: Actions er avslått for repoet.** `actions/permissions` →
  `{"enabled": false}`, `gh run list` tom etter to pusher. Workflow-fila er altså
  inert. **Konsekvens:** porten er bygget og scriptet er bevist, men *porten* er
  ikke i drift — den er ikke verifisert, og skal ikke føres som det.
- **Hypotese: om avslaget er org-policy eller repo-bryter er uavklart.** Begge
  org-endepunktene ga 403, og feilmeldingen navngir **to** forklaringer (ikke
  org-admin / token mangler `admin:org`). Én observasjon, to forklaringer ⇒ måler
  ingenting. Avgjøres av: en org-admin, eller et token med `admin:org`.
  Repo-rollen er målt: `admin: true`.
- **Observert: to kanoniske renhetssøk slo ut på seg selv.** `client_secret` traff
  instruksjonsteksten som *beskriver* søket (5 treff, alle legitime), og `fint`
  traff deklarasjonslogikken `docs/installasjon.md` eksplisitt unntar. Skjerpet:
  `client_secret` krever nå tilordnet verdi; `fint` deler i hardt forbud mot
  FINT-*innhold* pluss unntaksliste for bar omtale.
- **Observert: kontrollsøket kunne tilfredsstilles av sjekkens egen tekst.** Første
  utkast søkte over hele repoet og ga 8 treff på «faseflyt» i et repo som bare
  inneholdt sjekkescriptet — altså bevist at `git grep` kjørte, ikke at søkene nådde
  pakken. Avgrenset til `plugins/`, re-verifisert: exit 1 i et repo uten pakke.
- **Observert: pakken brøt sin egen klarspråk-regel.** Regelen fantes
  (`nytt-prosjekt/SKILL.md`: «si «sette opp prosjektet», ikke «scaffolde»»), men
  listet ikke `kvalitetsport`/`røyktest`/`probe` — og pakken brukte dem to linjer
  nedenfor. Jeg la selv inn to nye brudd (`positiv kontroll`, `kanarifugl`) samme
  dag, i en fil jeg redigerte mens regelen sto der.
- **Observert: setningene BK reagerte på fantes ikke i noen fil.** `git grep` etter
  «røyktesten er ren og proben bevist levende» og «ingen package.json» ga null
  treff. De ble *satt sammen* av ordene i skillene og kom ut i chatten. Det flyttet
  fiksen: å vaske filprosa alene ville ikke stoppet dem.
- **Observert: plugin-cachen er foreldet mot repoet.** `/faseflyt:fase-slutt` lastet
  0.1.0-teksten med «Kvalitetsport», «Sikkerhetsrøyktest» og
  `**Beslutning (<navn>)**` — altså ordlyden før dagens språkvask. Repoet er
  kanonisk og ble fulgt. Ikke en defekt: cachen oppdateres av
  `/plugin marketplace update`, som ikke er kjørt etter dagens commiter.
- **Kvalitetsport (steg 4, ny ordlyd):** `claude plugin validate .` exit 0 og
  renhetssjekken 9 søk / 0 feil / 0 advarsler. Merk at det gamle steget ville meldt
  «ingen kvalitetsport» her, siden repoet ikke har `package.json`.
- **Kanarifugl-testing av porten:** alle sju harde krav slo ut med exit 1, det myke
  kravet ga advarsel med exit 0. Porten er bevist å kunne feile, ikke bare å kunne
  si OK.
- **Målt på nytt (opphever påstand fra samme dag):** hardening er av — `rulesets`
  `[]`, `rules/branches/main` `[]`, `branches/main.protected` `false`.
- **Observert, ETTER at faseslutt-commiten var pushet: en 130 KB `.docx` ble
  committet uten å ha blitt lest av noe søk.** `git add -A` stagede en fil jeg ikke
  hadde sett på, og alle ni søk hoppet over den fordi `git grep -I` ignorerer
  binærfiler. Porten meldte «9 søk / 0 feil» på en fil den ikke kunne lese. Steg
  5-globben min traff `csv|xlsx|json` og aldri `.docx` — utsagnet «ingen
  uttrekksfiler tracket» var sant som skrevet, men lød bredere enn mønsteret det
  hvilte på. Samme klasse som `[tom-output-to-betydninger]`.
  - **Hvorfor det veier mer i dette repoet:** `/plugin marketplace add` er en
    `git clone`, så alt tracket havner på disken til hver kollega som installerer
    pakken.
  - **Rettet i denne commiten:** tiende søk i `sjekk.sh` som lister tracked
    binærfiler og feiler på dem (unntaksliste `binaer-unntak.txt`, tomme filer
    filtreres siden de matcher ingenting). Kanarifugl-testet begge veier: slo ut på
    `.docx`-en med exit 1, ren etter untracking. `kunnskap/*.docx|xlsx|pptx|pdf` inn
    i `.gitignore`, og kravet dokumentert i `docs/installasjon.md`.
  - **Beslutning (BK, docx-en):** fila ble lagt inn med hensikt som
    vurderingsunderlag for samlingen. Den untrackes og blir liggende lokalt; nytt
    TODO-punkt om å teste én av casene. **Historikken skrives IKKE om** — fila
    finnes i `cd50841` for de med repo-tilgang, og det er akseptert.

## 2026-08-19 — To maskiner, tre PR-er merget, `kunnskap/` inn i git ✅

**Maskiner:** kontor-PC-en `VPC-8WD9VC4` (Dell, ARM64/Snapdragon X Elite, Win 11
Ent 10.0.26200, PS 5.1, ingen `pwsh`) formiddag; hjemme-PC-en `VPC-5CG3433WMH`
ettermiddag/kveld. `main` = `578dc95`. faseflyt **0.2.1**, konsistent.

**Merget i dag:** PR #12 (ordrett maltekst, merge `057a3fc`), PR #13
(manifest-konsistens), PR #14 (`kunnskap/` inn i git + omskrevne renhetskrav).

### Levert

**PR #13 — manifestene var ikke enige.** `plugin.json` sa 0.2.1,
`marketplace.json` sto på 0.2.0. Feilmodusen er den ubehagelige sorten: ved
installasjon vinner `plugin.json`, så pakken som installeres er riktig og
ingenting feiler — det eneste symptomet er at `/plugin`-listen viser feil versjon
til kollegaer, altså at det ene tallet de har å gå etter ikke er til å stole på.
`claude plugin validate` er lagt inn som eget steg i release-rutinen; den fanger
nettopp dette med presis feilmelding.

**Kontor-PC-en er ferdig og verifisert etter restart.** `~/.claude` flyttet fra
`master` til `main` (`c12b881`), de ni gamle duplikatfilene borte fra disk,
marketplace + tre plugins installert user scope (faseflyt 0.2.1, web-prototype
0.1.0, fint-graphql 0.1.0, alle enabled). Skillene eksponeres med
`faseflyt:`-prefiks; `fase-start`/`fase-slutt` er nå skills, ikke
slash-kommandoer. **Hele installasjonsstien er dermed målt på en maskin uten noe
av oppsettet fra før, på ARM.**

**PR #14 — `kunnskap/` inn i git.** Mappa har vært gitignored siden #1. Med to
maskiner gjorde det `STATUS.md` til en fil som ikke kunne synkes, og dermed til en
mulig konkurrent til seg selv. `.claude/settings.json` inneholdt maskinlokale
`Read`-tillatelser; innholdet er flyttet til `.claude/settings.local.json` og det
navnet er gitignorert.

### Beslutninger

**Beslutning (BK, test 4):** bakoverkompatibilitetstesten droppes helt —
retter det som ble skrevet i overleveringen samme dag om at den «kan kjøres fra
kontor-PC-en». Begrunnelse: den verner prosjekter med gammel `kunnskap/`-form, og
den eneste som har slike prosjekter er den som har brukt skillen til nå. Kollegaer
har ingen gamle prosjekter, så testen kan ikke avdekke noe som rammer dem. Det er
en regresjonstest for egne filer, ikke en utrullingstest for pakken.
Verifiseringsplanens punkt 5 utgår. Kravet i CHANGELOG om at `fase-start` skal
tåle eldre struktur står ved lag — det er bare den eksplisitte testen som droppes.

**Beslutning (BK, `.claude/`-plassering):** maskinlokale tillatelser flyttes til
`settings.local.json` framfor å gitignorere hele `.claude/`. Å gitignorere mappa
ville permanent stengt repoet fra å deklarere sine egne plugins — mekanismen
pakken finnes for. Regelen «lokale tillatelser committes ikke» sto tidligere bare
i en gitignorert note, uten noe som håndhevet den, samtidig som prosedyren sier
`git add -A`.

**Beslutning (BK, hardening og review):** branch-hardening slått av for repoet;
vi opererer alene fram til 1.0. Begrunnelse: reviewen var i praksis et stempel
uten leser, og en port ingen går gjennom er ingen port. Målt etter avslaget:
`rules/branches/main` og `rulesets` gir begge `[]`, `branches/main` gir
`protected: false`. **Konsekvensen står i `plan.md` og skal tas opp igjen ved
1.0:** repoet er en instruksjonskanal inn i kollegaers Claude-økter, det har ingen
automatisk sjekk utover `claude plugin validate`, og uten hardening og uten review
finnes det nå ingen port. Naturlig erstatning er en CI-sjekk som kjører
renhetssøkene med den positive kontrollen — en port som er en måling framfor en
person virker også når review er av.

### Funn

**En ufetchet remote-ref er ingen måling av remoten.** `git status -sb` viste
`## master...origin/master` uten ahead/behind, og det ble lest som «i synk med
origin». `origin/master` var en lokal ref som ikke var hentet siden juli —
maskinen lå tre commits bak, og en hel planleggingsrunde gikk med til å forberede
en sletting som allerede var gjort (`6cda506`, gjort hjemmefra 18.08). Ført i
`laering.md`. Gjentok seg i miniatyr samme kveld: lokal `main` viste «behind 9»
mot en ref fra før forrige økt, og `e11f857` kunne først bekreftes etter `fetch`.

**Diskriminatoren for installasjonen var innholdsbasert, ikke et versjonsnummer.**
Ved øktstart lød skill-beskrivelsen «**Scaffolder** fase-arbeidsflyten…»; etter
restart «**Setter opp** …». Ordbyttet er `85a02af`, som bare finnes i 0.2.1 — så
teksten som faktisk er lastet er 0.2.1 uavhengig av hva `claude plugin list`
rapporterer. Verdt å gjenta som metode: versjonsstrengen kan lyve (jf.
manifest-avviket i PR #13), ordlyden kan ikke.

**En renhetsregel som leter etter én persons brukernavn måler én maskin.**
Regelsettet krevde `<brukernavn>` og `<kontonavn>` = 0 treff. En kollega som
committer sin egen absolutte sti passerer alle søkene, og sjekken rapporterer
«ren» — den ser ut som en personverngaranti og er hygiene for én maskin. Verre
enn ingen regel, fordi den gir falsk trygghet. `docs/installasjon.md` er delt i
pakke / `kunnskap/` / måleregel, og sti-søket er nå generisk. Privat repo er ikke
lenger forbudt ved strengmatch — det er *funksjonen* som er problemet: en
installasjonsinstruks mot et utilgjengelig repo gir en død peker, mens det å nevne
et privat repo i historikk er greit. Prototyping under egen konto før flytting til
`vestfoldfylke` er en normal arbeidsmåte, ikke et regelbrudd.

**Selvrefererende regel har en bedre løsning enn hyphenering.** Et mønster som
krever et alfanumerisk tegn etter skilletegnet
(`C:.Users.[A-Za-z0-9]|/home/[A-Za-z0-9]|/Users/[A-Za-z0-9]`) treffer verken
regelteksten eller sin egen regex-literal, og slipper å skjemme teksten. `v-t-f-k`
beholder hyphenering, siden den er nulltoleranse på hele repoet.

**Hjemme-PC-ens plugin: innholdet er 0.2.1, alle versjonsetiketter sier 0.1.0.**
Målt ved faseslutt, med samme innholdsdiskriminator som PR #13 etablerte.
`claude plugin list` sier 0.1.0 (user scope), cache-katalogen heter `0.1.0`, og
`plugin.json` i cachen sier `"version": "0.1.0"` — men
`skills/nytt-prosjekt/SKILL.md` har `description: Setter opp fase-arbeidsflyten…`,
og `Scaffolder` finnes **0 ganger** i fila. Ordbyttet er `85a02af`, som bare finnes
i 0.2.1. De to gjenværende `scaffold`-treffene er den engelske triggerfrasen PR #12
beholdt med vilje.

Dette er samme defektklasse som PR #13 rettet, speilvendt: der løy
`marketplace.json` lavt mens installasjonen var riktig; her lyver hele
etikettsettet lavt mens innholdet er riktig. **Mekanismen er ikke målt** —
sannsynligheten er at `marketplace update` friskner opp filinnholdet i en katalog
som er navngitt etter versjonen ved installasjonstidspunktet, uten å skrive om
`plugin.json`. Står som hypotese med navngitt probe: sammenlign cachens filer mot
`main` byte for byte, og se om katalognavnet endrer seg etter en ny
`marketplace update`.

**Praktisk konsekvens er motsatt av det forrige STATUS advarte om.** Den sa
«installert plugin er 0.1.0 (`cfc4558`), marketplace-klonen er aldri oppdatert —
skal noe måles mot gjeldende skill må det legges prosjekt-scopet». Målt nå er den
lastede teksten gjeldende, så det ekstraarbeidet er ikke nødvendig for
`nytt-prosjekt`. Advarselen var selv en foreldet datert observasjon — tredje
instans av `[todo-er-datert-observasjon-ikke-tilstand]` samme dag, og den som
sitter i prosjektets egne notater framfor i en instruks utenfra. Merk at målingen
dekker `nytt-prosjekt`s `description`; at *alle* skillene i cachen er gjeldende er
ikke vist.

**Uforklart, tas neste økt:** `claude plugin list` viser **tre**
`faseflyt@claude-code-skills`-oppføringer — én user scope og to project scope, alle
enabled. De to prosjekt-scopede er sannsynligvis rester fra testriggene
(`test-faseflyt`, `prosjekt-a`), men det er ikke verifisert, og duplikater var
nettopp det ryddejobben 18.08 skulle fjerne.

**Sidefunn:** `web-prototype` er identisk mellom `~/.claude`-kopien og
repo-versjonen, byte for byte etter linjeskift-normalisering — ett ledd mindre i
issue #9; det gjenstående er repo mot konsollversjonen. Claude Code-sesjonen
overlevde både full PC-omstart og VS Code-restart med konteksten intakt; det er en
annen mekanisme enn `/clear`, så faseflyt-disiplinen er fortsatt nødvendig der og
ved maskinbytte.

**Observasjon om fase-slutt-skillen selv:** steg 4 formulerer kvalitetsporten som
«bygg/typecheck/tester slik de er definert i `CLAUDE.md` eller `package.json`.
Finnes ingen: hopp over». Dette repoet har ingen `package.json`, men har siden
PR #13 en reell port i `claude plugin validate`. Ordlyden peker altså mot å hoppe
over en port som finnes. Ført i `TODO.md`.

### Kvalitetsport og røyktest

`claude plugin validate .` — **✔ Validation passed**, exit 0. (Repoet har fortsatt
ingen `package.json`; dette er porten som finnes.)

Sikkerhetsrøyktest ren: ingen `.env`-filer sporet (29 sporede filer totalt), ingen
11-sifrede tall — proben bekreftet levende med 4-siffer-kontroll som ga treff i
fire filer — og alle fire `client_secret`-treff er instruksjonstekst, inkludert
skillens egen definisjon av sjekken.

Renhetssjekk kjørt etter `git add`, med positiv kontroll i samme runde: gammel
forkortelse 0, generiske brukerstier 0 i hele repoet, `claude-global-config` 0 i
pakken og 7 treff i `kunnskap/` som forventet, `faseflyt` treff i 16 filer.

## 2026-08-18 (kveld) — O8-fiksen: ordrett maltekst, PR #12 (skrevet, review hos bruker)

**Maskin:** `VPC-5CG3433WMH`. Branch `ordrett-maltekst`, seks commits, pushet.
**PR #12 er OPEN og venter review** — ikke merget. Faseflyt-versjon 0.2.1.

**Levert (STATUS-punkt 1):** steg 5, 6 og 8 i `nytt-prosjekt` krever nå ORDRETT
kopiering, med begrunnelsen som målt faktum og obligatorisk etterkontroll.
Kodeblokk-kontrakt øverst i `maler.md`. `windows.md` har fått en kopieringsklar
STATUS-snutt med begge BOM-halvdelene (lukker O7 — det fantes tidligere ingen
ordrett blokk å kopiere, bare en instruks om å legge inn «de viktigste reglene»).

**Punkt 2 — observert, GRØNT.** Fersk scaffold i scratch-katalog,
script/automatisering på Windows med persondata = ja, kjørt av en egen økt
(skriptholder-modell) med nøytralt katalognavn og en prompt uten ordene
«ordrett», «mal» eller «måling». Diff mot malkopien økten faktisk leste:
CLAUDE.md-avsnittet 54 linjer, STATUS-snutten 18, logg-malen 20, laering-malen 18
— **alle fire ORDRETT, null avvik.** Plassholderne fylt riktig; prosjektspesifikt
innhold lagt til som egne seksjoner. Verifiseringsporten i det scaffoldede
prosjektet: 8 kolonner, 0 rader, `EF BB BF` på CSV og begge `.ps1`.
Sterkeste encoding-beviset var utilsiktet: fixturens filnavn på disk
(`tørt-løvverk.pdf`, `årsrapport-blåbær.docx`) kommer fra scriptets egne
strenglitteraler og kunne ikke vært korrekte med feil fildekoding.

**Diskriminatoren jeg forhåndsregistrerte ble moot:** med null avvik finnes det
ikke noe utfall å attribuere til instruks kontra kontekstpress. Token-tallet
trengtes ikke. (Registrert FØR utfallet var kjent, som forrige økts punkt krevde.)

**Observert — to feil i min egen sjekker, funnet før den ble brukt:** (1) malblokkens
egne `##`-overskrifter avsluttet seksjonsuttrekket for tidlig, så uttrekket ble tomt;
(2) `-like` mismatchet stille på hver mallinje med backtick — 12 av 54 linjer
rapportert manglende i en fil der de sto ordrett, `.Contains()` på samme par ga
True. Årsak: backtick er escape-tegn i wildcard-mønstre. **Hadde jeg stolt på
sjekkeren usjekket, ville fiksen sett ut som en fiasko.** Ført inn i `windows.md`
som syntaksfelle.

**Observert — riggfunn:** marketplace-klonen er aldri oppdatert (`cfc4558`), så alle
tre pluginene står som **0.1.0**, pre-PR#2 — også de `fase-start`/`fase-slutt` denne
økten selv kjørte. Loggen (dette dokumentet, forrige innslag) bekrefter at
selvbærende-testen visste dette og målte CLAUDE.md-laget alene med vilje, så ingen
tidligere konklusjon rakner. Konsekvens for i dag: den fiksede skillen måtte legges
prosjekt-scopet, ellers ville målingen truffet gammel tekst.

**Observert — språkfunn fra brukeren:** måleøkten svarte «jeg trenger tre avklaringer
før jeg scaffolder». Vokabularet var pakkens eget: `nytt-prosjekt` omtalte seg selv
som å scaffolde på fem steder, og plan-malens fase het «Fase 0 — Scaffold og
røyktest» — ordet fulgte med inn i hvert prosjekts egen `plan.md` og ble stående.
Rettet, med stående regel om norsk i brukervendt tekst.

**Lukket uten arbeid:** Mac-skjevheten i `prosjekttyper.md` var alt rettet i PR #2
(CHANGELOG 0.2.0). Verifisert ved gjennomgang av samtlige `windows`/`powershell`-treff
i `plugins/faseflyt/`: alle betinget. TODO-oppføringen var utdatert og er merket
lukket. **Jeg var på vei til å gjøre arbeidet om igjen — TODO var kilden.**

**Beslutning (BK, språkrydding):** smalt omfang nå — scaffold-familien pluss en
stående språkregel. Begrunnelse: det er den lekkasjen som sprer seg videre inn i
prosjektenes egne filer. `harness` i referansefilene og `Triggere:` som
frontmatter-etikett er pakkeinterne og venter på egen gjennomgang.

**Beslutning (BK, samlingen):** ikke nedgrader innholdet for de 30. Formen er
gruppearbeid der skrivemaskinene er forhåndsinstallert på tre plattformer (Windows
x64, Mac, Snapdragon/ARM). Begrunnelse: installasjonsrisikoen flyttes til en
pre-flight, og da er `/grill-me` og planmodus gruppens beste øvelser framfor
seremoni å kutte. Full vurdering i `TODO.md`.

**Etter faseslutt, samme kveld:** overleveringskommentar postet på PR #12 (mønsteret
`[pr-som-overlevering]` — `kunnskap/` følger ikke klonen, og i morgen er på en annen
maskin). Uten stier eller brukernavn, siden hele organisasjonen leser repoet.
Synk-repoet `~/.claude` ryddet og pushet (`6cda506`): ni filer slettet,
whitelist-linjene fjernet, README peker på pakkens README framfor å duplisere
oppskriften. **Observert underveis:** «hvitliste-endringen» TODO etterlyste fantes
ikke som ventet — `settings.json` er gitignored og kan ikke synkes, så det gjaldt
whitelist-linjene i `.gitignore`. Verifisert framfor gjettet, og alle ni slettede
filer sjekket mot en ekvivalent i pakken før commit.

**Kvalitetsport:** ingen finnes (ingen `package.json`) — eksplisitt hoppet over.
**Sikkerhetsrøyktest:** ren, med positiv kontroll i samme kjøring (se STATUS).
**Kjent begrensning:** målingen dekker ÉN prosjekttype på Windows. Webapp-,
dokumentasjons- og API-typene er umålt, Mac er urørt.

## 2026-08-18 — Selvbærende-testen (verifiseringsplanens punkt 6) ✅

**Maskin:** `VPC-5CG3433WMH`. Denne økten var **riggholder**; måleøktene kjørte i
terminal-CLI mot en scratch-katalog. Full protokoll, tolkningstabell og tolv
observasjoner i `kunnskap/selvbaerende-test.md` (lokal — `kunnskap/` er gitignored).

**Metode:** tolkningstabell med sju rader + P4 låst FØR `~/.claude/CLAUDE.md` ble
flyttet til side. Ny prosess (ikke `/clear` — regler lastes ved oppstart).
Rundtur: naken arbeidsordre → `nytt-prosjekt` → én fase → `fase-slutt` →
`/clear` → `fase-start`. Fila lagt tilbake og verifisert før tolkning ble skrevet.

- **Punkt 6 — observert: premisset holder.** G1 (faser/verifiseringsport), G2
  (`kunnskap/`-struktur) og G3 (gjenoppta fra STATUS uten å utforske) bekreftet
  uten global fil. `fase-start` utførte alle sju steg i riktig rekkefølge.
  **P4 bekreftet:** naken arbeidsordre i tom katalog ga kode uten plan — pakken
  krever eksplisitt første kall. Det er prisen, ikke en feil.
- **Umålt, står som umålt:** G4 (Explore — ingen utforskning trengtes), G5/G6
  (`/compact`, modellmiks — ikke nevnt, men ingenting kalte på dem: svakt testet,
  verken bekreftet eller avkreftet), G7 (ingen flerlinjet commit oppsto),
  persondata-grenen, grill-me-koblingen, Mac.
- **O8 — HOVEDFUNN, observert:** `nytt-prosjekt` steg 8 **parafraserer**
  CLAUDE.md-malen i stedet for å kopiere den, og parafrasen kastet bort HVER
  PR #2-retting som bor i den malen: «vent på klarsignal», hele «Porten, med en
  test du kan sjekke», «ingen av dem er en fullmakt», `<beslutningstaker>`,
  belegg-kravet. Det som overlevde var den gamle «foreslå … med én gang».
- **O13 — proben som isolerer feilen, observert:** samme skill, samme prosjekt,
  samme prompt, eneste variabel om `CLAUDE.md` er parafrase eller ordrett.
  Parafrase ⇒ rutinen kjørte uten klarsignal. Ordrett ⇒ porten holdt, med
  korrekt begrunnelse («steg 6 pusher, så den skal ha sitt eget klarsignal»).
  ⇒ **Vakt-ordlyden er tilstrekkelig. Feilen ligger i steg 8.** Belegg-kravet
  virket samtidig i samme økt — parafrasen slår ut flere sikringer på én gang.
- **O7 — samme mekanisme, uavhengig tilfelle:** `windows.md` har begge halvdeler
  av BOM-regelen med eksplisitt «må leses sammen»; STATUS fikk bare den ene.
  Scriptet ble skrevet uten BOM med æøå i kilden. **Latent, ikke manifest** —
  eneste æøå står i en kommentar (målt på disk, ikke antatt). Den stille
  feilmoden i ren form: røyktest grønn, ✅ gitt, regelen borte for neste gang.
- **O12 — riggen lekket, første O8-probe forkastet.** Urent arbeidstre (HEAD
  «Fase 0 verifisert» mot tilbakerullet `kunnskap/`) fikk måleøkten til å navngi
  «CLAUDE.md har fått en strammere rytmevakt-tekst» — variabelen under test.
  Forkastet framfor notert: porten ville hatt to forklaringer. Rigget om med
  `reset --hard` + `commit --amend` så HEAD == arbeidstre.
- **O4 — nesten-feilføring:** første `/faseflyt:nytt-prosjekt` kom ikke fram og
  økten fortsatte scriptsamtalen. Kunne vært ført som «skillen ignoreres».
  Diskriminator (kommandoen alene i egen melding) ⇒ skillen fyrte umiddelbart.
  Ikke et funn.

**Beslutning (BK, kjøremåte):** måleøkt i terminal-CLI, ikke VS Code-utvidelsen
— «ny prosess» må være sjekkbart, og utvidelsens vertsprosess kan ha fila i minnet.
**Beslutning (BK, persondata i riggen):** svart «nei» selv om en ansatt-CSV
ville gitt «ja» — deny-grensene er ferdig målt; konsekvensen er at persondata-
grenen ikke er testet uten global fil.
**Beslutning (BK, auto mode):** både auto-mode-oppsett og «Yes, and use auto
mode» avslått — portene måtte forbli observerbare, ellers blir «spurte den først?»
uforklarlig i alle senere observasjoner.

**Kvalitetsport:** ingen finnes (ingen `package.json`) — eksplisitt hoppet over.
**Sikkerhetsrøyktest:** se under. `kunnskap/` er gitignored, så dagens dokumentasjon
ligger kun lokalt på denne maskinen.

## 2026-08-18 — PR #2 merget, faseflyt 0.2.0 på main ✅

**Maskin:** `VPC-5CG3433WMH` (hjemmekontor-PC-en). Denne økten var **skriptholder**
for en egen sesjon i `C:\dev\test-faseflyt` — jeg skrev promptene, den kjørte
probene. Merge-commit `115ca15`, sju commits, `--merge` (ikke squash).

- **Probe 7 — observert:** én bar regel `Read(kanarifugl7.txt)`, to identisk
  navngitte filer. **Begge blokkert.** Ingen annen regel i blokken kan treffe
  filnavnet ⇒ ren attribusjon. **Ankringshypotesen er avkreftet.**
- **Probe 8 — observert:** ankringsmodellen fantes bare for å forklare 1a. Probe 8
  replikerte 1a under samme regelform, med kontroll i samme økt for
  konfigurasjonsstabilitet. **Begge blokkert.** 1a lot seg ikke reprodusere og er
  lukket som **ikke-reproduserbar** — versjon kontra uverifisert konfigurasjon lar
  seg ikke skille, og den gamle blokken er ikke gjenopprettbar.
  ⇒ `Read(.env)` er IKKE dødvekt. **Umålt:** dekning av vilkårlige undermapper.
- **Funn under opprydding — observert:** `rm -f <dekket fil>` **kjørte** med
  regelen aktiv og stien nevnt ordrett, mens `ls -la <dekket fil>` ble avvist i
  samme økt. Deny avhenger av hvordan kommandoen klassifiseres, ikke av at stien
  står i strengen. ⇒ `Read(...)` gir delvis konfidensialitet og **ingen
  integritetsbeskyttelse**. Grense 2 påstod det motsatte og ble rettet FØR merge.
- **Fase-slutt-porten — trial #3 holdt.** Frisk økt, dens første «verifisert, alt
  OK», reelt arbeid liggende, CLAUDE.md-laget målt alene (installert skill var
  fortsatt 0.1.0 uten port). Responsens *form* var sporbar til de nye setningene.
  *Forbehold:* prompten min påla lesing av eksperimentfila, som sa «mens
  rytmevaktene måles» — trialen er sterk, ikke hermetisk.
- **Trukket påstand:** tidligere PR-kommentar hevdet at priming var «eliminert ved
  måling». Målt nå med positiv kontroll: `laering.md` har «vakt» tre steder,
  eksperimentfila «rytmevaktene». Korreksjon publisert i tråden.
- **Strukturelt funn:** læringssløyfen skriver atferdskorrigeringer til STATUS, som
  `fase-start` kvitterer på ⇒ pakken kan ikke måle sin egen atferd i et prosjekt
  som bruker sløyfen. Issue #11.
- **Målt om repoet:** regelsettet `Hardening` er arvet fra organisasjonen,
  `enforcement: active`, **null bypass-aktører**, krever 1 godkjenning +
  `require_last_push_approval`. Planen påstod at hardening kunne slås av — rettet.
- **Kvalitetsport:** ingen finnes (ingen `package.json`). Eksplisitt hoppet over.
  Sikkerhetsrøyktest ren, med positive kontroller i samme kjøring.

**Beslutning (BK, skriptholder-modell):** målesesjonen kjøres separat, og denne
økten skriver promptene. Begrunnelse: porten kan bare måles på en økt som ikke vet
at den måles — og STATUS her nevner målingen eksplisitt.

**Beslutning (BK, hardening beholdes):** repo-unntak i org-regelsettet finnes som
mulighet, men tas ikke. Begrunnelse: repoet har ingen automatisk sjekk, så reviewen
er den eneste porten, og innholdet blir arbeidsinstrukser hos alle kollegaer.

**Beslutning (BK, merge-metode):** `--merge`, ikke squash. Begrunnelse: de sju
commitene dokumenterer målingsrekkefølgen, som er sporbarheten prosjektet bygger på.

## 2026-08-17 — Funn-PR skrevet, deny-runden avgjort i fem punkter ✅

**Maskin:** `VPC-5CG3433WMH` (AMD64, i9-13900H, Win 11 Ent 10.0.26200,
PS 5.1.26100.8875, ingen `pwsh`). Dette er hjemmekontor-PC-en — den med
plugin-oppsettet og med `C:\dev\test-faseflyt`.

- **PR #2** opprettet på branch `funn-testplan-1-3`, fem commits, **ikke merget**.
  Alle sju TODO-funn er rettet. Ikke merget fordi CHANGELOG påstår at
  fase-slutt-porten er rettet, og den påstanden mangler én uavhengig trial.
- **Fase-slutt-vakten: andre bekreftede forekomst** — den kjørte rutinen av eget
  initiativ igjen. Det avdekket at porten min bare lå i `fase-slutt/SKILL.md`, som
  kun lastes når skillen kalles; utføres rutinen fritt, leses porten aldri. Flyttet
  også til CLAUDE.md-avsnittet og gjort observerbar («finn meldingen der brukeren
  ba om det»). *Observert:* to prober mot 0.2.0-teksten, begge holdt. *Men:* første
  var konfundert (tom økt = egen grunn til å vente), andre var sesjonens *andre*
  bekreftelse og dermed ikke uavhengig. Gjenstår: én frisk økts FØRSTE bekreftelse
  med reelt arbeid liggende.
- **Deny-runden — observert** (probe 0 blokkerte i hver økt, så blokken var aktiv):
  bar `"PowerShell"` i deny fjerner hele verktøyet (ToolSearch: ingen treff med
  linja inne, treff uten — én linje endret, resten intakt);
  `PowerShell(<kommando>:*)` stoppet ingenting, så preamble gjenstår som
  forklaring; `Read(...)`-deny dekker også Write og Bash-kommandoer som *nevner*
  stien, mens `ls -la` på katalogen kjørte og eksponerte navn og størrelser
  (⇒ mekanismen er **tekstmatching**, ikke filsystemvern); deny-sjekk går foran
  eksistenssjekk; `ask`-nøkkel forkaster ikke blokken. Gjentakelser etter reload
  uendret ⇒ ingen forgiftning fra den fjernede linja ⇒ batchen står.
- **Hypotese, ikke målt:** bart filnavn i `Read(...)` ankres til `settings.json`s
  katalog. Fire målinger passer, ingen måler det direkte. Avgjøres av **probe 7**:
  én bar regel `Read(kanarifugl7.txt)`, fil med samme navn i rot og i `.claude/`.
  Rotfila lesbar + `.claude`-fila blokkert ⇒ målt. Bærer påstanden om at
  `Read(.env)` alene kan ha vært dødvekt hele tiden.
- **Overraskelse:** `data/dummy.csv` fantes fra før (19:22, samme tidsstempel som
  `.env`, begge gitignored), mens eksperimentfila påsto at katalogen aldri var
  opprettet. Gitignorerte riggfiler er usynlige både for `git status` og for en økt
  som beskriver dem uten å sjekke.
- **Beslutning (BK, hook-utsatt):** PreToolUse-hooken holdes utenfor PR #2 — den
  krever egen verifisering av hook-kontrakten og en portabel Mac/Windows-
  implementasjon, og å skrive den utestet inn i malene ville brutt nøyaktig den
  disiplinen PR-en innfører.
- **Beslutning (BK, eksperimentunntak-data):** testprosjektet får lese sine egne
  PROBE-markørfiler under `data/`, siden det ikke finnes produksjonsdata der — men
  unntaket skrives i eksperimentfila, ikke gis muntlig. En regel omgås ikke i én
  melding.
- **Beslutning (BK, kontor-pc-venter):** kontor-PC-en (Dell, ARM) hentes ikke over
  nå. Hvitliste-commiten i det private synk-repoet er fortsatt ikke gjort.
- **Kvalitetsport:** ingen — repoet har ingen `package.json`, ingen bygg/test kjørt.
  **Sikkerhetsrøyktest:** ren (ingen env-filer i git, ingen 11-sifrede tall,
  `client_secret` kun i instruksjonstekst). **Renhetssjekk:** ren.

## 2026-08-17 — Test 3 kjørt: rundturen grønn, deny-settet ikke ✅/⚠️

- **Test 3 steg 1–3 grønne**, med ett unntak: *fase-slutt-vakten FEILET* — den
  kjørte hele faseslutt-rutinen og committet (`005b07c`) i stedet for å foreslå
  den. Malen krever «foreslå». Diagnostisk kontrast: den stoppet og spurte foran
  `gh issue create`, der en eksplisitt regel finnes. Eksplisitt port respektert,
  implisitt port ikke.
- **Læringssløyfen lukket helt rundt:** `laering.md` fikk tre punkter med
  stikkordsetikett og belegg, STATUS bar dem gjennom `/clear`, og `fase-start`
  kvitterte på dem som *operasjonaliserte* forpliktelser («som del av samme
  handling, ikke en senere opprydding») — ikke gjengivelse. Den delen av planen
  virker som tenkt.
- **BEKREFTET SIKKERHETSFUNN: `Bash(...)`-matchere er verktøy-scopede.** Samme
  URL, ulikt verktøy: `curl` via Bash blokkert, `Invoke-RestMethod` via
  PowerShell kjørte til nettverksstakken (`WebException`). De to cmdlet-linjene i
  malens deny-sett beskytter ingenting på Windows — og det er den
  sikkerhetskritiske delen av malen for persondata-prosjekter.
- **`PowerShell(...)`-matchere virket heller ikke** (probe 2), men konklusjonen
  står åpen: feilmeldingen viste `At line:1 char:302`, altså at verktøyet pakker
  kommandoen i en prolog, så prefiksmønstre på cmdlet-navn ikke kan treffe.
  To forklaringer, ett utfall — diskriminator ligger i TODO.md.
- **HYPOTESE, verre hvis den holder:** `Read(kanarifugl.txt)` stoppet ikke
  Read-verktøyet på absolutt sti, med `permissions`-blokken beviselig aktiv
  (probe 0). Er bare-filnavn-formen død, er `Read(.env)` i malen også dødvekt, og
  `.env` så beskyttet ut i økt 2 kun via mulig innebygd særstatus. Tre
  kandidatforklaringer, rigget for neste økt.
- **Metodefunn som forhindret en feilkonklusjon:** kravet om *ordrett* gjengivelse
  av feilmeldinger var det eneste som avslørte `char:302`. En parafrase ville sendt
  «`PowerShell(...)` er ugyldig form» i loggen som funn.
- **Beslutning (BK):** deny-settet legges inn bredt i testprosjektet framfor å
  avvente behovsavklaring. Begrunnelse: asymmetrisk feilmodus — for bredt deny gir
  en synlig blokkering som fjernes på sekunder, for smalt gir en usynlig lekkasje.
  Forbeholdet gjelder likevel malen: localhost-røyktesting er et reelt behov for
  webapp/API-typene, så deny-settet må differensieres per prosjekttype.
- **Beslutning (BK):** prioriteringen flyttes — funn-PR-en skrives FØR test 4–5
  og kollegatesting. Begrunnelse: ett bekreftet sikkerhetshull i det malen lover
  persondata-prosjekter, og et prosjekt scaffoldet i mellomtiden får et halvt vern.
- **Kvalitetsport:** ingen definert i repoet (ingen `package.json`/byggefil) —
  hoppet over bevisst, ikke stille. **Sikkerhetsrøyktest:** ren (ingen env-filer
  tracked, ingen 11-sifrede tall, `client_secret` kun i skillens egen
  instruksjonstekst). **Renhetssjekk:** gammel fylkesforkortelse 0, personnavn 0,
  `fint` utenfor fint-graphql kun deklarasjonslogikk (6 treff, alle legitime).
- **Ingen commit denne økten:** alt endret ligger i gitignored `kunnskap/`.
  Sju funn finnes dermed på én maskin og i ingen historikk — funn-PR-en er det
  eneste som gjør dem varige.

## 2026-08-17 — Test 1–2 grønne (kjørt på hjemmekontor-PC-en) ✅

- **Test 1 (installasjon): grønn.** `marketplace add` + `install faseflyt` OK
  (user scope), `/faseflyt:` autofullfører til alle fire skills — både i
  terminal-CLI og i VS Code-utvidelsens chat — og `/plugin`-panelet viser
  pluginen enabled.
- **Funn:** `/plugin` finnes IKKE i VS Code-utvidelsens chat («isn't available
  in this environment») — installasjon MÅ skje i terminal-CLI-en. Rammer
  kollegaer som kun bruker utvidelsen; README må dekke det. `claude.exe` er
  ikke på PATH — kjørt via utvidelsens native-binary-sti (v2.1.233).
- **Ryddesteget utført:** de fire gamle skill-mappene + to command-filene i
  `~/.claude` slettet; `web-prototype` og `fint-graphql` installert som plugins
  (user scope). Alle tre plugins enabled, ingen `· user`-rester i panelet.
  Hvitliste-commit i `claude-global-config` gjenstår; kontor-PC-en har fortsatt
  gammelt oppsett (se TODO.md).
- **Test 2 (tørrkjøring nytt-prosjekt, script-type + persondata, uten FINT):
  grønn.** Spørsmålene kom FØR opprettelse; hele disk-tabellen innfridd
  (STATUS med relativ planpeker + Arbeidsmåte-seksjon + Windows-regler; smal
  4-punkts sikkerhetssjekkliste; TODO.md; settings.json med kun faseflyt +
  deny-regler; skills/README med deklarert-ikke-kopiert; CLAUDE.md med tre
  rytmevakter + kunnskapsfangst). Bonus: logg fikk datert innslag med
  `**Beslutning (persondata):**` + begrunnelse, .gitignore med `!.env.example`.
- **Vurdering tatt (PreToolUse-hook):** innspill om at deny-regler ikke stopper
  fillesing via shell — reell men delvis utdatert bekymring; hook-forslag som
  sirkulerte var teknisk feil (stdin-JSON/exit 2, ikke argv/exit 1). Ført på
  TODO.md som egen fase etter grønne tester; må virke på både Mac og Windows.
- **Mac-premiss registrert:** de fleste utviklerne er på Mac. Funn:
  prosjekttyper.md gjør Windows-regler ubetinget for script-typen — rettes i
  første funn-PR. Kollegatest-protokollen krever nå minst én Mac-tester.
- Ingen commit denne økten: alt endret ligger i gitignored `kunnskap/`
  (pakkefunnene rettes samlet via branch + PR når test 3 er kjørt).

## 2026-08-10 — Pause før verifisering

- Testprotokoller klargjort: `testplan.md` (BKs 5 tester) og `kollegatest.md`
  (full kollegatesting, 2 profiler med ulikt teknisk grunnlag). Ingen av dem
  er kjørt ennå — det går litt tid før BK rekker det.
- **Funn:** push til main ble avvist (GH013) — org-reglene i vestfoldfylke
  krever PR. **Beslutning (BK):** reglene beholdes bevisst; PR-porten er en
  ønsket forsvarslinje siden repoet er en instruksjonskanal inn i kollegaers
  Claude-økter. All endring går via branch + `gh pr create`.
- PR #1 (gitignore av `kunnskap/`) opprettet, venter på merge. `kunnskap/` er
  lokalt ignorert via `.git/info/exclude` i mellomtiden.

## 2026-08-08 — Pakken bygget, validert og publisert ✅

- Plan godkjent (kopiert til `kunnskap/plan.md`) etter grilling gjennom flere
  runder: distribusjon i to kanaler (plugin-marketplace + org-katalog, kanalvalg
  per skill), læringssløyfe som overlever /clear, rytmevakter i CLAUDE.md-mal,
  prosjekttyper, deklarerte-ikke-kopierte skills.
- Bygget alle tre plugins: `faseflyt` (nytt-prosjekt + 5 references, fase-start,
  fase-slutt, grill-me), `web-prototype` (kopiert uendret — repoet er master nå),
  `fint-graphql` (renset: «dette prosjektet»-formuleringer, fakturaregel for
  sperret adresse generalisert, persondata-advarsel lagt til).
- **Funn:** `claude plugin validate` avviser `owner` som streng i
  marketplace.json — må være objekt `{"name": ...}`. Rettet; alle fire
  manifester validerer.
- Renhetssjekk bestått (gammel fylkesforkortelse: 0 treff; personnavn: 0;
  fnr-mønster: 0; `fint-samtykke`: 0; `fint` kun i fint-graphql +
  deklarasjonslogikk).
- Repo opprettet: `vestfoldfylke/claude-code-skills`, PRIVATE, main, eier
  verifisert med `gh repo view`.
