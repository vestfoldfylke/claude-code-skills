# TODO — utenfor gjeldende fase

## MVP-frys 2026-08-19 (kveld) — les dette først

**Beslutning (BK):** pakken fryses og testes på et par kollegaer. Ikke bygg mer
før testen er gjort. Nesten alt under denne linjen er vedlikeholderklasse og
blokkerer ikke testen — `TODO.md` (535 linjer) + `plan.md` (605) er utredning,
mens pakken alt er testbar. «Helhetsvurdering»-spørsmålet lenger ned besvares
av to reelle brukere, ikke av mer analyse.

## Velg case til samlingen (BK, lagt inn 2026-08-19)

**Underlaget ligger lokalt, ikke i git:** `kunnskap/KI-Samling for DT september
2026 vibe-coding-oppgavelapper.docx` på BKs maskin. Bevisst untracket — repoet er
et plugin-marketplace, og `/plugin marketplace add` er en `git clone`, så alt
tracket havner hos hver kollega som installerer pakken. Dekket av `.gitignore`
(`kunnskap/*.docx`). *(Fila ligger i historikken fram til `cd50841`; ikke fjernet
derfra, se loggen.)*

**Jobben:** BK tester én av casene i dokumentet, og vurderer hvilke av dem som
egner seg for en samling der `faseflyt` prøves i **gruppearbeid**. Dette henger
sammen med «Forcing function: samling med 30 deltakere» lenger ned — særlig at
formen er gruppearbeid med én som skriver, og at `/grill-me` antakelig er den mest
gruppevennlige delen av pakken.

Kriterier verdt å vurdere casene mot, fra det som alt er kjent: kan en gruppe
**verifisere** resultatet selv (verifiseringsporten er hele flyten), får den plass
i én økt uten `/compact`, og holder den seg til syntetiske data.

**Lest og strammet 2026-08-19 (kveld).** Arbeidsversjon i
`kunnskap/lokalt/oppgavelapper.md` — også untracket, og `kunnskap/lokalt/` er nå
lagt til `.gitignore` fordi mønstrene bare dekket Office-formater; en `.md` ville
blitt tracket. Alle seks casene er webapp/prototype, persondata = nei, mock i
filer, ingen backend. Suksesskriteriet på arket er **minst to faseslutt**, ikke
ferdig app.

- **Struktur:** 13 av ~22 linjer per lapp var ordrett like på alle seks. Flyttet
  til ett felles ark; lappen er nå bestilling + to uavklarte spørsmål + notatfelt.
- **Case til tørrkjøringen: 6, Utstyrsskapet.** Den er unionen av 1 (liste, detalj,
  utlån til navngitte), 3 (datoberegnet status) og 4 (markering) — går den gjennom
  på 3–4 faser, går resten. Reserve hvis tiden er kort: **1, Donald Pocket**
  (enklest verifisering, men den ene uten datologikk).
- **Ikke start med 5, Vaffelvakta.** Rotasjon + bytte + ferier er der en gruppe
  lettest bruker opp økta på domenelogikk framfor på arbeidsflyten. Vurder å kutte
  «ferier og fridager» fra bestillingen.
- **Tre påstander arket hviler på, som pakken ikke har målt** — står som egen
  seksjon på fasilitatorarket: at «nytt prosjekt» trigger av seg selv (høyest
  risiko: slår den ikke inn, står gruppa fast på minutt null), at `web-prototype`
  trigger av seg selv for webapp-typen (den typen er umålt i STATUS), og at
  designsporets mekanikk (`list_projects`, `projectId`, token-overstyring i
  `app.css`) finnes i `claude-design-oppskrift.md` og ikke bare i fasilitatorens
  hode.
- **Før tørrkjøringen:** verifiser at installert pakke er identisk med repoet.
  Cachen kan være foreldet, og da måles en annen pakke enn du tror.
- **Tørrkjøringen skal skje i en blank økt i en tom mappe utenfor dette repoet.**
  En økt som har lest `plan.md`/`TODO.md` kjenner pakkens svake punkter og måler
  derfor seg selv med fasit i hånda.

**Arket synker IKKE mellom maskiner.** Både `.docx`-en og
`kunnskap/lokalt/oppgavelapper.md` er untracket med vilje, så ingen av dem følger
med en `git pull` på kontor-PC-en. Derfor står bestillingen til tørrkjøringscasen
ordrett her, i en fil som ER tracket — det er det eneste som må være tilgjengelig
for å kjøre testen:

> **Oppgave 6 — Utstyrsskapet.** Lag en web-løsning for utstyret på huset:
> projektorer, kameraer, ladere og høyttalere. Oversikt over hva som finnes, hva
> som er ute og hva som er ledig. Det skal være mulig å registrere utlån til
> Mikkel Rev, Sattosk Rev eller Lita Tavle, med forventet retur. Utstyr som er
> over tiden skal vises tydelig. Vi mocker alt som ligner på database i enkle
> filer.
>
> *Uavklart, som gruppa svarer på selv:* Hva betyr «over tiden», og hvem er det
> som skal se det? Kan samme gjenstand lånes ut to ganger samtidig — og hva
> hindrer i så fall det?
>
> *Rammer:* mock i enkle filer, ingen backend, ingen ekte bilder (fargede kort,
> SVG eller emoji), norsk tekst, prototype. Ingen fase er ferdig før noen har sett
> den virke i nettleseren. Svar i oppsettet: type = webapp/prototype,
> persondata = nei, FINT = nei. Sikt på 3–4 faser.

## Actions — venter på utviklerne (BK tar samtalen)

Målt 2026-08-19: `actions/permissions` → `enabled: false`, `gh run list` tom
etter to pusher. Workflow-fila er inert. Repo-rollen er `admin: true`, så
bryteren er innen teknisk rekkevidde — den venter på avklaring, ikke tilgang.
Org-nivået er **uavklart**: begge org-endepunktene ga 403, og feilmeldingen
navngir to forklaringer (ikke org-admin / token mangler `admin:org`), så det
måler ingenting.

Spørsmålene å ta med:

1. Kan Actions slås på for dette private repoet — eller styrer en org-policy det?
2. Begrenser org-en hvilke actions som er tillatt? Vi bruker `actions/checkout`
   (GitHub-eid). Er lista snevret til verifiserte utgivere, vil vi vite det først.
3. Har vi Actions-minutter for private repo på planen? Vår kjøring tar sekunder.
4. Er standard `GITHUB_TOKEN` read-only på org-nivå? Vi deklarerer
   `permissions: contents: read` og trenger ikke mer.
5. Sier policy nei: foretrekker de en lokal `pre-push`-hook i stedet?
6. **Viktigst, til 1.0:** kan sjekken settes som *required status check* på `main`?
   Slik den er nå, kjører den etter at commiten ligger der — den rapporterer, den
   stopper ingenting.

Verdt å si til dem: workflowen er 25 linjer, kjører ett bash-script, ingen
nettverkstilgang, ingen secrets, read-only token.

## Avgjort 2026-08-19 (kveld) — ikke gjenåpne

- **~~`fase-slutt` steg 4 peker mot å hoppe over en port som finnes~~ — RETTET**
  i `a33a11e`. Steget heter nå «Virker prosjektet fortsatt?» og krever at man
  leter bredt (manifest-/skjemavalidering, at et script kjører, død lenke) før
  man melder at ingen sjekk finnes. Ikke gjenta.
- **~~CI-sjekk for renhetskravene~~ — BYGGET** i `ed04300`
  (`.github/renhet/sjekk.sh` + workflow + unntaksliste). Scriptet er bevist:
  kanarifugl på alle sju harde krav ga exit 1. **Men porten er ikke i drift** —
  se Actions-seksjonen over.
- **Beslutning (BK, actions-omfang):** Actions holdes til dette repoet. Følger
  ikke ut i kollegaprosjekter — innholdet er pakkeregler, og hensikten er å verne
  distribusjonskanalen.
- **Beslutning (BK, kollegavernet):** `fase-slutt` steg 5 styrkes som **instruks**,
  ikke mekanisme. Gjort i denne commiten. Lagt bort: Action per prosjekt (krever
  GitHub + Actions + org-avklaring per repo — friksjonen dreper bruk) og lokal
  `pre-push`-hook (best passform, men hooks følger ikke med i git, så
  overtakelseshistorien svekkes). Kan tas opp igjen etter kollegatesten.

## Liten skjevhet i læringssløyfen (oppdaget under bruk 2026-08-19)

Ratchet-en sier at et punkt som står i tre påfølgende faseslutt skal promoteres
til «prosjektets `CLAUDE.md`» — men skillen sier ikke hva som skjer når prosjektet
ikke *har* en `CLAUDE.md`. Dette repoet har ingen, så promoteringen ble et forslag
i chatten framfor en handling. Ikke ført som issue: dette *er* pakkerepoet, og
issue-mekanismen finnes for kollegaer som ikke kan redigere pakken selv.
- **Slett `master` i `claude-global-config`**, lokalt og på remote. Den ble beholdt
  eksplisitt «for usynket maskin» = kontor-PC-en, som nå er over på `main`.
- **Issue #9:** `web-prototype` er bekreftet identisk mellom `~/.claude` og repoet.
  Det gjenstående er repo mot konsollversjonen.

## Maskinstatus (test 1–2 kjørt 2026-08-17)

- Test 1 + rydding + test 2 er gjennomført på **hjemmekontor-PC-en** — det er
  DEN som nå har plugin-oppsettet (3 plugins user scope) og renset `~/.claude`.
- **Hvitliste-commit + slettinger: GJORT 2026-08-18 kveld** (`6cda506`, pushet til
  `bkaarstein/claude-global-config`, branch `master`). Ni filer slettet,
  whitelist-linjene for `commands/` og `skills/` fjernet med begrunnelse som
  kommentar, README peker nå på pakkens README som kanonisk framfor å duplisere
  installasjonsoppskriften. Verifisert før commit at alle ni har en ekvivalent i
  pakken; retrospektivet er destillert til `fallgruver.md` og originalen ligger i
  git-historikken.
- **Kontor-PC-en (Snapdragon/ARM) har fortsatt gammelt oppsett.** Rekkefølgen der:
  `git -C ~/.claude pull` FØRST (fjerner de gamle kopiene som ellers skygger for
  plugin-versjonen), deretter `/plugin marketplace add` + installer de tre user
  scope. **Noter underveis — dette ER ARM-pre-flighten** for samlingen.

## Deny-runden — LUKKET 2026-08-19 (kveld). Ikke gjenåpne.

Alle funnene fra testplan 1–3 (17.–18.08) er målt ferdig og **innarbeidet i
malene**. Kanonisk sted er grense-listen 1–9 i
[maler.md](../plugins/faseflyt/skills/nytt-prosjekt/references/maler.md) — den har
både målingene og ærlighetsklausulen. Belegget ligger i `logg.md` (17.08 og 18.08)
og i git-historikken.

*Denne seksjonen var 290 linjer funn som alt var rettet. Fjernet med vilje: en
åpen TODO-post leses som en åpen defekt, og en ny økt brukte tid på å lete etter
maltekst som ikke finnes lenger (`maler.md:235-236`).*

| Funn | Hvor det bor nå |
|---|---|
| Matchere er verktøy-scopet — cmdlet-navn i `Bash(...)` er dødvekt | grense 6 + eksplisitt regel over deny-eksempelet |
| `PowerShell(<kommando>:*)`-formen stopper ingenting; bare bart tool-navn virker | grense 7 |
| Navnebaserte mønstre kan ikke bli komplette (aliaser, `[Net.WebClient]`, `& $c`) | grense 9 |
| Bash-dekning er ikke filsystemvern (`ls -la` på udekket katalog eksponerte navn) | grense 8 |
| Bar filnavn-form VIRKER — `Read(.env)` er ikke dødvekt | grense 5 |
| `ask`-nøkkel forkaster ikke `permissions`-blokken | grense 4 |
| Deny-settet var ikke verifiserbart for brukeren | kontrollkall mot `http://127.0.0.1:9/` i `nytt-prosjekt/SKILL.md` + `maler.md` |
| Deny må differensieres per prosjekttype | tabell i `maler.md`: script/dokumentasjon vs. webapp/API |
| `<navn>` ble lest som tema, ikke person | `<beslutningstaker>, <tema>` i alle seks kildene |
| Logg-malen krevde ikke belegg for funn | «observert» vs. «antatt» i `fase-slutt/SKILL.md` + `maler.md` |
| BOM-nyansen for `.ps1`-kildekode manglet | `windows.md`, som to halvdeler som må leses sammen |
| Fase-slutt-vakten utførte i stedet for å foreslå | `maler.md`: «Deretter **vent på klarsignal.**» + regel i `fase-slutt/SKILL.md` |
| Testdisiplin `[hypotese-vs-funn]` | `fallgruver.md` |
| `/plugin` og `/permissions` finnes ikke i VS Code-utvidelsen | README + `docs/installasjon.md` |
| Mac-skjevhet i `prosjekttyper.md` | rettet — se egen seksjon under |

**Avkreftet, og verdt å huske:** hypotesen om at bar filnavn-form resolveres
relativt til katalogen `settings.json` ligger i. Den hvilte på én observasjon gjort
under en konfigurasjon som aldri ble verifisert ordrett før kjøring. Lærdommen står
i grense 5 og er verdt mer enn funnet var.

**Fortsatt umålt, og skal stå som umålt:** om bar filnavn-form dekker vilkårlige
undermapper — bare prosjektrot og `.claude/` er testet. Derfor står glob-formen
`Read(**/fil.txt)` ved siden av den bare formen.

## PreToolUse-hook som tredje forsvarslinje — ÅPEN, ikke bygget

Det eneste laget som lukker verktøy-hullet i grense 6: en PreToolUse-hook får
`tool_name` og hele kommandostrengen, og er derfor verktøy-agnostisk der
`Bash(...)` og `PowerShell(...)` ikke er. Tilbys i `nytt-prosjekt` steg 6 når
brukeren svarer ja på persondata-spørsmålet.

**Ikke på kritisk vei for samlingen:** persondata = nei på alle seks oppgavene, og
ingen backend. Dette treffer den dagen en kollega scaffolder et ekte
persondata-prosjekt på Windows.

Krav til implementasjonen — det sirkulerende scriptforslaget var feil på alle tre:

- hooks får JSON på **stdin** (`tool_name`, `tool_input`)
- blokkering krever **exit-kode 2** eller `permissionDecision: "deny"`; exit 1
  blokkerer IKKE
- registrering er en liste med `matcher` + `hooks`-objekter

Må virke på **både Mac og Windows** — verken bash-only eller PowerShell-only.
Verifiser formatet mot dokumentasjonen før det skrives inn i malene.

**Ærligheten beholdes:** hooken ser `[Net.WebClient]` som tekst, men ikke `& $c`,
der navnet først finnes ved kjøring. Sterkere lag, ikke tett lag — absolutt
isolasjon krever sandkasse eller container. Samme klausul som deny-settet alt har.

**Sidegevinst som styrker saken:** en hook er testbar — den logger og returnerer
exit 2 — og løser dermed verifiserbarheten som var det andre halve problemet.

## ~~Mac-skjevhet i prosjekttyper.md~~ — RETTET i PR #2, verifisert 2026-08-18

**Lukket.** Rettingen ligger på `main` (CHANGELOG 0.2.0, «Plattformskjevhet rettet
i prosjekttyper.md»). Verifisert 2026-08-18 ved å gå gjennom samtlige treff på
`windows`/`powershell` i `plugins/faseflyt/`: alle er betinget — «ved Windows» i
oversiktstabellen (linje 15), plattform-aksen som eget avsnitt (linje 20–22), og
script-seksjonen sier eksplisitt at reglene ikke gjelder på Mac eller Linux.
Ingen ubetingede antakelser står igjen. **Ikke gjenta dette arbeidet.**

**Det som faktisk gjenstår for Mac/ARM er ikke innhold, men måling:** README og
`docs/installasjon.md` er plattformnøytrale, og installasjonen er aldri prøvd på
Mac eller Snapdragon. Hører til pre-flight for samlingen, ikke til en funn-PR.
Kjent Windows-særegenhet å ta med i oppskriften: CLI-binæren ligger på
`~\.local\bin\claude.exe` og er ikke alltid på PATH.

Historikken under står som belegg for hvorfor teksten er som den er:

Oppdaget 2026-08-17: `plugins/faseflyt/skills/nytt-prosjekt/references/prosjekttyper.md`
gjør Windows-regler **ubetinget** for script-typen (linje 15: «✅ (nesten alltid
PowerShell)»; linje 29: «Windows-reglene er kritiske her»). Feil premiss — de
fleste utviklerne er på Mac; en Mac-kollega ville fått PowerShell-regler i
STATUS. Endres til «ved Windows» som de andre kolonnene, og linje 28–29
omformuleres plattformnøytralt. Pakkeendring → branch + PR; tas med i første
funn-PR fra testplanen.

## Helhetsvurdering: hvem er pakken for? (parkert 2026-08-18)

Reist av BK under måleøkten for ordrett-fiksen: hensikten med hele pakken må
vurderes mot fire mål — lett å lage prototyper, effektiv token- og modellbruk, god
git-hygiene — for **ulike brukergrupper**, særlig de som ikke er utviklere selv.
Parkert her, ikke besluttet. Vurderingen under er analyse, ikke måling, der annet
ikke er sagt.

**Premisset:** pakken er i dag optimalisert for én bruker — den som vedlikeholder
den. Innholdet er vedlikeholderklasse (målte deny-grenser, probedisiplin,
læringssløyfe med etiketter og trestegs-promotering). Sterk for maintaineren,
tynn for de fire målene.

- **Prototyping** er best dekket: `web-prototype` er ferdig teknologivalg, og fase
  0 er alltid oppsett + røyktest. Flaskehalsen er distribusjon, ikke innhold.
  **Målt:** `/plugin` finnes ikke i VS Code-utvidelsen. **Ved design:** faseflyt er
  CLI-only fordi den trenger filsystem og git, så org-katalogen — kanalen en
  ikke-utvikler faktisk møter — er den ene kanalen faseflyt ikke går i.
  **Umålt og skal stå som umålt:** Desktop-appen har filsystem og kunne vært veien
  for denne gruppen; den er aldri testet.
- **Tokeneffektivitet og modellmiks:** modellmiksen står i `nytt-prosjekt`s
  innledning — en skill som lastes én gang, ved oppsett. Explore-delegeringen står
  i CLAUDE.md-avsnittet, som er aktivt hele tiden. Samme strukturfeil vi alt har
  betalt for to ganger (deny-regler, rytmevakter): en regel som skal virke alltid,
  må ligge der den alltid lastes. Gjelder dobbelt for noen som ikke velger modell
  selv. **Merk motsetningen:** ordrett-kravet fra 0.2.1 koster tokens (observert:
  måleøkten lå på ~21k under oppsettet, uten `/compact`). For en ikke-utvikler
  vinner pålitelighet over tokenpris; for en maintainer er avveiningen åpen. Malen
  bør si hvilken vei den har valgt, og hvorfor.
- **Git-hygiene** er antakelig pakkens største reelle verdi for en ikke-utvikler:
  arbeidet er aldri tapt, og hver fase er ett steg å gå tilbake fra. I dag er git
  et *tilbud* i steg 7, og hva som skjer hvis de svarer nei — eller hvis push
  feiler — er udekket. For denne gruppen bør git være standard med begrunnelse,
  ikke et valg de må ha en mening om.
- **Verifiseringsporten er den skarpeste gapen.** Hele flyten hviler på at brukeren
  KAN verifisere. Det holder for en prototype man ser på, og blir tynt for et
  script eller en backend hvis man ikke leser kode — da er porten formelt på plass
  mens den reelt er borte. Mekanismen finnes alt i plan-malen
  («**Verifisering:** hva brukeren gjør for å si ✅»); kravet som mangler er at den
  formuleres som noe brukeren faktisk kan **utføre og se**, ikke «kjør testene».
- **Aksen pakken mangler er rolle, ikke prosjekttype.** Typen finnes; rollen ikke.
  En ikke-utvikler og en backend-utvikler kan velge samme type og trenge ulik flyt.

**To konkrete endringer denne vurderingen alt har modnet fram** (kan gjøres uten å
avgjøre resten, egen branch + PR):

1. Modellmiksen flyttes/dupliseres inn i CLAUDE.md-avsnittet i `maler.md`, slik at
   den er aktiv i hver økt og ikke bare ved oppsett.
2. Plan-malens `**Verifisering:**` får krav om at steget er utførbart og
   observerbart for brukeren — med ett eksempel på begge sider (brukbart:
   «åpne siden, se at listen viser tre elever»; ubrukelig: «kjør npm test»).

### Time to market: pakken er en overleveringsmekanisme

Reist av BK samme dag. Hensikten er ikke utviklerproduktivitet, men at en prototype
kan **tas videre til produksjon** uten at utviklerne må gjøre alt fra start.
Mottakeren av leveransen er altså utvikleren som overtar, og «ferdig» betyr
*akseptabel uten arkeologi*, ikke *virker*.

Tjener målet alt (de tunge): samme teknologiplattform via `web-prototype` (så
prototypen ikke kastes), beslutninger med navngitt beslutningstaker og begrunnelse
i `plan.md` (utviklerens spørsmål i uke to), og én verifisert fase = én commit —
der fase 0 gir en tynn men fungerende vertikal, som er langt lettere å løfte enn en
bred halvferdig.

Svakest: **«sikkerhetstesta konsekvent» bæres ikke i dag.** `sikkerhet.md` er en
sjekkliste, og `fase-slutt` kjører en røyktest eksplisitt merket som ikke-review.
For en bruker som ikke kan evaluere punktene selv er det samme feilmodus som
verifiseringsporten: formelt på plass, reelt borte. Skal ordet «konsekvent» brukes,
må hvert punkt ha tilstand med belegg — gjort / ikke gjort / ikke relevant.

**Ny leveransekandidat — produksjonsgap.** En prototype som *ser* produksjonsklar
ut er farligere enn en som åpenbart ikke er det; Designsystemet-komponenter, ryddig
historikk og dokumentasjon øker presset om å sette den i drift som den står. Pakken
bør derfor produsere én fil som sier hva som IKKE er gjort: autentisering, secrets,
datamodell-gjennomgang, avhengighetsrevisjon, feilhåndtering, logging. Det er den
fila som gjør overleveringen rask, fordi utvikleren slipper å finne ut hva som kan
stoles på.

### Dataregime som akse — erstatter rolleaksen

BK presiserte målgruppen: mellomgruppen (mellom utvikler og ikke-utvikler) har nok
domenekunnskap til å bygge prototyper som skal testes med **reelle data**, f.eks.
fra FINT. Det er ikke for alle, men det er for noen — og det er antakelig
primærmålgruppen: domenekunnskap er den knappe innsatsfaktoren, ikke SvelteKit. En
reell-data-prototype er også raskere å løfte, fordi datakvalitet og kantene i
modellen oppdages i prototypen framfor i drift.

**Trukket:** en tidligere formulering her var «syntetiske data, punktum». For sterk
— den ville blokkert legitimt arbeid for gruppen pakken er mest til for.

Aksen blir derfor dataregime, ETT spørsmål ved oppsett med tre svar:

1. **Syntetiske data** — standard. Kan overleveres uten opprydding.
2. **Reelle data, lesing, brukeren som operatør** — det målte mønsteret som alt
   finnes: Claude forbereder spørringen, brukeren kjører den og limer inn det som
   skal inn. Ingen ny mekanisme trengs.
3. **Reelle data i selve løsningen** — da er det ikke en prototype lenger;
   behandlingsgrunnlag hører med før koden.

**Det som mangler er reglene for utsiden.** For en kompetent bruker er risikoen
ikke tilgang — de har jobbtilgang uansett — men **lekkasje gjennom artefaktene
arbeidsflyten selv produserer**: `logg.md`, STATUS, commits, issues i org-repoet og
skjermbilder. Verste enkelttilfelle: én ekte rad ført i loggen som «eksempel på
responsformen», og så commitet. Kanalen er vår, så tettingen er vår:

- `.gitignore` dekker datauttrekk fra dag 1 (ikke etter første uttrekk).
- `logg.md` og STATUS beskriver **former og feltnavn, aldri verdier**.
- Skjermbilder av en prototype med ekte data ER persondata.
- Issue-regelen i `fase-slutt` (ingen persondata i org-repoet) generaliseres til å
  gjelde alle artefakter, ikke bare issues.

### Forcing function: samling med 30 deltakere (opplyst 2026-08-18)

BK: første versjon skal først og fremst kunne brukes av en **ikke-utvikler**;
utviklerne kan komme etter. Samlingen er en seanse der 30 personer løser **én
enkel oppgave**, og BK tørrkjører oppgaven selv før den gis til noen.
**Ukjent ennå:** dato, hvilken klient deltakerne kjører (terminal-CLI, VS
Code-utvidelsen, Desktop-appen) og Mac-andelen. Alle tre styrer omfanget.

**Formen er gruppearbeid, og installasjonen «jukses» på forhånd:** hver gruppe har
én som skriver, og alle skrivemaskinene har pakken installert og prøvd FØR
samlingen. Tre plattformer: Windows x64, **Mac** og **Snapdragon (Windows på ARM)**.

Det flytter risikoen ut av seansen og inn i en **pre-flight på skrivemaskinene** —
og de to målte oppstartsfunnene gjelder der i stedet: `/plugin` finnes ikke i VS
Code-utvidelsen (installasjon må skje i terminalen), og privat repo krever
`gh auth login` + GitHub-medlemskap i organisasjonen. Sentral utrulling via managed
settings er derfor **ikke kritisk vei for samlingen**; den er oppskaleringen etterpå.

- **BK: ikke nedgrader innholdet.** Trimmeforslagene fra første vurdering er
  trukket. `/grill-me` er tvert imot antakelig den mest gruppevennlige delen av
  pakken: et intervju som tvinger fram beslutninger er nettopp hva en gruppe gjør
  sammen, og `**Beslutning (<beslutningstaker>, <tema>)**` fanger hvem i gruppa som
  bestemte hva. Planmodus og verifiseringsporten er gruppespørsmål («er dette bra
  nok til å gå videre?»), ikke seremoni.
- **Eneste reduksjon jeg fortsatt vil argumentere for: dataregime syntetisk** — og
  ikke fordi pakken ikke tåler mer, men fordi 30 deltakere × reelle persondata i en
  workshop er et personvernspørsmål, ikke et skill-spørsmål. BKs avgjørelse.
- **Pre-flight per plattform, verifisert før dagen:** Windows x64 er prøvd.
  **Snapdragon/ARM: maskinen finnes** — kontor-PC-en, som fortsatt står på gammelt
  oppsett (se «Maskinstatus»); den oppgraderingen har nå en frist. **Mac: helt
  urørt** — trenger en frivillig maskin, og det er plattformen flest er på.
  Mac-skjevheten i `prosjekttyper.md` (se egen seksjon) treffer nøyaktig her:
  Windows-regler skal ikke havne i STATUS på en Mac.
- **Tørrkjøringen er den viktigste testen vi har.** Krav til den for at den skal gi
  data framfor en følelse: noter hvert sted du måtte forklare noe, hvert sted du
  ventet, og hvert spørsmål du besvarte med kunnskap en deltaker ikke har. Det
  siste er der pakken forutsetter en vedlikeholder.

### Konsekvens for beslutningen som blokkerer resten

Rolleaksen jeg foreslo først står nå som et argument **mot** seg selv: leverer ti
kollegaer prototyper med hver sin struktur, flyttes kostnaden bare til utviklerne,
som må lære tre varianter. **Ensartethet er selve produktet.** Retningen er derfor
én flyt med *mindre* maskineri for alle — læringssløyfens ratchet, probedisiplinen
og deny-grensene kan bo i vedlikeholderdokumentasjonen framfor i hver kollegas
prosjekt — pluss dataregime-spørsmålet.

**Beslutningen som trengs fra BK:** godtas «én flyt, mindre maskineri, dataregime
som eneste nye spørsmål» som retning? Sies ja, følger tre leveranser: produksjonsgap-
fila, artefaktreglene over, og en gjennomgang av hva som skal ut av kollegaenes
prosjekter og inn i vedlikeholderdokumentasjonen.
