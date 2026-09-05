# TODO — utenfor gjeldende fase

## MVP-frys 2026-08-19 (kveld) — les dette først

**Beslutning (BK):** pakken fryses og testes på et par kollegaer. Ikke bygg mer
før testen er gjort. Nesten alt under denne linjen er vedlikeholderklasse og
blokkerer ikke testen — `TODO.md` (535 linjer) + `plan.md` (605) er utredning,
mens pakken alt er testbar. «Helhetsvurdering»-spørsmålet lenger ned besvares
av to reelle brukere, ikke av mer analyse.

## Token-vekten i rutineskillene (BK-bestilt 2026-08-30, bevisst unntak fra frysen)

**Målingen:** Usage-avlesning 2026-08-30 på `VPC-5CG3433WMH` (hjemmekontor,
siste 24 t, omtrentlig, radene er uavhengige egenskaper — ikke et regnskap):
`fase-slutt` 11 % av forbruket, `fase-start` 7 %, pluginen faseflyt samlet 20 %,
75 % av forbruket over 150k kontekst. Lite og atypisk utvalg — døgnet besto i
stor grad av én økt som leste to testrepoer.

**Gjort i 0.5.12 (samme dag):** `model: sonnet` på begge rutineskillene, og
`fase-slutt` samler turene (steg 6-søkene som parallelle kall i samme melding,
filskrivingene i steg 1–3 samlet). Se CHANGELOG.

**Åpne poster:**

- **Hypotese: fase-start på 7 % skyldes at planfiler ikke har størrelsesgrense**
  slik STATUS har (~30 linjer). Avgjøres av: les forbruket til én konkret
  fase-start-økt (Usage rett før og etter øktstart) før noe endres i skillen.
- ~~**Effekten av 0.5.12 er umålt.**~~ **Delvis avgjort 2026-09-05** (øktlogg,
  ikke Usage): `model: sonnet` virker bare når brukeren skriver kommandoen
  selv, og faseslutt tar ~3,5 min uansett modell — se «Hold kunnskapsfilene
  edruelige» under. Gjenstår kun Usage-tall for kommandoformen over flere økter.
- **Alternativ hvis turene i steg 6 ikke monner:** sikkerhetssjekken som skript
  i prosjektmalen (à la `.github/renhet/sjekk.sh`) — større mal-endring, gir én
  stabil kommando som kan allowlistes én gang per prosjekt.

## Hold kunnskapsfilene edruelige (BK-bestilt 2026-09-05, gjøres i neste fase)

**Bekymringen (BK):** læring, status og plan blir svært lange, og opplegget blir
for tungt og komplekst i forhold til det det skal oppnå.

**Målingen** (2026-09-05, `VPC-5CG3433WMH`, `wc -l`):

| Fil | Dette repoet | `klengenavn` (ferskt testprosjekt) |
|---|---|---|
| STATUS.md | 58 | 45 |
| plan.md | 628 | 124 |
| logg.md | 2661 | 76 |
| laering.md | 1535 | 44 |
| CLAUDE.md | 71 | 90 |

Dette repoet er unntaket (pakkens eget verksted, tre uker metaarbeid). Det som
peker på reell tyngde uavhengig av det:

- STATUS-malen bryter sin egen «maks ~30»-grense fra dag én (klengenavn 45 etter
  én–to faser). Vekstpunktet er «Det en ny økt må vite», som blir en andre
  `CLAUDE.md`: her står minst fire av tolv punkter *også* i repoets `CLAUDE.md`
  (manifest-bump, sjekk.sh etter `git add`, målinger dateres, `commit -F`), og
  `commit -F` i tillegg i den globale — tre kopier.
- `CLAUDE.md` er tyngst i det ferskeste prosjektet (90 mot 71). Det er alt
  `nytt-prosjekt` installerer på forhånd, og den fila lastes hver tur.
- Observert samme dag: `fase-start` leste hele planen (628 linjer) selv om
  skillen sier «over ~150: grep og les selektivt». Regelen som prosa ble ikke
  fulgt.

Ikke et problem: `logg.md`/`laering.md` er arkiver og skal vokse — de koster bare
om de leses helt (fortsatt umålt om `limit` brukes, se STATUS).

**Fire grep, i prioritert rekkefølge — nummer to er den eneste som stopper vekst:**

1. **Tall, ikke «ca.».** `fase-slutt` teller linjer i STATUS; over 30 må den kutte
   før commit.
2. **Én adresse per regel.** Et punkt bor i STATUS *eller* prosjektets
   `CLAUDE.md`, aldri begge. Promoteres et punkt, slettes det fra STATUS i samme
   runde.
3. **Ferdige faser kollapser i planen** til én linje («Fase 1 ✅ dato, detaljer i
   logg»), så planen holder seg rundt 100–150 linjer.
4. **README sier hvem pakken er for:** bruk `/nytt-prosjekt` når prosjektet skal
   overleve `/clear` minst én gang; et script på én ettermiddag trenger ikke
   læringssløyfen.

**Avgjøres av:** STATUS-lengden i `klengenavn` etter fase 2–4 (vokser den fra 45,
og med hva?), rapportert tilbake per fase. Henger sammen med hypotesen om
planfiler uten størrelsesgrense under «Token-vekten» over.

**Tre pakkeendringer avgjort samme dag (BK), etter lesing av klengenavns
`kunnskap/` og `CLAUDE.md`. Gjøres i neste fase:**

- **Encoding-snutten: to linjer i `CLAUDE.md`, uansett maskin.** Observert i
  `klengenavn`: loggen fra prosjektstart sier «encoding-regelen står i STATUS»;
  etter faseslutt fase 0 peker STATUS til «`laering.md`/tidligere
  STATUS-versjoner», og verken `laering.md` (44 linjer, lest) eller `CLAUDE.md`
  har regelen. Den lever bare i git-historikken. Rettelsen: `nytt-prosjekt`
  skriver snutten til `CLAUDE.md` *også* på Mac, formulert «Jobber du på
  Windows: bruk Read/Write/Edit for filinnhold, ikke PowerShell; må du, legg på
  `-Encoding utf8`» — et Mac-prosjekt klones av en Windows-kollega. Fella
  gjelder kun PowerShell 5.1 `Get-Content`/`Set-Content`; Claude Codes egne
  filverktøy er UTF-8-sikre.
- **Ordlekkasje: kontrollsøk i `fase-slutt`, ikke ny regel.** Observert:
  «skaffolding» står uforklart i klengenavns STATUS, `laering.md` og logg, selv
  om prosjektets `CLAUDE.md` har prinsippet «fagord forklares i samme setning».
  Ordet ble skrevet av `fase-slutt`. Rettelsen: `fase-slutt` søker i det den
  nettopp skrev (STATUS, `laering.md`, loggen) etter en kort liste ord som er
  *observert* lekket (skaffolding, scaffolde, trigge, probe, harness); treff
  rettes før commit. Lista bor i skillen og vokser bare med observerte ord.
- **Tredje utfall i ratchet-en: «ikke aktuelt lenger → flytt og stryk».**
  Observert: `[skaffold-overskriver-gitignore]` i klengenavns STATUS gjelder
  bare når `sv create` kjøres i en ikke-tom mappe — aldri igjen i det
  prosjektet, så neste `fase-slutt` kan verken si «fulgt» eller «ikke fulgt».
  Skillen kjenner bare «innarbeidet» og «gjentar seg».
  **Rettet samme kveld etter faseslutt fase 1 i klengenavn:** skillen
  improviserte et tredje utfall selv («ikke aktuelt: ingen skaffolding denne
  økten, og ingen gjenstående fase skaffolder. Strykes; loggen for fase 0 har
  detaljene»). Å gjøre utfallet eksplisitt i skillen er fortsatt riktig, men
  lavt prioritert — det virket uten. Og selve fella er ALT i pakken:
  web-prototype 0.1.3 (CHANGELOG 2026-09-05) krever at `.gitignore` leses før
  og flettes etter `sv create`, og dekker også `svelte.config.js`-driften.
  Ingenting å flytte.
  **Hypotesen «issue-steget fyrer ikke» er avkreftet:** faseslutt fase 1
  tilbød issue for `[oppskrift-versjonsdrift]`, med løfte om at teksten vises
  først og bare beskriver oppskriften. Men funnet var alt rettet i 0.1.3, og
  skillen kan ikke vite det (org-repoet leses ikke fra prosjektøkter — koster en
  godkjenning per bruker). Akseptert grense; BK avslår issuet. Ikke tilbudt ved
  fase 0-faseslutten, der funnet oppsto — bare når punktet ble strøket.
- **STATUS i klengenavn etter faseslutt fase 1: 47 linjer (var 45).** Tre
  punkter strøket, to nye, og fila vokste likevel. Observert (fila lest
  2026-09-05):
  - `[plan-peker-på-fil-som-ikke-finnes]` er en *oppgave* («rett planen»),
    ikke en arbeidsmåte, og står nå både under «Arbeidsmåte» og i `laering.md`.
    `svelte.config.js`-faktumet står dermed på fem steder (STATUS ×2, laering,
    arkitektur, logg). Feil adresse er vekstmekanismen.
  - Encoding-pekeren («fellene står i `laering.md`») ble båret videre uendret
    selv om `laering.md` ikke inneholder dem. En peker ingen sjekker råtner
    stille — argument for at `fase-slutt` verifiserer pekere i «må vite».
  - Verktøyversjoner (Node/npm/git/gh) står i STATUS; de hører i loggen.
- **Tid og modell ved faseslutt:** BK målte ~3 min for `fase-slutt` fase 1 på
  Fable 5.1 (`VPC-5CG3433WMH`, 2026-09-05), og så Fable i indikatoren hele
  veien selv om skillen har `model: sonnet` i frontmatteret. BKs krav: maks ett
  minutt. Dokumentasjonen (code.claude.com/docs/en/skills, lest 2026-09-05 via
  claude-code-guide) sier: for en skill som lastes inn i samtalen gjelder
  `model:` «for resten av gjeldende tur»; øktmodellen gjenopptas ved neste
  prompt. En faseslutt er én tur, så alt i den *skal* ha kjørt på Sonnet — hvis
  ikke `availableModels` i oppsettet sperrer Sonnet, for da ignoreres feltet
  stille.
  **Avgjort samme kveld ved å lese øktloggen** (`~/.claude/projects/<mappe>/
  8738fdc5….jsonl`, som noterer `model` og `usage` per melding — `/usage` gir
  bare plan-prosent, og dokumentasjonen har ingen per-modell-visning for
  abonnement). Observert 2026-09-05, `VPC-5CG3433WMH`, klengenavn fase 1:
  | Del | Kalt som | Modell i alle API-kall | Kall | Output-tokens | Cache lest | Tid |
  |---|---|---|---|---|---|---|
  | fase-start | `/faseflyt:fase-start` (kommando) | **Sonnet 5** | 3 | 3 981 | 111 k | 07:48–07:59 UTC, inkl. ~10 min venting på godkjenninger |
  | implementering | «klar» | Fable 5.1 | 5 | 9 934 | 274 k | 3 min |
  | fase-slutt | «Kjør faseslutt.» (vanlig tekst → Fable kalte `Skill`-verktøyet) | **Fable 5.1** | 9 | 11 489 | 785 k | 3 min 41 s |
  `Skill`-verktøyets svar noterte `model: sonnet`, men alle ni API-kallene
  etterpå gikk på Fable. **Funn:** `model:` i frontmatter virker når brukeren
  skriver kommandoen selv; det virket ikke når skillen ble startet via
  `Skill`-verktøyet fra en trigger-frase. Indikatoren i VS Code var riktig.
  **Bekreftet samme dag, fase 2** (øktlogg `22ea9fde….jsonl`): BK satte
  `/model opus[1m]` kl. 08:49:15 og skrev `/faseflyt:fase-slutt` kl. 08:49:18
  → alle 12 API-kallene i faseslutten gikk på **Sonnet 5**, og økten falt
  tilbake til Opus etterpå. To målinger, motsatt fortegn, samme konklusjon.
  Konsekvens for pakken: `hjelp`/README/fase-start må si at kommandoformen er
  den som gir Sonnet, ikke ordet «faseslutt». 0.5.12-effekten gjelder bare
  kommandoform.
  | Del (fase 2) | Modell | Kall | Output-tokens | Tid |
  |---|---|---|---|---|
  | fase-start | Sonnet 5 | 6 | ≈ 4,8 k | 55 s (ingen godkjenningsventing denne gangen) |
  | implementering | Sonnet 5 | 27 | ≈ 19,5 k | 5 min 22 s |
  | fase-slutt | Sonnet 5 | 12 | ≈ 12,2 k | **3 min 39 s** |
  **Modellen er ikke tidsdriveren.** Faseslutt på Fable (fase 1): 9 kall,
  11,5 k output, 3 min 41 s. På Sonnet (fase 2): 12 kall, 12,2 k output,
  3 min 39 s. Samme tid. BKs krav på maks ett minutt krever færre rundturer
  og mindre skriving, ikke annen modell. Ett konkret sluk i loggen: 51 s
  venting på ett verktøykall (08:50:01–08:50:52), etter alt å dømme
  `npm run check` i steg 5 — som alt hadde kjørt grønt kl. 08:43 i samme økt,
  etter siste kodeendring. Forslag: steg 5 hopper over sjekken når den kjørte
  grønt i samme økt etter siste endring i kodefiler, og sier det i loggen i
  stedet. Resten er 12 rundturer à 10–25 s tenking + skriving; de tre
  filskrivingene er fortsatt separate kall tross 0.5.12.
- **Sikkerhetssjekken forurenser sitt eget neste søk.** Observert fase 2:
  søk etter `client_secret` ga 1 treff — loggens egen setning om forrige
  faseslutts søk. Skillen skriver søkeordet i loggen, og finner det igjen
  neste gang. Rettelsen: loggen omtaler søket uten å sitere ordet («søk etter
  nøkkelord for hemmeligheter»), eller steg 6 utelater `kunnskap/logg.md` og
  `laering.md` fra søket. Det første er enklest og holder loggen lesbar.
- **STATUS i klengenavn etter fase 2: 43 linjer** (45 → 47 → 43). Ratchet-en
  strøk to som innarbeidet, med belegg («kjørte mengdesjekk over 3840»,
  «rettet plan.md og TODO.md»), og skrev to nye prosjekttekniske punkter.
  Issue til pakken vurdert og riktig avslått («ikke aktuelt» — begge gjelder
  prosjektet). Fortsatt med: encoding-pekeren til innhold som ikke finnes
  (tredje faseslutt på rad, ingen sjekket den) og verktøyversjonene.
  **Etter fase 3: 44 linjer** (45 → 47 → 43 → 44). Encoding-pekeren er
  endelig borte, uten at noen ba om det. Ett strøket, ett videreført, to nye.
  Faseslutt ~3 min igjen (BK), tredje måling på rad uavhengig av modell.
  - **Ratchet-en er inkonsekvent på «ikke utløst»:** fase 1 strøk
    gitignore-punktet som ikke var aktuelt («ingen gjenstående fase
    skaffolder»); fase 3 videreførte `[node-mengdesjekk-importsti]` som
    «ikke utløst — videreført uprøvd (2. runde)». Samme situasjon, motsatt
    utfall. Det tredje utfallet må stå i skillen med regel: ikke utløst og
    ingen gjenstående fase kan utløse det → stryk med peker til loggen; kan
    utløses senere → videreføres uten å telle runde (det er ikke en
    gjentakelse). Prioriteten opp fra «lav».
  - Oppsummeringen sa «satt som verifiseringspunkt for fase 4» om
    clipboard-feilveien, men planens fase 4 er uendret; punktet bor bare i
    STATUS/laering. Planendring skal i `plan.md` etter prosjektets egen regel.
  - `client_secret`-forurensningen slo inn for andre gang, nå gjenkjent som
    «omtalen av selve søket i loggen». Koster en vurdering hver gang;
    rettelsen over står.
  - **Sikkerhetssjekken fant en reell sak:** `.claude/settings.json` hadde
    fått en absolutt brukersti fra en permission-godkjenning. BK fjernet
    linjene, committet. Steg 6 tjente inn seg selv — og fase-start-teksten om
    «kjent falsk positiv» bør nevne at samme fil også kan bære en ekte lekkasje.
- **«Claude verifiserer selv» kom tilbake i fase 4 — som en installasjon.**
  Observert av BK 2026-09-05: Claude ba om `npx playwright install chromium`
  for å sjekke layout på smal skjerm. `[bruker-verifiserer-ikke-claude]` var
  strøket som innarbeidet etter fase 1 (fulgt én gang, i en fase uten
  utseende å se på). Planens fase 4-verifisering er brukerens (`npm run
  preview`, mobil/smalt vindu), og prosjektets `CLAUDE.md` sier «verifisere =
  at DU ser det». Verken punktet, regelen eller planteksten stoppet impulsen
  når fasen inviterte til den. BK: «Spent på hva sikkerhet kommer til å ringe
  om når Defender har tygd loggene mine» — styrt jobb-PC, nedlasting av en
  nettleserbinær til brukerprofilen er nettopp det EDR flagger.
  Konsekvens for pakken, to ting: (1) regelen hører i CLAUDE.md-avsnittet
  `nytt-prosjekt` installerer, som forbud og ikke definisjon: «Claude
  installerer aldri verktøy for å se resultatet selv — nettlesere,
  skjermbilde-verktøy, `playwright`, `chromium-cli`. Verifiseringen er
  brukerens.» (2) ratchet-en: et atferdspunkt som er «fulgt» i én fase der
  situasjonen ikke oppsto, er ikke innarbeidet. Samme mangel som «ikke
  utløst»-utfallet over, sett fra motsatt side.
  **Samme dag, senere: det ble installert.** BK: «Sonnet er kreativ, og det
  ble installert.» Chromium lastet ned til `%LOCALAPPDATA%\ms-playwright`,
  Defender flagget kjøringen. Regelen i `CLAUDE.md` («verifisere = at DU ser
  det») stoppet det ikke — samme funn som retrospektivet fra fint-samtykke:
  bare regler Claude Code selv håndhever holder. **Konsekvens (3), viktigst:**
  `nytt-prosjekt` sin `settings.json`-mal får deny-regler mot å installere
  nettlesere/automasjon, uavhengig av prosjekttype og persondata:
  `Bash(npx playwright install*)`, `Bash(npx playwright *)`,
  `Bash(npx puppeteer*)`, `Bash(npm install*playwright*)`,
  `Bash(npm install*puppeteer*)` — med samme ærlighet som deny-settet ellers:
  mønstre kan omgås, så regelen i CLAUDE.md står i tillegg. Opprydding i
  klengenavn: `npx playwright uninstall`, `npm uninstall playwright
  @playwright/test`, sjekk `package.json`/lock og ev. `playwright.config.ts`
  før neste commit. BK melder selv til sikkerhet. Stoppet og avinstallert av
  BK samme dag.
- **web-prototype: skillen sier ikke at Designsystemet skalerer selv.**
  Observert av BK 2026-09-05, klengenavn fase 4: Sonnet «skjønte ikke at
  designsystemet har skalering innebygd» og gikk løs på mobil-layout som noe
  som måtte bygges og testes — det var det som ledet til Playwright. Rettelse
  i `web-prototype`: én setning om at komponentene og typografien er
  responsive ut av boksen, og at en «mobil/finpuss»-fase er brukerens sjekk i
  et smalt vindu, ikke egne media queries eller testverktøy. Samme sak i
  plan-malen i `nytt-prosjekt`: fasebeskrivelser som «layouten sjekkes på smal
  skjerm» leses som en oppgave for Claude; skriv «du ser at …». Observasjon,
  ikke konklusjon: to feilvurderinger i én fase på Sonnet (installasjon,
  skalering) — begge krevde kjennskap til biblioteket, ikke mekanikk.
- **Tørrkjøringen av klengenavn er fullført (fase 0–4, 2026-09-04/05).
  Sluttmåling STATUS: 45 → 47 → 43 → 44 → 42.** Flat rundt 44 over fem
  faseslutt. Vekstfrykten slo ikke til; målet «maks ~30» ble aldri nådd
  heller, og kan ikke nås med malens faste deler (topp + Neste + verifisering
  + 2–3 punkter + 4–5 «må vite» ≈ 40). Enten kuttes malen (verktøyversjoner
  ut, «må vite» maks 3) eller taket settes ærlig til 45 og telles der.
  Tyngden ligger et annet sted: `CLAUDE.md` på 90 linjer i hver tur,
  faseslutt på 3 min uavhengig av modell, fase-start-utdata på ~15 linjer.
  - **Ratchet-en foreslo å promotere et punkt som aldri ble prøvd.**
    `[node-mengdesjekk-importsti]` nådde «3. runde» uten å bli utløst én gang,
    og fase-slutt foreslo CLAUDE.md-regel; BK: «ikke nå». Tellingen regner
    «videreført uprøvd» som gjentakelse. Det er feil: bare et punkt som ble
    *brutt* igjen teller. Bekrefter «tredje utfall»-punktet over, nå med
    konsekvens (en permanent regel nesten skrevet på null belegg).
  - **Issue-kriteriet er for smalt.** Faseslutt fase 4: «ikke aktuelt —
    Playwright-forsøket kom fra en generell run-skill, ikke fra
    faseflyt/web-prototype/nytt-prosjekt». Riktig om *hvor feilen kom fra*,
    galt om *hvor vernet hører hjemme*: deny-regelen i `nytt-prosjekt` sin mal
    er pakkens sak. Kriteriet «navngir en skill eller sier en instruks var
    feil» må utvides med «kan pakken beskytte mot dette i neste prosjekt?».
    Sonnets egen læringslogg identifiserte riktignok opphavet presist
    (`run`-skillens nettleser-fallback) og koblet det til fase 0-punktet.
  - `npm audit` med exit 1 håndtert riktig: ingen `--force`, akseptert med
    begrunnelse, planens krav stående uinnfridd og forklart.
  - Planen ferdig → STATUS sier «ingen ny fase uten at brukeren ber om det,
    foreslå TODO.md eller ny plan». Riktig avslutning; scope-vakten i
    STATUS-form.
- **Modell-linja i `fase-start` flyttes sist og blir en instruks.** Observert
  av BK 2026-09-05 (`VPC-5CG3433WMH`, klengenavn fase 1): `model: sonnet` i
  frontmatteret gjaldt bare mens skillen leste; økten falt tilbake til Fable
  5.1 da skillen var ferdig, og hele implementeringen kjørte der selv om
  oppsummeringen anbefalte Sonnet. Linja sto midt i oppsummeringen og ble
  ikke handlet på. Besparelsen for fasen var null. Lukker STATUS-posten
  «umålt: at `/model sonnet` virker» — den virker, for lesedelen alene.
  Rettelsen: linja står sist, rett før «venter på klarsignal», formulert som
  instruks: «Skriv `/model sonnet` før du gir klarsignal.» Skillen kan fortsatt
  ikke bytte selv. **Og den skal ikke påstå hva økten kjører på:** fase-start
  før fase 3 (2026-09-05) skrev «passer for Sonnet, som jeg allerede kjører
  som» — sant for skillens egen tur, men økten sto på `opus[1m]` fra forrige
  faseslutt. Systemmeldingen under skillturen sier «Sonnet», så skillen kan
  ikke vite øktmodellen; en ubetinget instruks er eneste form som ikke kan
  lyve. Bekreftet av BK samme dag: økten spratt tilbake til Opus.
  **BK-feedback 2026-09-05 på fase-start-utdataen:** «Det bør være veldig
  tydelig at det er en anbefaling om å bytte modell, nå drukner den i masse
  tekst. Det er fortsatt litt mye tekst i responsen.» Utdataen for fase 3 var
  ~15 linjer i det rene tilfellet: fasebeskrivelsen fra STATUS gjengitt i sin
  helhet, verifisering, modell-linje midt i, én STATUS-påminnelse, to
  kvitteringer, avslutning. Forslag: (1) fasebeskrivelsen til én linje —
  planen har resten; (2) modell-instruksen alene på siste linje, uthevet, som
  handling («**Skriv `/model sonnet` nå, før du gir klarsignal.**»); (3) tak på
  ~10 linjer for det rene tilfellet, målt i neste tørrkjøring. Samme økt, motsatt fortegn: fase-slutt-vakten i
  klengenavns `CLAUDE.md` (skjerpet ordlyd) foreslo faseslutt og ventet
  eksplisitt — første måling der den holdt.

## ~~VURDERINGSPUNKT — installasjon skal ikke overskrive noe~~ — LUKKET 2026-08-21

Alle fire spørsmålene besluttet av BK og implementert i faseflyt **0.2.3**
(`156dd94`): pakken eier kun sine to nøkler i `.claude/settings.json`
(`extraKnownMarketplaces.claude-code-skills` + `enabledPlugins`-oppføringene
`@claude-code-skills`), eksisterende fil flettes med før/etter-visning +
klarsignal + målbar etterkontroll, malen er merket som mal for ny fil, deny-settet
er tillegg — aldri erstatning, og steg 7 utvider eksisterende `.gitignore` i
stedet for å overskrive. Detaljer: logg 2026-08-21 (kveld), CHANGELOG 0.2.3.
Samme runde: **versjonssjekk som steg 0** i `fase-start`/`nytt-prosjekt` (BKs
bestilling), etter funnet at en kjørende prosess beholder versjonen den startet
med. *Denne seksjonen var 60 linjer utredning; funnene bor nå i skill-teksten,
loggen og CHANGELOG.* **Køen bak punktet er dermed åpen** — de to pakkefiksene og
klarspråktabell-speilingen venter kun på BK-klarsignal.

## ~~VURDERINGSPUNKT — ordlyd i artefakten og oppgavene~~ — GJENNOMFØRT 2026-08-21

BK gikk gjennom hele websiden med divergert målgruppe som fokus; 13 forslag
godkjent og utført (se logg 2026-08-21). Ark/`.docx` ble droppet samme dag, så
websiden var eneste gjenværende kanal. **To rester, ikke lukket:**

- **Designspor-spørsmålet er fortsatt ubesvart:** skal «Vil dere dele dere?»-sporet
  inn på websiden, eller holder siden seg til hoveddelen?
- ~~**Klarspråktabell-speiling i pakken**~~ — **GJORT 2026-08-21 (sent kveld)**
  i faseflyt 0.2.4 (`4d86520`): radene `økt`/`fasestart`/`sikkerhetssjekk` inn,
  `fase` utvidet, websidens rekkefølge. Merk: TODO navnga tre rader, mekanisk
  sammenligning mot websiden fant fire (`økt`).

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
- **Case til tørrkjøringen: 5, Utstyrsskapet** *(nummer per renummereringen
  2026-08-21 — Snoozeloggen er kuttet)*. Den er unionen av liste/detalj/utlån til
  navngitte (Donald Pocket), datoberegnet status (Plantevakta) og markering
  (Hittegodset) — går den gjennom på 3–4 faser, går resten. Reserve hvis tiden er
  kort: **1, Donald Pocket** (enklest verifisering, men den ene uten datologikk).
- **Ikke start med 4, Vaffelvakta.** Rotasjon + bytte er der en gruppe lettest
  bruker opp økta på domenelogikk framfor på arbeidsflyten. «Ferier og fridager»
  ble kuttet fra bestillingen 2026-08-21, som anbefalt her.
- **Tre påstander arket hviler på, som pakken ikke har målt** — står som egen
  seksjon på fasilitatorarket: at «nytt prosjekt» trigger av seg selv (høyest
  risiko: slår den ikke inn, står gruppa fast på minutt null), at `web-prototype`
  trigger av seg selv for webapp-typen (den typen er umålt i STATUS), og at
  designsporets mekanikk (`list_projects`, `projectId`, token-overstyring i
  `app.css`) finnes i `claude-design-oppskrift.md` og ikke bare i fasilitatorens
  hode.
- **~~Før tørrkjøringen: verifiser at installert pakke er identisk med repoet~~**
  — **LUKKET for `VPC-8WD9VC4` 2026-08-28.** Målingen er tre ledd
  (`marketplace update` → omstart → mål om), og linjeskift må normaliseres
  (cache CRLF, repo LF) eller byte-sammenligning gir falske avvik. Belegg:
  `logg.md` 2026-08-20 (hjemme-PC, 0.2.1 — cachen *var* foreldet, 9 avvik),
  2026-08-24 (0.4.0, 11 filer, 0 avvik), 2026-08-27 sent kveld (ARM, tre ledd)
  og 2026-08-28 (ARM, innhold fil-for-fil, 11 filer, 0 avvik). Gjelder én maskin
  om gangen: skjer tørrkjøringen på en annen, må den gjøres om der.
- **Tørrkjøringen skal skje i en blank økt i en tom mappe utenfor dette repoet.**
  En økt som har lest `plan.md`/`TODO.md` kjenner pakkens svake punkter og måler
  derfor seg selv med fasit i hånda.
- **Språkvasket 2026-08-20** etter at en ikke-teknisk kollega ikke fikk noe ut av
  oppgavene. Funnet var at bestillingene virket, mens *det felles arket* rundt dem
  ikke var lesbart — og «Vi mocker alt som ligner på database i enkle filer» sto
  som siste setning i alle seks bestillingene. Ark 2 har nå en ordliste. Se
  pakkefunnet under «Helhetsvurdering» — klarspråktabellen dekker feil ordklasse.
  **Å se etter under tørrkjøringen:** blir ordlisten brukt, eller spør deltakerne
  om ordene likevel?

**Beslutning (BK, 2026-08-21): kun artefakten (websiden) deles — arket og
`.docx`-en er droppet.** `kunnskap/lokalt/oppgavelapper.md`, `build-docx.ps1` og
begge `.docx`-ene er **slettet** samme dag på BKs ordre; originalunderlaget ligger
i git-historikken fram til `cd50841`. Kilden til websiden er
`kunnskap/lokalt/ki-samling-oppgaver.html` (omdøpt fra `vaffelvakta.html` samme
dag) — eneste fil igjen i `lokalt/`. Samme runde:
Snoozeloggen kuttet helt, oppgavene renummerert 1–5, «web-løsning» → «nettside»,
og hele klarspråkrunden 2026-08-21 er inne på websiden. De to kopiene som nå skal
holdes like er **websiden og sitatet under** — sitatet er tracket og finnes derfor
på alle maskiner, det er alt tørrkjøringen trenger:

> **Oppgave 5 — Utstyrsskapet.** Lag en nettside for utstyret på huset:
> projektorer, kameraer, ladere og høyttalere. Oversikt over hva som finnes, hva
> som er ute og hva som er ledig. Det skal være mulig å registrere utlån til
> Mikkel Rev, Sattosk Rev eller Lita Tavle, med forventet retur. Utstyr som er
> over tiden skal vises tydelig. Vi bruker ingen ekte database — det som skal
> lagres, legger vi i noen enkle filer med oppdiktet innhold.
>
> *Uavklart, som gruppa svarer på selv:* Hva betyr «over tiden», og hvem er det
> som skal se det? Kan samme gjenstand lånes ut to ganger samtidig — og hva
> hindrer i så fall det?
>
> *Rammer:* ingen ekte database (enkle filer med oppdiktet innhold), ingen
> backend, ingen ekte bilder (fargede felt, enkle strektegninger eller emoji),
> norsk tekst, prototype. Ingen fase er ferdig før noen har sett den virke i
> nettleseren. Svar i oppsettet: type = webapp/prototype, persondata = nei,
> FINT = nei. Sikt på 3–4 faser.

*Ordlyden over er avstemt ordrett mot websiden 2026-08-21. Endres den ene,
endres begge i samme runde.*

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
i chatten framfor en handling. *(For dette repoet løst 2026-08-21: `CLAUDE.md`
opprettet i `f1b4a68` og promoteringen landet der. Skjevheten i skillen —
hva `fase-slutt` skal gjøre når fila mangler — står fortsatt åpen.)* Ikke ført som issue: dette *er* pakkerepoet, og
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
- **Kontor-PC-en (Snapdragon/ARM): pluginene er på plass, resten av pre-flighten
  er uverifisert.** Observert 2026-08-26 på `VPC-8WD9VC4` (Snapdragon X Elite):
  alle tre ligger i `plugins/cache/` i gjeldende versjoner — `faseflyt` 0.5.10
  (per 2026-08-27; sto på 0.5.9 da punktet ble skrevet),
  `fint-graphql` 0.1.0, `web-prototype` 0.1.2 — marketplace-klonen finnes, og
  skillen kjørte. Punktet sa tidligere «har fortsatt gammelt oppsett»; det
  stemmer ikke lenger.
  **Umålt, og skal stå som umålt:** om `git -C ~/.claude pull` faktisk ble kjørt,
  om de gamle kopiene som ellers skygger for plugin-versjonen er borte, og om de
  tre er installert user scope. Rekkefølgen som skulle følges var
  `git -C ~/.claude pull` FØRST, deretter `/plugin marketplace add` + installer
  de tre user scope.
  **Noter underveis — dette ER ARM-pre-flighten** for samlingen; den er
  påbegynt, ikke gjennomført. Første måling gjort på maskinen ga funnet om at
  `.claude/settings.json` er inert — se `logg.md` 2026-08-26.

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

**Første eksterne datapunkt (2026-08-20, ikke analyse):** en ikke-teknisk kollega
leste samlingsarket og skjønte ikke oppgavene i det hele tatt. Arket er
språkvasket, men funnet under er et pakkefunn, ikke et arkfunn:

- **Klarspråktabellen dekker feil ordklasse.** De åtte radene i
  `nytt-prosjekt/SKILL.md` er alle *maintainer*-ord — `scaffolde`, `harness-en`,
  `probe`, `røyktest`, `positiv kontroll`. Ingen av ordene som faktisk stoppet
  henne står der: **skill, fase, fase 0, planmodus, grilling, faseslutt,
  `/clear`, mock**. Det er ordene arbeidsflyten *består av*, og de møter hver
  bruker i første økt — mens ordene i tabellen dukker opp når Claude snakker om
  seg selv.
- Tabellen er dermed bevist utilstrekkelig for målgruppen pakken sier den er for.
  Regelen bak den («fagord bare hvis du forklarer det i samme setning») holder;
  det er dekningen som er feil.
- **Kandidat, ikke gjort:** utvid tabellen med arbeidsflytordene, og gi hvert av
  dem en hverdagsforklaring framfor et synonym — `fase` har ikke noe synonym, den
  trenger en setning. Ordlisten på Ark 2 i `kunnskap/lokalt/oppgavelapper.md` er et
  førsteutkast på nøyaktig de forklaringene og kan høstes derfra.
- **Verdt å merke:** arket ble skrevet av denne arbeidsflyten, av maintaineren, og
  brøt maintainerens egen klarspråkregel på sju ord. Det er samme strukturfeil som
  er betalt for tre ganger før (deny-regler, rytmevakter, modellmiks): en regel som
  skal virke alltid, må ligge der den alltid leses — og den må dekke de ordene som
  faktisk brukes.

**Årsakskjeden er belagt (2026-08-20), og den peker på plassering, ikke slurv:**
arket ble skrevet av en økt i *dette* repoet. Dette repoet har ingen `CLAUDE.md`.
Klarspråkregelen bor bare i `nytt-prosjekt/SKILL.md`, som lastes kun når noen
kjører `/nytt-prosjekt`. En økt som skriver samlingsmateriale laster den aldri.
Regelen var altså til stede i pakken og fraværende i arbeidet. Sjekket samtidig:
CLAUDE.md-malen i `maler.md` har `Fase-arbeidsflyt`, rytmevaktene,
`Kunnskapsfangst` og `Skills` — **ingen språkregel i det hele tatt**.

**~~To fikser er utformet, men IKKE gjort~~ — BEGGE GJORT 2026-08-21 (sent
kveld) på BK-klarsignal: repo-CLAUDE.md i `f1b4a68`, språkregelen i
CLAUDE.md-malen i faseflyt 0.2.4 (`4d86520`). Historikken under står som
begrunnelse:**

**Presisert 2026-08-25 (natt): fiks 1 var halvferdig.** `CLAUDE.md` ble
opprettet, men språkregelen sto der som en *henvisning* til
`nytt-prosjekt/SKILL.md` — en fil som ikke lastes i en vedlikeholdsøkt, så
regelen var til stede i repoet og fraværende i arbeidet på nøyaktig samme måte
som før fiksen. Reglene står nå som tekst i `CLAUDE.md`, og dekker også chatten
og den korte teksten som følger hvert verktøykall. Se `logg.md` 2026-08-25 (natt)
og CHANGELOG 0.5.7.

1. **Dette repoet får en `CLAUDE.md`.** Innholdet finnes alt, spredt i STATUS' «det
   en ny økt må vite»: renhetsporten, ordrett-kravet, `git commit -F`, daterte
   målinger, klarspråk, `kunnskap/lokalt/`. Løser samtidig at læringssløyfens
   trestegs-promotering ikke har noe sted å lande (se skjevheten lenger ned).
   *Målt som null risiko for kollegaer:* hele repoet klones ved
   `/plugin marketplace add`, så fila havner hos dem — men under
   `~/.claude/plugins/marketplaces/`, utenfor alle prosjekttrær, så den aktiveres
   aldri i deres økter. Den blir distribuert tekst, så renhetsreglene gjelder den.
2. **Kondensert språkregel inn i CLAUDE.md-malen.** Delelinjen er prinsipiell:
   ordene som dukker opp i *hver* økt (`fase`, `fase 0`, `verifisere`, `faseslutt`,
   `/clear`, `planmodus`) hører i malen; oppsettsordene (`skill`, `grilling`,
   `mock`, `prototype`) blir stående i `nytt-prosjekt`, som er lastet når de
   brukes. Åtte linjer, ikke fjorten — malen er den eneste teksten som lastes i
   hver økt i hvert prosjekt, og derfor den dyreste tomta i pakken.
   *Målt som null risiko for eksisterende prosjekter:* teksten skrives bare ved
   oppsett, og steg 8 legger til framfor å overskrive. Additiv, ikke brytende.

- **Prototyping** er best dekket: `web-prototype` er ferdig teknologivalg, og fase
  0 er alltid oppsett + røyktest. Flaskehalsen er distribusjon, ikke innhold.
  **Målt:** `/plugin` finnes ikke i VS Code-utvidelsen. **Ved design:** faseflyt er
  CLI-only fordi den trenger filsystem og git, så org-katalogen — kanalen en
  ikke-utvikler faktisk møter — er den ene kanalen faseflyt ikke går i.
  **Umålt og skal stå som umålt:** Desktop-appen har filsystem og kunne vært veien
  for denne gruppen; den er aldri testet.
- **Tokeneffektivitet og modellmiks:** modellmiksen er LØST i faseflyt 0.6.1
  (2026-09-04): CLAUDE.md-malen fikk avsnittet «Modellvalg», nytt-prosjekt sier
  det etter godkjent plan, fase-start per fase. Begrunnelsen (en regel som skal
  virke alltid må ligge der den alltid lastes) står i CHANGELOG 0.6.1 og logg
  2026-09-04. Umålt: at `/model sonnet` virker i alle oppsett. **Merk
  motsetningen (fortsatt åpen):** ordrett-kravet fra 0.2.1 koster tokens (observert:
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

**Halvveis besvart 2026-08-25:** «mindre maskineri» fikk et konkret svar i
`faseflyt` 0.5.0 og 0.5.3 — skillene rapporterer avvik framfor gjennomføring, og
selvvurderingen skrives uten å leses opp, uten at noe steg eller noen sjekk ble
fjernet (se `logg.md` 2026-08-25 kveld, CHANGELOG 0.5.0/0.5.3). Svaret kom fra
bruk, ikke fra analyse. **Dataregime-spørsmålet står fortsatt ubesvart**, og de
tre leveransene over er ikke bestilt.
