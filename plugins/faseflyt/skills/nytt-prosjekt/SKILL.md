---
name: nytt-prosjekt
description: >-
  Setter opp fase-arbeidsflyten for et prosjekt: kunnskap/-struktur, plan- og
  statusmaler, læringssløyfe og prosjektregler. Brukes når et nytt prosjekt skal
  startes, eller når et eksisterende prosjekt skal over på faseinndelt arbeidsflyt.
  Triggere: «nytt prosjekt», «start et prosjekt», «sett opp faseflyt», «new
  project», «set up phased workflow», «scaffold project workflow».
---

# Nytt prosjekt — fase-arbeidsflyt

Denne skillen setter opp arbeidsflyten der prosjekter kjøres i **faser med
verifiseringsport**: planen skrives først (i planmodus) og lagres i prosjektet,
hver fase implementeres i én økt, **brukeren verifiserer** før neste fase, og
`/faseflyt:fase-slutt` + `/clear` avslutter økten. Ny økt starter med
`/faseflyt:fase-start`, som leser `kunnskap/STATUS.md` i stedet for å utforske
kodebasen på nytt. Utforskning underveis delegeres til Explore-subagenter — bare
konklusjonen inn i hovedtråden. Tyngste modell brukes til plan/arkitektur/
sikkerhetskritiske valg; lettere modell holder til mekanisk implementering.

## Malteksten kopieres ORDRETT — den skal ikke gjenfortelles

Alt som står i en **kodeblokk** i `references/maler.md` og `references/windows.md`
er maltekst som skal kopieres **tegn for tegn** inn i prosjektets filer. Den skal
ikke oppsummeres, forkortes, «skrives med egne ord» eller slås sammen — heller
ikke når du mener din formulering er klarere.

**Hvorfor regelen er så hard:** ordlyden er målt, ikke smakssak. Samme prosjekt er
kjørt med parafrasert og ordrett maltekst som eneste variabel: med parafrase kjørte
faseslutt-rutinen (inkludert commit) uten klarsignal fra brukeren; med ordrett
tekst holdt porten. Rytmevaktene og deny-avsnittene er skjerpet gjennom flere
runder nettopp fordi svakere formuleringer beviselig ga feil oppførsel — en
parafrase kaster de rettingene bort uten at noen ser det.

**Prosjektspesifikt innhold legges til som EGNE seksjoner eller punkter.** Malens
egne seksjoner endres aldri. Det eneste som fylles inn er `<...>`-plassholderne,
og for lister der malen selv sier at innholdet er prosjektavhengig (f.eks.
deny-settets mappe- og filnavn), er det bare verdiene som byttes — ikke teksten
rundt.

**Etterkontroll før du melder et malsteg ferdig:** les malfilen og fila du skrev
på nytt, og sammenlign seksjon for seksjon. Mangler en seksjon eller et punkt, er
en setning omformulert, eller er en plassholder stående uendret der den skulle
fylles ut — rett det FØR du går videre. Meld steget ferdig ved å navngi hvilke
seksjoner som er kopiert, ikke bare at fila er opprettet.

## Snakk norsk til brukeren

Alt brukeren ser — spørsmålene dine, fasenavnene i planen, STATUS og CLAUDE.md —
skrives på vanlig norsk. Pakken brukes av både utviklere og folk som ikke koder,
og et ord ingen av dem trenger å slå opp koster ingenting å bytte:

| Si dette | Ikke dette |
|---|---|
| sette opp prosjektet | scaffolde |
| slår inn / utløser | trigge |
| Claude Code selv | harness-en |
| sjekk at prosjektet virker | kvalitetsport |
| rask sjekk / rask sikkerhetssjekk | røyktest, smoke test |
| test / kontrollkall | probe |
| en test som bare kan feile av én grunn | ukonfundert probe |
| kontrollsøk som skal gi treff | positiv kontroll |

Literale navn oversettes aldri: `deny`-nøkler i `settings.json`, `commit`,
filnavn og kommandoer står som de er. Møter du et fagord som ikke står i
tabellen, gjelder regelen bak den: bruk det bare hvis du forklarer det i samme
setning.

### Arbeidsflytordene: forklares, ikke byttes ut

Tabellen over bytter ett ord for et annet. Det virker ikke på ordene
arbeidsflyten *består av* — `fase` har ikke noe synonym, og `/clear` er et
literalt kommandonavn som skal stå. Disse ordene skal derfor **brukes**, men de
skal forklares **første gang de dukker opp for brukeren** — i planen, i STATUS, i
CLAUDE.md-avsnittet og i chatten. Én setning holder:

| Ord | Forklaringen som følger med første gang |
|---|---|
| skill | en ferdig oppskrift Claude følger; du kaller den ved å skrive det den heter |
| planmodus | en modus der Claude bare planlegger og ikke endrer noe — du godkjenner først |
| grilling (`/faseflyt:grill-me`) | Claude intervjuer deg og stiller de kjipe spørsmålene til bestillingen er avklart; du svarer |
| fase | en bit arbeid som er liten nok til at du kan se at den virker — én fase, én ting å sjekke |
| fase 0 | den første fasen: prosjektet settes opp, og du sjekker at det så vidt virker |
| verifisere | at **du** ser at det virker — ikke at Claude sier det virker |
| økt | en arbeidsstund med Claude: fra du åpner samtalen til du tømmer den — neste gang er en ny økt |
| faseslutt (`/faseflyt:fase-slutt`) | punktet der du har godkjent en fase; Claude oppsummerer og lagrer, slik at neste økt kan starte uten å ha vært med |
| fasestart (`/faseflyt:fase-start`) | starten på en ny økt: Claude leser notatene fra forrige faseslutt og sier hvor du står og hva som er neste steg |
| `/clear` | tømmer samtalen; alt viktig er alt lagret i filer, så ingenting går tapt |
| sikkerhetssjekk | ved faseslutt: Claude sjekker at prosjektet virker og tar en rask stikkprøve på fødselsnummer, passord og nøkler — ikke en full gjennomgang |
| mocke / mock-data | vi later som vi har en database, men bruker noen enkle filer med oppdiktet innhold |
| prototype | noe som skal vises fram, ikke settes i drift |

**Bruk navnene, bare ikke ubeskyttet.** «Si "nytt prosjekt"», `web-prototype` og
`/faseflyt:fase-start` skal hete det de heter — brukeren må kunne skrive dem. Det
er *begrepet bak navnet* som trenger setningen sin, og bare første gang.
Forklaringen gjentas ikke i hver setning etterpå.

En ordliste er nødvendig, men svakere enn en forklaring på stedet: den krever at
leseren husker å slå opp. Står ordet i en instruksjon brukeren skal utføre, hører
forklaringen i samme setning.

**Grunn (tredje måling, 2026-08-20):** en ikke-teknisk kollega leste
oppgavematerialet til en samling og fikk ikke noe ut av det. Målt etterpå: **20
uforklarte fagord på det ene arket hun fikk i hånda**, og ingen ordliste noe sted
— materialet brukte i tillegg `scaffold`, `røyktest` og `trigge`, tre ord som står
i «Ikke dette»-kolonnen over. Ingen av ordene som faktisk stoppet henne sto i
tabellen, fordi tabellen bare dekket ord Claude bruker om *seg selv*.
Vedlikeholderens egen forklaring på funnet er verdt å ta med som regel:
**«jeg har jobbet med dette i ukesvis, så ikke rart at det blir uforståelig for en
som ikke har vært med på reisen.»** Den som har skrevet materialet er dårligst
egnet til å bedømme om det er lesbart. Derfor er dette en liste å følge, ikke en
magefølelse å stole på.

**Grunn (målt to ganger):** teksten i denne fila speiles rett ut i chatten. Da
skillen omtalte seg selv som å «scaffolde», svarte økten brukeren «jeg trenger tre
avklaringer før jeg scaffolder» — og fasenavn som «Fase 0 — Scaffold og røyktest»
fulgte med inn i prosjektets egen `plan.md`, der de blir stående i månedsvis.
Andre gang (2026-08-19) kom «røyktesten er ren og proben bevist levende» og
«ingen `package.json` — ingen kvalitetsport i dette repoet» ut i chatten til en
bruker som måtte spørre hva tre av ordene betød. Ingen av setningene sto i noen
fil: de ble satt sammen av ordene i *disse* skillene. Derfor er tabellen over en
regel om hva du skriver her, ikke bare om hva du sier.

## Når du blir kalt — gjør i rekkefølge

0. **Sjekk at pakken er oppdatert — raskt, og aldri blokkerende.** Les `version`
   i `.claude-plugin/plugin.json` to nivåer over denne skillens basekatalog
   (kjørende versjon) og i
   `~/.claude/plugins/marketplaces/claude-code-skills/plugins/faseflyt/.claude-plugin/plugin.json`
   (installert versjon). Er installert nyere enn kjørende: si det, og tilby å ta
   oppsettet etter at brukeren har lukket og startet Claude Code på nytt — en
   kjørende prosess beholder versjonen den startet med, og et oppsett kjørt på
   gammel versjon bruker gamle maler. Får du ikke lest en fil: si det i én
   setning og fortsett — sjekken er et varsel, ikke en port. Org-repoet sjekkes
   ikke: det krever git mot en annen katalog, og den formen matcher ingen
   oppføring som kan stå i en delt fil (se `references/maler.md`, grense 10).

1. **Nytt eller eksisterende prosjekt?** I et eksisterende prosjekt: opprett kun
   det som mangler, hopp over `git init` når repo finnes, og UTVID eksisterende
   `CLAUDE.md` — overskriv aldri noe.

2. **Avklar prosjekttype** (styrer alt videre — se `references/prosjekttyper.md`):
   webapp/prototype, script/automatisering, dokumentasjon/utredning, eller
   API/backend-tjeneste. Spør samtidig: behandler prosjektet **persondata**
   (styrer deny-regler i steg 6)? Bruker det **FINT** (styrer skill-deklarasjon)?
   Og prosjektnavn/domene.

   **Still spørsmålene samlet i én melding** — de er enkle, og fem turer for fem
   svar er fire for mange. Har brukeren limt inn en oppgavetekst som alt svarer
   på noe av det, gjenta svarene som antakelser og spør bare om det som mangler.

   **Svarer brukeren ja på persondata, still ett oppfølgingsspørsmål:** skal
   reelle persondata inn i selve løsningen, eller bare leses av brukeren
   underveis (Claude forbereder spørringen, brukeren kjører den og limer inn
   det som trengs, uten persondata)? Det siste er det oppsettet er laget for.
   Det første er ikke en prototype lenger: si det rett ut — behandlingsgrunnlag
   og vurdering hører til før koden, og avklares utenfor denne skillen. Sett
   likevel opp prosjektet som for lesing via brukeren, og skriv avklaringen inn
   som første post i `TODO.md`, så den ikke glemmes.

3. **Tilby `/faseflyt:grill-me` før planen.** Grillingen låser beslutningene som
   ellers dukker opp midt i implementeringen. Beslutningene skrives inn i planens
   `## Avklarte beslutninger` med `**Beslutning (<beslutningstaker>, <tema>):**`
   + begrunnelse — `<beslutningstaker>` er personen som bestemte, ikke temaet.

4. **Planen skrives i planmodus og kopieres til `kunnskap/plan.md`.** Planmodus
   lagrer sin fil under `~/.claude/plans/` med autogenerert navn — den kopien er
   en engangsartikkel. **Ved godkjenning kopieres innholdet til
   `kunnskap/plan.md`, som fra da av er kanonisk** og det STATUS peker på.
   Endres planen senere, endres `kunnskap/plan.md`. Planstruktur og
   fasedimensjonering: se plan-malen i `references/maler.md` — én fase = én
   enhet brukeren kan verifisere, som får plass i én økt uten `/compact`;
   fase 0 er alltid oppsett, med noe som kjører til slutt; 3–10 faser er
   normalområdet.

5. **Opprett filene** ved å kopiere malene i `references/maler.md` **ORDRETT**
   (se regelen over, inkludert etterkontrollen): `kunnskap/STATUS.md`,
   `kunnskap/logg.md`, `kunnskap/laering.md` og `kunnskap/sikkerhet.md` for alle
   typer; `kunnskap/arkitektur.md` kun for kode-typene. `TODO.md` i rotkatalogen
   fra dag 1 — også tom. Malenes forklarende topptekster og krav (belegg-kravet i
   logg-malen, etikett- og handlingsbarhetskravet i læringsmalen) er en del av
   malen og følger med — de er det som gjør at filene brukes riktig senere.
   På Windows: snutten fra `references/windows.md` går IKKE i STATUS — STATUS
   overskrives ved hver faseslutt, og snutten forsvant slik 2026-09-04. Den
   skrives i steg 8, inn i `CLAUDE.md` rett etter fase-arbeidsflyt-avsnittet,
   ordrett og i sin helhet, FØR første filskript skrives. **Begge halvdelene av
   encoding-regelen må følge med** — BOM uønsket i
   filer scriptet produserer, BOM påkrevd i `.ps1`-kildekode med æøå: den ene lest
   alene leses som en motsigelse av den andre, og et script som mangler den andre
   halvdelen mojibaker ved første kjøring.

6. **Skriv `.claude/settings.json` og `.claude/skills/README.md`** fra malene —
   også her ordrett, med bare mappe- og filnavn tilpasset prosjektet:
   marketplace-deklarasjonen gjør at den som kloner prosjektet får
   arbeidsflyt-skillene automatisk (regelen er: org-skills deklareres, aldri
   kopieres; kun prosjektets egen domenekunnskap bor i `.claude/skills/`).
   Deklarer `web-prototype` kun for webapp-typen og `fint-graphql` kun når
   prosjektet bruker FINT.
   **Pakken eier bare tre ting i denne fila:**
   `extraKnownMarketplaces.claude-code-skills`, oppføringene i
   `enabledPlugins` som slutter på `@claude-code-skills`, og de fire
   `permissions.allow`-oppføringene i malen — de dekker `fase-start` sine egne
   kall. **Lov aldri at de fjerner dialogene:** målt 2026-08-27 ga oppføringer
   som matcher ordrett likevel dialog, mens kall uten oppføring gikk gjennom, så
   allowlisten er ikke alene om å avgjøre. Si i stedet at oppstarten kan koste
   noen godkjenninger, og at «allow for this project» gjør valget varig. Finnes
   `.claude/settings.json` fra før: legg KUN disse nøklene til, og rør
   ingenting annet — en eksisterende `allow`-liste utvides og aldri erstattes,
   brukerens `deny`-liste røres ikke, og heller ikke andre marketplaces
   eller plugins eller nøkler du ikke kjenner. Vis endringen som før/etter og
   **vent på klarsignal før du skriver**. **Etterkontroll (obligatorisk når
   fila fantes):** les den skrevne fila og bekreft at hver nøkkel som fantes
   før, finnes igjen med samme verdi — mangler én, rett det FØR du går videre.
   **Si fra at allowlisten først virker etter omstart** — fila leses ved
   oppstart, ikke midt i en økt (se `references/maler.md`).
   Behandler prosjektet persondata: tilby deny-settet
   for prosjekttypen (se maler.md) — som tillegg til en eksisterende
   `deny`-liste, aldri som erstatning — men **skriv aldri en `permissions`-blokk uten
   å levere kontrollkallet i samme endring** (`Bash(curl:*)` mot
   `http://127.0.0.1:9/`): en uverifisert nøkkel kan gjøre hele blokken stille
   inaktiv, og et ubekreftet vern er verre enn ingen. Forklar kontrollkallet før
   det kjøres: «jeg prøver med vilje en kommando som skal bli stoppet; blir den
   stoppet, vet vi at sperren virker». Vær ærlig om grensene i
   samme åndedrag: matcherne er verktøy-scopet (på Windows dekkes ikke
   PowerShell-verktøyet), navnebaserte mønstre kan ikke bli komplette, og settet
   er risikoreduksjon — ikke sandkasse. Hovedvernet er regelen i CLAUDE.md
   («Claude forbereder kommandoen, brukeren kjører den og limer inn resultatet»);
   deny-settet støtter den, og de to hører alltid sammen.

7. **Git fra dag 1.** Finnes ikke repo: `git init -b main` + `.gitignore`
   (node_modules, `.env` unntatt `.env.example`, build-artefakter) + første
   commit — si at du gjør det, og gjør det; det koster ingenting og gjør at
   ingen fase kan gå tapt. **Tilby** deretter privat remote:
   `gh repo create <navn> --private --source . --push`. Sier brukeren nei,
   eller mangler `gh` eller GitHub-tilgang: si at arbeidet lagres lokalt ved
   hver faseslutt, og at remote kan legges til senere. Finnes en `.gitignore`
   fra før (uten at repo finnes): legg kun til linjene som mangler — overskriv
   den ikke. Commit hører deretter til hvert `/faseflyt:fase-slutt`, og push
   når remote finnes.

8. **Skriv CLAUDE.md-avsnittet** fra maler.md **ORDRETT** — si at du gjør det,
   og gjør det. Det tilbys ikke som valg: det er den eneste teksten i prosjektet
   som er aktiv i HVER økt, og uten den finnes ingen av rytmevaktene og ingen
   språkregel. Dette steget er det viktigste stedet regelen over gjelder.
   Avsnittet inneholder kunnskapsfangst-regelen, de tre rytmevaktene (plan-vakt,
   fase-slutt-vakt, scope-vakt) og regelen om deklarerte vs. prosjekteide skills
   — skills lastes bare når de kalles. En parafrase her slår ut vaktene for all
   framtid i prosjektet, og det er nettopp det som er målt: fase-slutt-vakten
   utførte rutinen i stedet for å foreslå den. Behandler prosjektet persondata, følger
   personvern-avsnittet med — også det ordrett, inkludert setningene om hva
   deny-settet IKKE dekker. På Windows følger CLAUDE.md-snutten fra
   `references/windows.md` med, ordrett og i sin helhet, rett etter avsnittet
   (se steg 5).
   **Etterkontroll (obligatorisk her):** sammenlign den skrevne CLAUDE.md mot
   malblokken punkt for punkt — alle tre vaktene til stede, «foreslå … og vent på
   klarsignal» og porttesten i vakt 2 ordrett, ingen setning slått sammen med en
   annen. Finnes CLAUDE.md fra før: legg avsnittet til, ikke overskriv — og la
   prosjektets egne avsnitt stå urørt ved siden av.

9. **Forklar fase-rytmen kort**, slik at den er avtalt fra dag 1:
   `/faseflyt:fase-start` som første handling i hver økt → implementer fasen →
   brukeren verifiserer → `/faseflyt:fase-slutt` → `/clear`. `/compact` brukes
   kun midt i en fase som ikke rekker å fullføres. Si også at planen ble
   skrevet med den tyngste modellen og at fasene er mekaniske: «bytt til Sonnet
   med `/model sonnet` før fase 0, og tilbake før planen endres».

## Referanser — les ved behov

- `references/maler.md` — alle filmalene (STATUS, logg, læring, arkitektur,
  sikkerhet, TODO, plan, CLAUDE.md-avsnitt, settings.json, skills-README).
- `references/prosjekttyper.md` — hva hver prosjekttype får og slipper.
- `references/windows.md` — encoding- og PowerShell-feller (alle Windows-prosjekter).
- `references/claude-design-oppskrift.md` — eget visuelt tema → Designsystemet-tokens
  (kun webapp-typen).
- `references/fallgruver.md` — fallgruver og mønstre som beviselig virker, fra
  prosjektene som formet denne arbeidsflyten.
