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

> **STATUS 2026-08-17: alle sju funn under «Funn fra testplanen» er RETTET** i
> PR #2 (branch `funn-testplan-1-3`, fem commits, ikke merget). Ikke gjenta dem.
> Punktene står som historikk og belegg — de forklarer *hvorfor* malteksten er som
> den er, og hvilke prober som ligger bak.
>
> **Avklart siden de ble skrevet:** `PowerShell(...)` er et gjenkjent scope, men
> mønsterformen virker ikke — bar tool-navn-oppføring slår ut hele verktøyet.
> `Read(...)`-deny dekker også Write og Bash-kommandoer som nevner stien, men
> mekanismen er tekstmatching (`ls -la` på katalogen kjørte). `ask`-nøkkelen
> forkaster ikke blokken. `Read(...)`-stiformen er den siste uavklarte —
> **probe 7** avgjør den.
>
> **Gjenstår før merge:** probe 7, og én ren trial på fase-slutt-porten.
> Se `STATUS.md` for rekkefølge.

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

## Funn fra testplanen (rettes via branch + PR)

- **ALVORLIGST — BEKREFTET 2026-08-17: `Bash(...)`-deny er verktøy-scopet og
  dekker ikke PowerShell-verktøyet.** Kontrollkall i testprosjektet, samme økt,
  samme URL (`http://127.0.0.1:9/`):

  | Kall | Verktøy | Deny-regel | Utfall |
  |---|---|---|---|
  | `curl http://127.0.0.1:9/` | Bash | `Bash(curl:*)` | **Blokkert** |
  | `Invoke-RestMethod http://127.0.0.1:9/` | PowerShell | `Bash(Invoke-RestMethod:*)` | **Kjørte** (feilet kun på manglende lytter) |

  - **Konsekvens:** `Bash(Invoke-WebRequest:*)` og `Bash(Invoke-RestMethod:*)` i
    [maler.md:235-236](../plugins/faseflyt/skills/nytt-prosjekt/references/maler.md#L235-L236)
    er døde regler på Windows. De står i deny-settet som skal hindre Claude fra å
    hente produksjonsdata i **persondata-prosjekter** — altså er det den
    sikkerhetskritiske delen av malen som ikke er koblet til. Bash-siden virker;
    det er krysningen mellom verktøy som er hullet.
  - **Skjevheten er speilvendt Mac-funnet nedenfor:** på Mac finnes bare Bash, så
    settet virker der. På Windows finnes to verktøy og malen navngir ett. Malen er
    altså *bash*-skjev her og *windows*-skjev i `prosjekttyper.md`. Begge må
    plattformbetinges, ikke bare den ene.
  - **TESTET 2026-08-17 (økt 3) — `PowerShell(...)`-matchere virket IKKE.**
    `PowerShell(Invoke-RestMethod:*)` i deny stoppet ingenting; kallet nådde
    nettverksstakken (`WebException` fra `HttpWebRequest`). Probe 0 (`curl` i Bash
    blokkert) beviste samtidig at `permissions`-blokken var aktiv, så «forkastet
    konfigurasjon» er utelukket.
  - **Men to forklaringer står igjen — ikke konkluder ennå.** Feilmeldingen viste
    `At line:1 char:302`: PowerShell-verktøyet pakker kommandoen i en preamble, så
    strengen matcheren ser starter IKKE med cmdlet-navnet. (A) `PowerShell(...)` er
    ikke gjenkjent scope, eller (B) scopet er gyldig men prefiks-mønsteret treffer
    innpakningen. Diskriminator: bar `"PowerShell"`-oppføring i deny + `echo hi`
    som kontroll. Blokkert ⇒ B, kjører ⇒ A.
  - **Konsekvensen skiller lag:** ved A finnes ingen deklarativ fiks. Ved B finnes
    bare alt-eller-ingenting per verktøy — ubrukelig i praksis, siden ingen kan
    jobbe med PowerShell-verktøyet blokkert. Begge veier peker på hooken, men
    malteksten må si det riktige.
  - **Avgjør hook-saken:** en PreToolUse-hook får `tool_name` og er dermed
    verktøy-agnostisk — det er det eneste laget som lukker hullet uten å måtte
    liste hver shell. Flyttes fra «kjekt å ha» til del av denne rettingen.
  - **Rekkefølge:** dette bør rettes FØR kollegatesting starter, ikke etter. Et
    persondata-prosjekt scaffoldet i mellomtiden får et halvt vern og en
    CLAUDE.md-tekst som lover to lag.
  - **Alias-flaten kan ikke listes ferdig.** Et navnebasert deny-sett må dekke
    hvert navn som faktisk brukes: `irm`/`iwr` (innebygde aliaser for
    `Invoke-RestMethod`/`Invoke-WebRequest`), `curl.exe` (bart `curl` er alias for
    `Invoke-WebRequest` i PS 5.1, men `.exe` treffer binæren og går utenom), og på
    filsiden `gc`, `cat`, `type`, `Select-String`, `Import-Csv`. Konklusjon: listen
    blir aldri komplett — det er hovedargumentet for PreToolUse-hooken, som ser
    hele kommandostrengen framfor å gjette navn. Malen skal si dette åpent
    framfor å late som settet er uttømmende.
  - **Verre enn aliaser: omveier uten kommandonavn.** `[Net.WebClient]`,
    `Start-BitsTransfer`, `[IO.File]::ReadAllText()` og indirekte kall
    (`$c='irm'; & $c`) har ingen kommandonavn en matcher kan treffe. Dette gjør
    navnebaserte mønstre prinsipielt utilstrekkelige, ikke bare ufullstendige.
  - **Ærlighet også om hooken:** en PreToolUse-hook ser kommandostrengen og
    fanger derfor `[Net.WebClient]` som tekst — men ikke `& $c`, der navnet først
    finnes ved kjøring. Hooken er et sterkere lag, ikke et tett. Malen skal ikke
    selge den som løsningen; absolutt isolasjon krever sandbox/container. Samme
    ærlighetsklausul som deny-settet har i dag.
  - **Sideobservasjon å verifisere:** `Read(.env.*)` blokkerte også et **Write**
    mot samme sti. Enten dekker `Read(...)`-matchere mer enn navnet antyder, eller
    `.env` har innebygd særstatus i Claude Code uavhengig av settings. Avklares
    med kanarifugl-filen, som ikke har særstatus. Betyr noe for malen: lover vi
    skrivebeskyttelse vi ikke har, er det samme feil som nettverksdelen.

- **Test 1 (2026-08-17): `/plugin` finnes ikke i VS Code-utvidelsens chat**
  («/plugin isn't available in this environment») — kun i terminal-CLI-en.
  README/installasjonsseksjonen må si eksplisitt: installasjon skjer i
  terminalen (`claude` interaktivt, eller `claude plugin ...`-subkommandoer);
  utvidelsen plukker opp pluginene etterpå (delt ~/.claude-konfig). Rammer
  alle kollegaer som kun bruker utvidelsen — profil B i kollegatesten.
  - **Generaliseres (2026-08-17): `/permissions` finnes heller ikke** som
    slash-kommando i utvidelsen — den ligger under «Customize → Permissions» i
    kommandomenyen. Mønsteret er altså ikke `/plugin`-spesifikt: utvidelsen
    eksponerer enkelte CLI-kommandoer som menyvalg i stedet for slash-kommandoer.
    README bør si det som en regel, ikke som en kuriositet om `/plugin`, og
    nevne terminal-CLI-en som fallback for kommandoer man ikke finner.

- **Test 3 (2026-08-17): en uverifisert nøkkel i `permissions` kan invalidere
  hele blokken — malen bør kreve en integritetssjekk.** Ved å legge inn en
  `ask`-liste (uverifisert form) risikerte vi at Claude Code forkaster hele
  `permissions`-objektet, slik at *alle* deny-regler blir stille inaktive og hver
  probe leser «kjørte». Det er den verste feilmoden: den ser ut som «vernet virker
  ikke» framfor «konfigurasjonen ble avvist».
  - **Retting i malen:** ved endring av `.claude/settings.json` skal man alltid
    verifisere med én regel man vet virker (f.eks. `Bash(curl:*)` mot
    `http://127.0.0.1:9/`) FØR man konkluderer på noe annet. Billig, og skiller
    «regel treffer ikke» fra «fil avvist».

- **Test 3 (2026-08-17): `windows.md` mangler BOM-nyansen for `.ps1`-kildekode.**
  Referansefila behandler BOM utelukkende som en fare (shebang, JSON-parsere),
  men sier ingenting om det motsatte tilfellet: Windows PowerShell 5.1 tolker en
  `.ps1`-fil **uten** BOM som ANSI, så strenglitteraler med æøå mojibakes i
  utskriften (`på` → `pÃ¥`). Oppdaget da første testscript ble skrevet.
  - **Avslørende detalj:** et argument gitt på kommandolinjen kom ut riktig
    samtidig som litteraler i fila var korrupte — det er signaturen på at det er
    *fildekodingen*, ikke konsollet, som er problemet.
  - **Retting:** `Set-Content -Encoding utf8` (skriver BOM i 5.1). Regelen som
    må inn: BOM er uønsket i **output**-filer, men påkrevd i **`.ps1`-kildekode
    med æøå**. De to henger sammen og må stå sammen, ellers leses den ene som en
    motsigelse av den andre.
  - **Hvorfor det treffer hver gang:** Write-verktøyet skriver UTF-8 uten BOM,
    så ethvert nytt script med norske tegn må lagres på nytt.
  - **Betinges riktig:** gjelder Windows PowerShell 5.1. PowerShell 7+ antar
    UTF-8 uten BOM og trenger det ikke. Verifiser 7+-oppførselen før den
    formuleres i malen. Samme plattformkrav som Mac-skjevheten under.
  - **NB ved formulering:** eksempelet i selve `windows.md` må være
    plattformnøytralt og uten personnavn — fila pushes, og renhetssjekken
    krever null treff på personnavn.

- **Test 3 (2026-08-17): fase-slutt-vakten kjørte `fase-slutt` i stedet for å
  foreslå den.** På «verifisert, alt OK» startet den andre økten hele
  faseslutt-rutinen selv. Malen krever «**foreslå** `/faseflyt:fase-slutt` +
  `/clear` med én gang» ([maler.md:170](../plugins/faseflyt/skills/nytt-prosjekt/references/maler.md#L170)) — ikke utfør.
  - **Hvorfor det er alvorlig, ikke bare ivrig:** `fase-slutt` steg 6 committer
    og pusher uten eget klarsignal (riktig når brukeren kalte skillen). Kjører
    vakten den selv, blir en verifiseringsbekreftelse alene nok til å utløse
    commit + push — og verifiseringsporten, som er hele poenget med flyten, er
    omgått. I et persondata-prosjekt kan det bety utilsiktet push.
  - **Sannsynlig årsak — formulering:** «foreslå … **med én gang**» leser like
    naturlig som «sett i gang straks» som «foreslå straks». Rett til noe i
    retning av: «foreslå — og vent på klarsignal. Ikke kall `fase-slutt` selv;
    den committer og pusher.» Samme presisering vurderes for plan-vakten.
  - **BEKREFTET 2026-08-17.** Rutinen gikk helt gjennom og committet (`005b07c`)
    uten å spørre. Ingen push skjedde — men *bare* fordi testprosjektet ikke har
    remote. Det er flaks i oppsettet, ikke en vakt som virket.
  - **Diagnostisk kontrast — den stoppet foran `gh issue create` og spurte.**
    Samme klasse handling (utoverrettet, vanskelig å reversere), men der finnes
    en eksplisitt regel ([fase-slutt/SKILL.md:41](../plugins/faseflyt/skills/fase-slutt/SKILL.md#L41)).
    For selve kallet på `fase-slutt` finnes ingen. Eksplisitt port respektert,
    implisitt port ikke — samme lærdom som deny-reglene: regelen må stå skrevet
    der den gjelder. Dette peker på fiksen: gjør porten eksplisitt, ikke
    underforstått.
  - **Vurder også:** eksplisitt regel i `fase-slutt/SKILL.md` om at skillen bare
    kjøres når brukeren har bedt om den — og at commit/push i steg 6 forutsetter
    at det var brukeren som kalte den.
  - **Sidefunn:** faseslutt-rutinen kjørte før deny-sjekken med dummy `.env`
    (rekkefølgen i STATUS) — deny-sjekken må gjentas i test-prosjektet.

- **Test 3 (2026-08-17): `<navn>`-plassholderen i beslutningsmønsteret tolkes som
  tema, ikke som person.** I testprosjektets `logg.md` ble alle tre beslutninger
  merket `**Beslutning (git-remote)**`, `(script-encoding)`, `(persondata)` —
  altså emneord. Mønsteret er dokumentert som *navngitt beslutningstaker*
  ([fallgruver.md:13](../plugins/faseflyt/skills/nytt-prosjekt/references/fallgruver.md#L13)),
  og det er sporbarheten som er poenget: «hvem bestemte dette?» uker senere.
  - **Årsak:** plassholderen `<navn>` står uten et eneste konkret eksempel på
    alle fem stedene den brukes — `nytt-prosjekt/SKILL.md:36`,
    `fase-slutt/SKILL.md:18`, `grill-me/SKILL.md:36`, `maler.md:21` og `:180`,
    `claude-design-oppskrift.md:38`. «Navn» leser like naturlig som navnet på
    beslutningen.
  - **Retting:** bytt til utvetydig plassholder (`<beslutningstaker>`) og vis
    **ett konkret eksempel** i `maler.md`. Vurder å tillate begge deler
    eksplisitt (`**Beslutning (<beslutningstaker>, <tema>):**`) — emneordet var
    faktisk nyttig for skanning, så det beste er antakelig å beholde det og
    kreve personen i tillegg. Alle fem stedene rettes samtidig, ellers driver de
    fra hverandre.
  - **Lav prioritet, samme fil:** logg-malens topptekst sier ubetinget «Hver
    fase føres to ganger», men [fase-slutt/SKILL.md:19-21](../plugins/faseflyt/skills/fase-slutt/SKILL.md#L19-L21)
    gjør «skrevet»-innslaget betinget av at verifisering ikke har skjedd ennå.
    Verifiseres implementering og bekreftelse i samme økt, er ETT ✅-innslag
    riktig — som her. Toppteksten bør si «to ganger *når* verifiseringen skjer i
    en senere økt», så den ikke leses som et brudd.

- **Test 3 (2026-08-17): deny-settet kan ikke verifiseres av brukeren — vernet er
  selvskjulende.** Ba testøkten lese dummy-`.env`. Den avslo av eget skjønn
  (CLAUDE.md-regelen), **uten å forsøke noe verktøykall** — så harness-en ble
  aldri testet. Modellens gode oppførsel maskerer om deny-regelen i det hele tatt
  er koblet til.
  - **Hvorfor det er en pakkemangel, ikke bare et testproblem:** `nytt-prosjekt`
    installerer deny-settet og `CLAUDE.md`-regelen som «to forsvarslinjer», men
    gir ingen oppskrift på å bekrefte at linje to lever. En kollega kan derfor
    aldri vite om vernet virker — og et ubekreftet vern er verre enn ingen, fordi
    det gir falsk trygghet. Ærlighetsavsnittet dekker at *mønstre kan omgås*,
    ikke at en regel kanskje aldri var tilkoblet.
  - **Retting:** kort «slik verifiserer du deny-settet»-avsnitt i `maler.md` eller
    `references/`, med **ukonfundert** probe: bruk en regel som IKKE har en
    tilsvarende CLAUDE.md-regel (nett-cmdlet mot `http://127.0.0.1:9/`), siden
    fil-probene alltid vil kollidere med personvernregelen.
  - **Åpent spørsmål til hooken:** en PreToolUse-hook er testbar (den logger og
    returnerer exit 2) og løser dermed verifiserbarheten samtidig som den lukker
    shell-hullet. Styrker saken for hooken.

- **Test 3 (2026-08-17): `logg.md` krever ikke belegg for funn — antakelser kan
  føres som oppdagelser.** Testøkten skrev «To ting dette avdekket: `Read(.env)`
  fanger ikke absolutt sti» etter å ha **nektet å forsøke kallet**. Påstanden kan
  være riktig, men den er utledet, ikke målt — og var på vei inn i `logg.md` som
  funn, med en regelendring som følge.
  - **Presis mangel:** `laering.md`-malen krever belegg for hvert punkt (og
    testøkten leverte det, forbilledlig). `fase-slutt` steg 1 ber om
    «overraskelser og funn» i `logg.md` **uten** samme krav. Standarden finnes
    altså i pakken, men bare på den ene av to filer.
  - **Retting:** samme belegg-krav i logg-malen, og et eksplisitt skille mellom
    *observert* (kall forsøkt, resultat sett) og *antatt* (utledet, ikke testet).
    Antakelser føres som hypotese med hva som ville avgjort dem. Ellers eroderer
    loggens troverdighet — som er hele grunnlaget for at «verifisert ✅» betyr noe.
  - **Beslektet, verdt en linje i malen:** modellen holdt riktig på at en regel
    ikke omgås i én melding, men skal endres skriftlig. Det er ønsket oppførsel og
    bør stå som mønster i `fallgruver.md` (blant tingene som beviselig fungerte).

## PreToolUse-hook som forsvarslinje for persondata-prosjekter (etter grønne tester)

Vurdert 2026-08-17 etter innspill om at deny-regler ikke garantert stopper
fillesing via Bash (`cat .env` o.l.). Konklusjon: reell, men delvis utdatert
bekymring — Claude Code anvender Read/Edit-deny best-effort også på
Bash-kommandoer, og planen dokumenterer alt grensen («risikoreduksjon, ikke
sandkasse»). Verdt å legge til en *teknisk* tredje forsvarslinje:

- **Hva:** PreToolUse-hook i prosjektets `.claude/settings.json` + script i
  repoet, som denyer Bash-kommandoer som treffer sensitive filer
  (`.env`, `local.settings.json`, datamapper). Tilbys i `nytt-prosjekt`
  steg 6 når brukeren svarer ja på persondata-spørsmålet — samme lag som
  deny-reglene, følger med ved overtakelse.
- **Krav til implementasjonen** (det sirkulerende scriptforslaget var feil):
  hooks får JSON på **stdin** (`tool_name`, `tool_input`), blokkering krever
  **exit-kode 2** eller `permissionDecision: "deny"` (exit 1 blokkerer IKKE),
  registrering er liste med `matcher` + `hooks`-objekter. Må virke på **både
  Mac og Windows** (de fleste utviklerne er på Mac; noen på Windows) — altså
  verken bash-only eller PowerShell-only; vurder portabelt script eller
  plattformdelt hook. Verifiser eksakt format mot dokumentasjonen før det
  skrives inn i malene.
- **Ærlighet beholdes:** hook + deny + CLAUDE.md-regel = tre lag
  risikoreduksjon; absolutt isolasjon krever sandbox/container.
- **Prosess:** egen liten fase/PR etter at testplan 1–3 er grønne.

## HYPOTESE (økt 3): bare-filnavn-formen i Read(...) matcher aldri — også Read(.env)

Probe 1a: `Read(kanarifugl.txt)` i deny stoppet **ikke** Read-verktøyet på absolutt
sti, mens `permissions`-blokken beviselig var aktiv. Tre kandidatforklaringer, alle
utestet:

1. absolutt sti glipper forbi mønsteret
2. bare-filnavn-formen matcher aldri, uansett stiform
3. stimønstre resolveres relativt til `settings.json`s katalog — `Read(kanarifugl.txt)`
   blir da `.claude/kanarifugl.txt`, som ikke finnes

**Hvorfor dette er verre enn nettverksfunnet:** er 2 sann, er `Read(.env)` i malen
også dødvekt — og `.env` så beskyttet ut i økt 2 kun fordi Claude Code kan ha
innebygd særstatus for `.env`. Da hviler filvernet på én mekanisme vi ikke
kontrollerer pluss modellens eget skjønn. `Read(data/**)` er glob-form og kan være
den eneste som lever.

**Rigg for neste økt, én omstart skiller alle tre:**

- bytt til `Read(**/kanarifugl.txt)`, gjenta 1a → blokkerer ⇒ forklaring 1
- legg `.claude/kanarifugl2.txt` + regel `Read(kanarifugl2.txt)` → blokkerer ⇒ forklaring 3
- begge kjører ⇒ forklaring 2, og `Read(.env)` må antas død til motsatt er vist
- deretter 1b (`Get-Content` via PowerShell) først når en av dem blokkerer

Ikke test med dummyfil i `data/` — bryter den stående regelen, og glob-spørsmålet
kan besvares på kanarifugl-filen.

## Testdisiplin inn i fallgruver.md: «én observasjon, ett utfall, én forklaring»

Kom ut av testøkten som `[flere-forklaringer]` og er generell, ikke
prosjektspesifikk. Regelen: en probe som kan feile av flere grunner måler
ingenting — del den i to *før* den kjøres. Tre tilfeller i én økt:

- hypotese ført som funn uten at noe kall ble forsøkt
- `Get-Content` mot en `Read(...)`-regel — konflaterte lasting, stiform og
  verktøy-scoping i ett utfall
- blokkering attribuert til `settings.json` der innebygd `.env`-særstatus var
  like sannsynlig forklaring

Følgeregel, samme punkt (`[hypotese-vs-funn]`): en overskrift skal ikke påstå mer
enn forbeholdene under den tillater. Hører sammen med belegg-kravet i logg-malen.

## Deny-settet må differensieres per prosjekttype — aksen er feil

Vurdert 2026-08-17. Mønstrene treffer **kommandonavn**, mens risikoen ligger i
**målet**: `Invoke-RestMethod http://localhost:5173/api/health` (Claude røyktester
eget endepunkt — kjernen i Fase 0) og et kall mot et produksjons-API er samme
kommando og helt ulike handlinger. Ett bredt sett for alle typer betyr at webapp-
og API/backend-prosjekter mister evnen til å verifisere eget arbeid — og et deny
som står i veien for normalt arbeid blir slått av i irritasjon, som er den verste
utgangen.

- **Retting i `maler.md`/`prosjekttyper.md`:** deny-sett per prosjekttype. script
  og dokumentasjon: bredt nettverksdeny, null kostnad. webapp og API/backend:
  enten `ask`-tier for nett-kommandoer, eller mønstre som treffer
  produksjonsvertene framfor kommandonavnene.
- **`ask`-tieren må verifiseres** (nøkkelnavn + oppførsel) med samme
  kontrollkall-metode som `PowerShell(...)`-formen. Skrives ikke inn i malen før
  den er testet — samme disiplin som resten av denne runden.
- **`Read(data/**)`:** skill produksjonsuttrekk (`data/`, denied) fra syntetiske
  fixtures (`testdata/`, tillatt). Blokkerer malen fixtures Claude trygt kan lese,
  blir hele regelen slått av.
- **`Read(.env)` beholdes hardt** — behovet finnes ikke: nøkkelnavn uten verdier,
  `.env.example` og `$env:NAVN` dekker alle reelle tilfeller. Skriv erstatningene
  inn i malen, så brukeren ikke tror regelen koster noe.
- **Prinsipp for malteksten:** asymmetrien i feilmodus favoriserer deny — for
  bredt gir en synlig blokkering som fjernes på sekunder, for smalt gir en
  usynlig lekkasje. Men det gjelder bare når regelen ikke står i veien for
  normalt arbeid; da vinner irritasjonen. Si det rett ut.

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
