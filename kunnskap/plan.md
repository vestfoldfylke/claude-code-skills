# Generalisering av faseflyt-skillene for org-deling

## Kontekst

Fire skills — `nytt-prosjekt`, `fase-start`, `fase-slutt`, `grill-me` — ble til
underveis i PoC-en `fint-samtykke` og bærer preg av det. De virker godt for én
bruker på to maskiner, men kan ikke deles med organisasjonen slik de står:

- **FINT-lekkasjer.** `fase-start.md` og `fase-slutt.md` har hardkodede
  FINT-eksempler («Claude henter ALDRI FINT-data selv») midt i det som ellers er
  generiske kommandoer. `nytt-prosjekt` sin `description` nevner `fint-samtykke`.
- **Personlige avhengigheter.** `nytt-prosjekt` beskriver synk via det private
  repoet `bkaarstein/claude-global-config`, og `references/retrospektiv-fint-samtykke.md`
  er et internt retrospektiv med prosjekt- og personnavn.
- **Skjult forutsetning som ikke følger med.** Halve arbeidsflyten (faser,
  verifiseringsport, Explore-delegering, modellmiks) ligger i den globale
  `~/.claude/CLAUDE.md`. Den er ikke engang git-sporet i eget synk-repo, og kan
  per dokumentasjon ikke distribueres via plugin. En kollega som installerer
  skillene får altså bare halve mekanikken.
- **Skjør planpeker.** STATUS peker på `~/.claude/plans/<autogenerert-navn>.md`.
  I `fint-samtykke` peker den i dag på en fil som ikke finnes lenger — `/fase-start`
  ville feilet. `idm-grupper-dokumentasjon` gjør det allerede riktig med
  `kunnskap/plan.md` i repoet.
- **Feil filtype for deling.** `fase-start`/`fase-slutt` er slash-commands i
  `~/.claude/commands/`. Org-katalogen på claude.ai deler *skills*, ikke commands.
- **Uimplementert lærdom.** Retrospektivets Windows/UTF-8-regel («`Get-Content`
  uten `-Encoding` mojibaker æøå») ble aldri lagt inn i malene.
- **Refleksjonen forsvinner.** `/fase-slutt` steg 3 ber om 1–2 selvkritiske punkter,
  men eksplisitt «kun i chatten — ikke i filer». `/clear` sletter dem, `/fase-start`
  ser dem aldri, og samme feil kan gjentas fase etter fase. Selvvurderingen er
  arbeidsflytens eneste forbedringsmekanisme og er i dag den ene delen som ikke
  overlever en økt.
- **Ingen prosjekttype-avklaring.** Malene antar implisitt et webprosjekt.
  DesignSync/`web-prototype` er irrelevant for et PowerShell-script eller en utredning.

De to øvrige skillene i din `~/.claude` — `web-prototype` og `fint-graphql` — har
samme distribusjonsproblem: `web-prototype` er deployet som org-skill i
claude.ai-konsollet, men den deployen når *ikke* Claude Code CLI, så kopien din er
manuell. Begge tas derfor med i pakken.

**Mål:** ett kildeprosjekt som produserer skillene i generalisert, selvbærende
form, distribuert i to kanaler — org-katalogen på claude.ai (Desktop/web) og et
internt plugin-marketplace (Claude Code CLI, der arbeidsflyten faktisk lever).

Arbeidskatalogen `c:\dev\skills-creation` er tom i dag. Siden repoet skal hete
`claude-code-skills`, bygges pakken i `c:\dev\claude-code-skills` slik at lokal
mappe og repo har samme navn — `skills-creation` slettes når det er gjort.

## Avklarte beslutninger

- **Distribusjon:** org-skills *og* plugin-repo, samme kildefiler — men kanalvalg
  per skill: faseflyt-trioen er CLI-only, kun `grill-me`/`fint-graphql`/`web-prototype`
  går også i org-katalogen.
- **Planfil:** `kunnskap/plan.md` i prosjektrepoet er kanonisk.
- **Regelbase:** skillene er selvbærende — ingen kollega må redigere sin `~/.claude/CLAUDE.md`.
- **Innhold:** de fire kjernene + grill-me koblet inn i flyten + Windows/PowerShell-regler
  + `claude-design-oppskrift`. I tillegg `web-prototype` og `fint-graphql` som egne,
  uavhengige plugins i samme marketplace — repoet blir master for web-prototype.
- **Repo:** `vestfoldfylke/claude-code-skills`, privat, branch `main`.
- **Prosjekttyper:** webapp/prototype, script/automatisering, dokumentasjon/utredning,
  API/backend-tjeneste.

## Hva et «plugin marketplace» faktisk er — og hvordan det holdes internt

Ordet er misvisende: det finnes ingen sentral Anthropic-katalog, og ingenting
publiseres noe sted. Et marketplace er *et git-repo med filen
`.claude-plugin/marketplace.json`* som lister hvilke plugins repoet inneholder.
`/plugin marketplace add vestfoldfylke/claude-code-skills` gjør en `git clone` til
kollegaens egen maskin — det er hele mekanismen. Ingen data sendes til Anthropic.

**Tilgangskontrollen er repoets egen.** Ligger repoet `private` eller `internal`
i Vestfold fylkeskommune-organisasjonen på GitHub, kan bare de med repo-tilgang legge det til; det
er ikke søkbart og kan ikke oppdages utenfra. Er repoet `public`, kan derimot
hvem som helst som kjenner URL-en installere det. Derfor, som harde krav:

- Repoet er **`vestfoldfylke/claude-code-skills`**, `private`, med `main` som
  standardbranch — aldri under vedlikeholderens personlige GitHub-konto, aldri `public`.
  Ditt private `bkaarstein/claude-global-config` blir liggende som det er; det er
  din `~/.claude`-synk og skal ikke deles.
- **Branch-hardening: SLÅTT AV for repoet 2026-08-19.** Målt samme dag:
  `repos/…/rules/branches/main` og `repos/…/rulesets` gir begge `[]`, og
  `branches/main` gir `protected: false`. Det opphever den tidligere målingen
  (2026-08-18: org-regelsettet `Hardening`, `enforcement: active`, tomme
  bypass-aktører, 1 godkjenning + `require_last_push_approval`) og notatet om at
  unntak «bevisst ikke er tatt i bruk».
  **Beslutning (BK):** vi opererer alene fram til 1.0. Reviewen var i praksis et
  stempel uten leser, og en port ingen går gjennom er ingen port.
  - **Konsekvensen er reell og ble tatt opp 2026-08-24 (se under):** repoet er en
    instruksjonskanal inn i kollegaers Claude-økter — alt som pushes til `main`
    blir arbeidsinstrukser hos alle som har installert pakken, særlig med sentral
    utrulling/`autoUpdate` — og repoet har ingen automatisk sjekk (ingen
    `package.json`). Uten hardening og uten review finnes det nå **ingen** port.
    Det er akseptabelt så lenge vedlikeholderen er én person som leser sin egen
    diff; det er det ikke når pakken har brukere som ikke gjør det.
  - **Avgjort 2026-08-24 (BK): ingen automatisk port bygges.** Actions er
    droppet for repoet, og pre-push-hook ble vurdert og forkastet: den krever én
    config-kommando per maskin, følger ikke med i klonen, kan omgås med
    `--no-verify`, og ingen kan se fra repoet om den er aktiv hos noen. En port
    ingen kan verifisere er dårligere enn ingen port, fordi den inviterer til å
    tro at sjekken skjedde — samme «formelt på plass, reelt borte»-mønster som er
    navngitt tre ganger ellers i dette prosjektet. Utviklere som vedlikeholder
    pakken vil dessuten pushe fra sitt eget oppsett, der hooken stille ikke er
    satt opp.
    **Porten er derfor manuell og skal forbli det:** regelen i `CLAUDE.md` kjøres
    etter `git add` før hver push, og vedlikeholderen leser sin egen diff. Ønskes
    en ekte port senere, er Actions det riktige laget — den kjører på serveren,
    kan ikke hoppes over, og status er synlig for alle. Spørsmålene til
    utviklerne ligger ferdige i `TODO.md`.
  - **1.0 krever derfor ikke en port.** Ny definisjon: 1.0 = prøvd på samlingen,
    funnene rettet, og fraværet av automatisk sjekk dokumentert.
  - Historisk, ikke gjeldende nå: `require_last_push_approval` gjorde at en push
    etter godkjenning kostet en ekstra review-runde (erfart i PR #2).
  - Skrivetilgang bør uansett begrenses til de som vedlikeholder pakken.
- Kollegaer må være autentisert mot GitHub (`gh auth login`) for at `add` skal
  virke mot et privat repo — og de må være medlem av `vestfoldfylke` på GitHub
  (claude.ai-org-tilgang er ikke det samme). Begge forutsetninger dokumenteres
  i README.
- Ingen kunde-/persondata, secrets eller prosjektnavn i innholdet — pakken er ren
  arbeidsflyt. Dekkes av renhetssjekken i verifiseringen.
- Org-katalogen på claude.ai er allerede avgrenset til din organisasjon, så den
  kanalen har tilsvarende sperre.

**Sentral utrulling (valgfritt, som org-admin):** legges marketplacet inn i
managed settings, får kollegaene skillene uten å kjøre noen kommando selv. Eksakte
nøkkelnavn (`extraKnownMarketplaces`, `enabledPlugins`, evt. `strictKnownMarketplaces`)
verifiseres mot dokumentasjonen i Fase 5 før de skrives inn.

## Kildestruktur

Repoet er både marketplace og plugin-kilde. Skills-mappene er samtidig
opplastingsklare for org-katalogen — derfor må hver skill være **selvbærende**
(ingen kryssreferanser mellom skill-mapper; felles regler dupliseres bevisst der
de trengs).

Repoet er ett marketplace med **tre plugins**, installerbare hver for seg — så
kollegaen som skriver PowerShell-scripts slipper SvelteKit-føringer, og den som
ikke jobber mot FINT slipper FINT-skillen:

```
claude-code-skills/                      # → vestfoldfylke/claude-code-skills, branch main
├── .claude-plugin/marketplace.json      # name: claude-code-skills (samme som repoet)
├── plugins/
│   ├── faseflyt/                        # arbeidsflyt — gjelder alle prosjekttyper
│   │   ├── .claude-plugin/plugin.json
│   │   └── skills/
│   │       ├── nytt-prosjekt/SKILL.md + references/
│   │       ├── fase-start/SKILL.md
│   │       ├── fase-slutt/SKILL.md
│   │       ├── grill-me/SKILL.md
│   │       └── hjelp/SKILL.md          # lagt til 0.3.0, issue #6
│   ├── web-prototype/                   # teknologivalg — kun webapp-prosjekter
│   │   ├── .claude-plugin/plugin.json
│   │   └── skills/web-prototype/SKILL.md + references/components.md
│   └── fint-graphql/                    # domenekunnskap — kun FINT-prosjekter
│       ├── .claude-plugin/plugin.json
│       └── skills/fint-graphql/SKILL.md
├── docs/installasjon.md                 # CLI-plugin + org-opplasting + valgfri CLAUDE.md-snutt
└── README.md
```

Marketplace-navnet i `marketplace.json` settes **likt repo-navnet**
(`claude-code-skills`), så installasjonen blir `faseflyt@claude-code-skills` —
kollegaer skal huske ett navn, ikke tre (repo, marketplace, plugin).

**Merk:** plugin-skills navngis `/faseflyt:fase-start`, ikke `/fase-start`.
Org-opplastede skills beholder sitt eget navn. Nevnes eksplisitt i README.

**Kanalvalg per skill — ikke alt skal i org-katalogen.** Org-katalogen når
claude.ai og Desktop-*chat*, som ikke har filsystem, git, plan mode eller `/clear`.
Der er `nytt-prosjekt`/`fase-start`/`fase-slutt` meningsløse — en kollega som
møter dem der først, opplever en pakke som ikke virker:

| Skill | Plugin (CLI) | Org-katalog (claude.ai/Desktop-chat) |
|---|---|---|
| `nytt-prosjekt`, `fase-start`, `fase-slutt` | ✅ | ❌ CLI-only — krever filsystem/git |
| `grill-me` | ✅ | ✅ ren intervjuteknikk, virker overalt |
| `fint-graphql` | ✅ | ✅ ren kunnskap, virker overalt |
| `web-prototype` | ✅ | ✅ ligger der allerede |

## Skills i prosjektrepoet: deklareres, ikke kopieres

Du kopierer i dag skills inn i prosjektrepoet så andre kan overta prosjektet —
og det er nettopp slik `nytt-prosjekt` endte som to kopier (`~/.claude/skills/`
og `fint-samtykke/.claude/skills/`) som har drevet fra hverandre. Vendring løser
overtakelsesproblemet, men skaper råtneproblemet. Regelen som løser begge:

**Skills prosjektet selv fant opp, bor i prosjektet. Skills organisasjonen eier,
deklareres — aldri kopieres.**

| Kategori | Eksempel | Hvor |
|---|---|---|
| Arbeidsflyt (alltid) | `fase-start`, `nytt-prosjekt` | Deklareres i `.claude/settings.json`, hentes fra org-repoet |
| Org-eid teknologi/domene | `web-prototype`, `fint-graphql` | Deklareres — kun for prosjekttypene som trenger dem |
| Prosjektets egen domenekunnskap | API-særegenheter oppdaget underveis | `.claude/skills/` i repoet, committes |

Praktisk for den som overtar prosjektet: klone, åpne i Claude Code, godta
trust-prompten — arbeidsflyt-skillene hentes automatisk fra org-repoet i *gjeldende*
versjon, og de prosjektspesifikke ligger allerede i klonen. Ingen manuell
installasjon, ingen stale kopier. Dette er både best og enklest.

`nytt-prosjekt` gjør dette automatisk: skriver `.claude/settings.json` med
`extraKnownMarketplaces` + `enabledPlugins` — alltid `faseflyt`, og i tillegg
`web-prototype` for webapp-typen og `fint-graphql` når prosjektet bruker FINT —
oppretter `.claude/skills/` med en kort README om regelen over, og tar med et
avsnitt om det i prosjektets `CLAUDE.md`. Nøyaktig oppførsel for prosjekt-scope
(auto-prompt ved klone kontra eksplisitt `claude plugin install --scope project`)
verifiseres mot dokumentasjonen i Fase 1 før det skrives inn i malen.

## Fase 0 — Repo og manifester

`git init`, `.gitignore`, `marketplace.json` (`plugins[].source: "./plugins/faseflyt"`),
`plugin.json` (`name`, `displayName`, `version: 0.1.0`, `description`, `author`,
`license`). Kun `name` er påkrevd i begge; resten fylles for at katalogen skal se ryddig ut.
GitHub-repoet opprettes ikke i denne fasen — det gjøres i Fase 5, etter
renhetssjekken, og eksplisitt som `private`/`internal` i Vestfold fylkeskommune-organisasjonen.

## Fase 1 — `nytt-prosjekt` (tyngst)

Skrives om fra `~/.claude/skills/nytt-prosjekt/SKILL.md`.
SKILL.md holdes kort (~70 linjer); maler og detaljer flyttes til `references/`.

**Fjernes:** `fint-samtykke` i description, hele synk-avsnittet om
`bkaarstein/claude-global-config`, «Skrevet av oss selv»-metanotatet,
`references/retrospektiv-fint-samtykke.md` (internt — destilleres til anonymiserte
fallgruver i `references/fallgruver.md`).

**Ny steg-rekkefølge i SKILL.md:**

0. **Nytt eller eksisterende prosjekt?** Kollegaers vanligste tilfelle er ikke en
   tom mappe, men et prosjekt som allerede er i gang. Skillen skal støtte begge:
   i et eksisterende prosjekt opprettes kun det som mangler (`kunnskap/` uten å
   overskrive noe), `git init` hoppes over når repo finnes, og eksisterende
   `CLAUDE.md` får avsnittet lagt til — aldri overskrevet.
1. **Prosjekttype først** — spør hvilken av fire: webapp/prototype,
   script/automatisering, dokumentasjon/utredning, API/backend. Typen styrer alt
   videre (se `references/prosjekttyper.md`). Spør samtidig om prosjektet
   behandler persondata (styrer deny-regler i steg 6) og om det bruker FINT
   (styrer `fint-graphql`-deklarasjonen).
2. Prosjektnavn/domene.
3. **Grill før plan** — tilby `/grill-me` for å låse beslutninger før planen skrives.
4. Skriv `kunnskap/plan.md` med fast struktur: `## Kontekst` → `## Avklarte
   beslutninger` (fra grillingen, hver med `**Beslutning (<navn>):**` + begrunnelse)
   → `## Faseplan` → `## Kritiske filer` → `## Verifisering`. Mønsteret finnes
   allerede i [C:\dev\idm-grupper-dokumentasjon\kunnskap\plan.md](C:/dev/idm-grupper-dokumentasjon/kunnskap/plan.md) — gjenbrukes.

   **Fasedimensjonering** (står i plan-malen, håndheves når planen skrives): én
   fase = én enhet brukeren kan *verifisere* — kjøre, se eller teste — og som får
   plass i én økt uten `/compact`. Fase 0 er alltid scaffold + røyktest, så hele
   pipelinen er bevist før noe bygges oppå. 3–10 faser er normalområdet; en fase
   som ikke kan verifiseres selvstendig («refaktorer halve backenden») er feil
   snitt og skal deles annerledes. Hver fase i planen navngir sin verifisering:
   *hva brukeren gjør for å si ✅*.

   **Hvem kopierer planen, og når:** plan mode skriver sin planfil til
   `~/.claude/plans/<autogenerert>.md` — det styres av Claude Code, ikke av oss, og
   kan ikke overstyres. Rekkefølgen skillen skal håndheve er derfor: `/nytt-prosjekt`
   setter opp skjelettet → `/grill-me` → plan mode skriver sin fil → **ved godkjenning
   kopieres innholdet til `kunnskap/plan.md`, som fra da av er kanonisk**. Kopien i
   `~/.claude/plans/` er en engangsartikkel og skal aldri pekes på fra STATUS. Endres
   planen senere, endres `kunnskap/plan.md` — ikke originalen. Dette skrives eksplisitt
   inn i både `nytt-prosjekt` og `fase-slutt`, siden det ellers fomles bort i praksis.
5. Opprett `kunnskap/STATUS.md`, `logg.md`, `laering.md`, `sikkerhet.md`, og
   `arkitektur.md` *kun* for kode-typene. Opprett `TODO.md` fra dag 1 (kom for
   sent sist).
6. Skriv `.claude/settings.json` (marketplace-deklarasjon) og `.claude/skills/README.md`
   — se «Skills i prosjektrepoet» over. **Håndhevet personvern:** behandler
   prosjektet persondata, tilbys deny-regler i samme fil — Claude sperres fra å
   kjøre kommandoer som henter produksjonsdata, og fra å lese `.env` og datamapper.
   Dette er retrospektivets sterkeste enkeltfunn: policyen holdt fordi den var en
   *regel harness-en håndhever*, ikke en instruks Claude kunne glemme. Malen
   leverer et konkret deny-sett per prosjekttype, med den tilhørende arbeidsflyten
   («Claude forbereder kommandoen, du kjører den, du limer inn resultatet»)
   inn i prosjektets `CLAUDE.md` og som per-økt-påminnelse i STATUS.
   Malen er samtidig ærlig om grensen: deny-regler er risikoreduksjon, ikke
   sandkasse — Bash-mønstre kan omgås av kommandovarianter, så regelen i
   `CLAUDE.md` og deny-settet hører alltid sammen som par.
7. Tilby privat git-repo (branch `main`) + første commit.
8. Tilby CLAUDE.md-avsnitt til prosjektet, inkl. regelen om deklarerte vs.
   prosjekteide skills.
9. Forklar fase-rytmen (`/fase-start` … `/fase-slutt` → `/clear`).

**Referansefiler:**

- `references/maler.md` — alle filmalene (STATUS, logg, læring, arkitektur,
  sikkerhet, TODO, plan, CLAUDE.md-avsnitt). STATUS-malen får `**Plan:**
  kunnskap/plan.md` som relativ, ikke-råtnende peker, og seksjonen
  `## Arbeidsmåte neste økt`. `laering.md`-malen viser med eksempel hva et
  handlingsbart punkt er kontra en tom stemningsrapport.
- `references/prosjekttyper.md` — per type: hvilke `kunnskap/`-filer som opprettes,
  hvilken sikkerhetssjekkliste som gjelder, og om `web-prototype`/DesignSync er relevant.
- `references/windows.md` — UTF-8-fella (`Get-Content`/`Set-Content` uten
  `-Encoding utf8` mojibaker æøå), `git commit -F` for flerlinjede meldinger,
  PowerShell-syntaksfeller. Legges inn i STATUS-malen på Windows-prosjekter.
- `references/claude-design-oppskrift.md` — kopieres fra dagens versjon, kun
  `fint-samtykke`-palettreferansen gjøres generisk. Nevnes kun for webapp-typen.
- `references/fallgruver.md` — anonymisert destillat av retrospektivet, *begge
  veier*: både fallgruvene og mønstrene som beviselig fungerte (deny-regler framfor
  skreven policy; beslutninger loggført med navngitt beslutningstaker og begrunnelse;
  UX-funn generalisert fra enkelttilfelle til regel; hver fase loggført to ganger —
  «skrevet» og «verifisert av bruker»).

**Skill-descriptions er trigger-flaten.** `description` i frontmatter er det Claude
matcher på for å vite når en skill gjelder — den skal være ren triggertekst i tredje
person, ikke metanotater. Dagens `nytt-prosjekt`-description inneholder «Skrevet av
oss selv (ikke ekstern part), fritt å endre» og et helt avsnitt om synk-repoet; alt
det er støy og fjernes. Hver av de fire får en description med konkrete triggerfraser
på både norsk og engelsk («nytt prosjekt», «new project», «start a phase»), siden
kollegaer skriver begge deler.

**Selvbærende-tillegget:** et kort avsnitt i SKILL.md som beskriver
faseflyten, verifiseringsporten, Explore-delegering og modellmiks — det som i dag
forutsettes lest fra `~/.claude/CLAUDE.md`.

**Rytmevakter — flyten skal passe på seg selv.** Skills lastes bare når de kalles;
vakter som skal virke *hele tiden* må derfor bo i CLAUDE.md-avsnittet som
`nytt-prosjekt` installerer i prosjektet (samme lærdom som deny-reglene: regelen
må ligge der den alltid er aktiv). Avsnittet får tre stående regler:

1. **Plan-vakt:** vesentlig nytt arbeid uten godkjent plan i `kunnskap/plan.md` →
   Claude foreslår planmodus (kan selv be om byttet via EnterPlanMode — brukeren
   godkjenner) i stedet for å begynne å kode. Ingen kan tvinges inn i planmodus,
   men glemsel skal alltid gi et varsel.
2. **Fase-slutt-vakt:** når brukeren bekrefter at verifiseringen er OK, foreslår
   Claude `/fase-slutt` + `/clear` med én gang — porten er nådd. Blir konteksten
   lang midt i en fase, sies det fra *før* kvaliteten faller.
3. **Scope-vakt:** ber brukeren om noe utenfor gjeldende fase («kan du også
   ta …»), foreslås TODO.md — fasen fullføres i stedet for å ese.

## Læringssløyfe — selvvurderingen må overleve `/clear`

Kjerneendringen i denne planen. Refleksjonen skrives til fil, leses ved neste
oppstart, og evalueres ved neste faseslutt. Tre nivåer med ulik levetid:

| Nivå | Hvor | Levetid | Hvem leser |
|---|---|---|---|
| Arkiv | `kunnskap/laering.md` | append-only, datert | ved behov / retrospektiv |
| Aktive korrigeringer | `## Arbeidsmåte neste økt` i `STATUS.md` | overskrives per faseslutt, maks 3 punkter | `/fase-start`, hver økt |
| Permanent regel | prosjektets `CLAUDE.md` | varig | automatisk, alltid |

**Ratchet-en** (det som gjør at det faktisk blir bedre, ikke bare lengre):

1. `/fase-slutt` **evaluerer først forrige økts korrigeringer** før den skriver nye:
   ble de fulgt? Punkter som er innarbeidet strykes; punkter som gjentar seg
   overlever.
2. Et punkt som dukker opp i **tre påfølgende faseslutt** er ikke en påminnelse,
   men en manglende regel — `/fase-slutt` foreslår da å skrive den permanent inn i
   prosjektets `CLAUDE.md` og fjerne den fra STATUS. Dette hindrer at listen vokser
   i det uendelige.
   **Hvor telleren bor:** STATUS holder bare gjeldende punkter og kan ikke vite at
   noe er en gjenganger. `/fase-slutt` leser derfor de siste innslagene i
   `laering.md` for å telle. Malen krever at hvert punkt får en kort, stabil
   **stikkordsetikett** (f.eks. `[explore-delegering]`) — uten den kan gjentakelse
   ikke gjenkjennes på tvers av ulikt formulerte punkter.
3. `/fase-start` leser korrigeringene og **kvitterer eksplisitt** på dem i
   oppsummeringen, som forpliktelser for økten — ikke bare gjengivelse.

**Nivået over — læring tilbake til pakken.** Sløyfen slik den er beskrevet gjør ett
prosjekt bedre. Men når en kollega oppdager at *arbeidsflyten selv* er klønete, har
vi ingen vei tilbake. `/fase-slutt` skal derfor skille: gjelder punktet dette
prosjektet, eller gjelder det skillene? Er det det siste, tilbys det å opprette et
issue i `vestfoldfylke/claude-code-skills` med punktet og konteksten (`gh issue
create`). Da får pakken samme forbedringsmekanisme som prosjektene — og du får se
hva kollegaene faktisk snubler i, uten å måtte spørre. README-en nevner dette som
den normale måten å gi tilbakemelding på.
**Sikkerhetskrav for issue-teksten:** repoet leses av hele organisasjonen, mens
prosjektet kan behandle persondata. Issue-teksten skal derfor beskrive
*arbeidsflytproblemet*, aldri prosjektets data — ingen persondata, secrets,
interne URL-er eller sensitive prosjektdetaljer — og brukeren skal se og godkjenne
teksten før `gh issue create` kjøres. Skrives inn i `fase-slutt`-skillen som
eksplisitt regel.

Punktene skal være **handlingsbare og etterprøvbare**, ikke stemningsrapport.
Malen i skillen viser forskjellen: «Delegér filsøk på tvers av mapper til
Explore — tre runder med Grep i hovedtråden kostet ~15k tokens denne fasen» er
brukbart; «kunne vært mer effektiv» er det ikke. To kategorier dekkes: **prosess/
token-bruk** og **kodekvalitet/framgangsmåte**.

## Fase 2 — `fase-start` og `fase-slutt`

Konverteres fra `~/.claude/commands/*.md` til `skills/<navn>/SKILL.md`
(`description`-frontmatter beholdes; `$ARGUMENTS` erstattes av at skillen leser
brukerens tilleggsbeskjed fra prompten).

**`fase-start` — stegene skillen skal utføre:**

0. **Tål eldre prosjekter.** Fire prosjekter kjører alt arbeidsflyten
   (`fint-samtykke`, `ElevPC-fakturagrunnlag`, `idm-selvbetjening`,
   `idm-grupper-dokumentasjon`) med gammel STATUS-form: absolutt planpeker, ingen
   `laering.md`, ingen `## Arbeidsmåte neste økt`. Skillen skal håndtere det uten å
   kræsje — mangler seksjonene, hoppes stegene over, og det tilbys én gang å
   oppgradere (opprett `laering.md`, flytt planen til `kunnskap/plan.md`). Aldri
   automatisk; brukeren bestemmer.
1. Les `kunnskap/STATUS.md`. Mangler den: ikke gjett — foreslå `nytt-prosjekt`.
2. **Ble forrige økt avsluttet?** (lagt til 0.3.0, issue #4) Ucommittet arbeid,
   og commits som kom etter at `kunnskap/logg.md` sist ble endret. Treff = STATUS
   er utdatert; tilby å oppsummere, aldri rydd eller commit automatisk.
   Datoformen `--since` er eksplisitt forbudt — se skillen for målingen.
3. Les `kunnskap/plan.md` (fallback: `**Plan:**`-linjen i STATUS) og `TODO.md`.
   `logg.md` og `laering.md` kun hvis STATUS er uklar om noe som trengs nå.
4. Ikke utforsk kodebasen for det STATUS/planen svarer på; utforskning senere i
   økten delegeres til Explore-subagent.
5. Oppsummer: fase/tilstand, hva som er verifisert, og **ETT** konkret neste steg.
6. **Kvitter på `## Arbeidsmåte neste økt`** — gjenta korrigeringene som konkrete
   forpliktelser for denne økten (nytt steg, se læringssløyfen).
7. Gjengi per-økt-påminnelser fra STATUS og prosjektets `CLAUDE.md` (erstatter
   dagens hardkodede FINT-avsnitt).
8. Vent på klarsignal — med mindre brukerens tilleggsbeskjed alt er en arbeidsordre.

**`fase-slutt` — stegene skillen skal utføre:**

1. **Logg:** datert innslag øverst i `kunnskap/logg.md` — hva som ble
   implementert/verifisert, beslutninger med hvorfor, overraskelser og funn.
2. **Selvvurdering** (erstatter dagens chat-only refleksjon): evaluer først
   forrige økts korrigeringer, skriv så 1–3 nye handlingsbare punkter — datert
   innslag i `kunnskap/laering.md`, og de aktive punktene inn i STATUS. Foreslå
   promotering til `CLAUDE.md` for punkter som har gjentatt seg tre ganger.
   Punktene vises også i chatten.
3. **STATUS:** overskriv `kunnskap/STATUS.md` (maks ~30 linjer) — fase og tilstand,
   hva som er verifisert, konkret neste steg, kritiske filer, `## Arbeidsmåte neste
   økt`, og det en ny økt må vite. Selvbærende for `/fase-start`.
4. **Er noe i `TODO.md` avklart av det som ble gjort nå?** (lagt til 0.4.0, issue
   #4) Treff = foreslå å **fortette** seksjonen til én pekerlinje til hvor
   innholdet bor nå. Før/etter vises, klarsignal kreves, og bare det økten selv
   avklarte er kandidat. Fortetning framfor sletting: fila bærer beslutninger og
   resonnement, og belegget er ofte det mest verdifulle i den.
5. **Kvalitetsport:** kjør prosjektets egen sjekk før commit — bygg/typecheck/tester
   slik de er definert i prosjektets `CLAUDE.md` eller `package.json`. Finnes ingen,
   hopp over og si det. Feiler den, ikke commit stille: rapporter og la brukeren
   avgjøre. Resultatet føres i loggen, slik at «fase X ✅» faktisk betyr noe.
6. **Sikkerhetsrøyktest:** skaleres etter prosjekttype og tåler ikke-git-prosjekter.
   Beholder fnr-grep (11 sifre) og `client_secret`, men eksplisitt merket som
   røyktest — ikke en review; peker på `/security-review` for det.
7. **Commit og push** med beskrivende melding (`git commit -F` ved flere linjer).
8. **Avslutt:** «FERDIG — klar for /clear», pluss fallback-oppstartsmelding i
   kodeblokk, renset for FINT-eksempelet. Er planens faser ferdige: foreslå å
   flytte gjenstående til `TODO.md`.

Beholdes uendret: at STATUS overskrives mens loggen er append-only med nyeste
øverst, og at verifiseringsporten alltid er brukeren — aldri Claude.

## Fase 3 — `grill-me` koblet inn

MIT-attribusjonen til `github.com/mattpocock/skills` beholdes ordrett.
Tillegg: når grillingen er ferdig, tilby å skrive beslutningene inn i
`kunnskap/plan.md` under `## Avklarte beslutninger` med `**Beslutning (<navn>):**`
+ begrunnelse. Ingen endring i selve intervjuinstruksen.

## Fase 4 — `web-prototype` og `fint-graphql` som egne plugins

Begge har samme grunnproblem som de fire kjernene: de finnes lokalt i din
`~/.claude` fordi org-konsollet ikke når Claude Code CLI. Plugin-kanalen lukker
det hullet.

**`web-prototype` — repoet blir master.** Kopieres fra
`~/.claude/skills/web-prototype/` (SKILL.md + `references/components.md`) inn i
egen plugin. Fra da av er repoet sannheten, og org-konsollet oppdateres *fra*
repoet — ikke motsatt. To ting som må gjøres før første push:

- Avklar med den som vedlikeholder skillen i org-konsollet i dag at eierskapet
  flyttes, hvis det ikke er deg. Dette er en organisatorisk avklaring, ikke en
  teknisk — den bør tas før koden skrives.
- Verifiser at den lokale kopien faktisk er identisk med konsollversjonen før den
  gjøres til master; er den drevet, er det konsollversjonen som skal inn.

Innholdsmessig røres skillen minimalt i denne runden — kun det som må til for at
den skal stå alene som plugin (frontmatter, ev. stier). Innholdsgjennomgang av
selve DS-føringene er en egen jobb.

**`fint-graphql` — domenekunnskap.** Kopieres fra `~/.claude/skills/fint-graphql/`.
Denne skal *ikke* generaliseres bort fra FINT — FINT er poenget. Gjennomgangen her
gjelder noe annet: at den ikke inneholder prosjektspesifikke antakelser fra
`fint-samtykke` (konkrete testelever, miljø-URL-er, PoC-spesifikke workarounds) og
ingen persondata eller fødselsnummer i eksempler. Beta-endepunkter merkes eksplisitt
som beta.

Renhetssjekken i verifiseringen må skille på dette: `fint` skal gi null treff i
`plugins/faseflyt/`, men er selvsagt tillatt i `plugins/fint-graphql/`.

## Fase 5 — Distribusjon og dokumentasjon

README-en er en leveranse på linje med skillene: en kollega som aldri har sett
arbeidsflyten skal kunne starte et prosjekt riktig etter å ha lest den én gang.
Skrevet for lesere som ikke kjenner begrepene — ingen forkunnskaper om plugins,
plan mode eller `/clear` forutsettes.

**`README.md` — disposisjon:**

1. **Hva dette er, på fem linjer.** Faseinndelt arbeidsflyt for Claude Code:
   plan først, én fase om gangen, du verifiserer før neste starter, og prosjektet
   husker hva som skjedde mellom øktene. Etterfulgt av en kort **«Hvorfor
   faser?»**-boks med de fem reelle grunnene, viktigst først:
   - *Kvalitet:* modellkvalitet degraderer i svært lange kontekster — en frisk økt
     med skarp STATUS slår en oppblåst tråd. Dette, ikke tokensparing, er
     hovedgrunnen.
   - *Tokens og kostnad:* hver økt starter med STATUS + plan i stedet for hele
     historikken (kortere kontekst gir også raskere svar).
   - *Feil fanges nær årsaken:* verifiseringsporten per fase betyr at feil
     oppdages i fasen de oppsto — ikke i en stor-smell-integrasjon til slutt.
   - *Sporbarhet:* én fase = én commit/push — git-historikken speiler planen, og
     `logg.md` forklarer hvorfor.
   - *Overtakbarhet:* prosjektets hukommelse ligger i filer, ikke i en chattetråd —
     en kollega (eller du om tre uker) kan plukke opp midt i.
2. **Installasjon** — CLI (`/plugin marketplace add …` + `/plugin install …`,
   med `gh auth login`-forutsetningen) og hva som skjer hvis du bruker
   Claude Desktop/web i stedet (org-katalogen). Hvilke av de tre pluginene du
   trenger: `faseflyt` alltid, `web-prototype` og `fint-graphql` etter behov.
   Tydelig på at det er et internt repo og at ingenting deles utenfor organisasjonen.
3. **Kom i gang: ditt første prosjekt** — hovedseksjonen, en gjennomgang fra tom
   mappe til første fase i mål, med det du faktisk skriver i hvert steg:
   `/nytt-prosjekt` → velg prosjekttype → `/grill-me` for å låse beslutningene →
   planen skrives til `kunnskap/plan.md` → du godkjenner → fase 1 implementeres →
   **du verifiserer** → `/fase-slutt` → `/clear` → `/fase-start` neste dag.
   Med en kort «slik ser det ut»-visning av `kunnskap/`-mappen etter oppsett.
4. **Innholdet i pakken** — de fire arbeidsflyt-skillene i én tabell (hva hver
   gjør, når du kaller den), pluss `web-prototype` og `fint-graphql` med
   hvilke prosjekter de er relevante for.
5. **Filene i `kunnskap/`** — hva hver fil er til for, hvilke som overskrives
   (STATUS) og hvilke som er arkiv (logg, læring), og hvorfor du ikke skal
   redigere STATUS for hånd.
6. **Læringssløyfen** — kort om at Claude vurderer seg selv ved hver faseslutt,
   at korrigeringene overlever `/clear`, og at gjengangere blir permanente regler.
7. **Prosjekttypene** — de fire, og hva som skiller dem.
8. **Overta andres prosjekt** — klone, åpne, godta trust-prompten. Hvorfor du ikke
   skal kopiere arbeidsflyt-skills inn i prosjektrepoet, og hva som *skal* ligge
   der (`.claude/skills/` for prosjektets egne domeneskills).
9. **Gi tilbakemelding** — oppdager du at selve arbeidsflyten er klønete, opprett et
   issue i repoet. `/fase-slutt` tilbyr det automatisk når en læring gjelder
   skillene og ikke prosjektet.
10. **Vanlige spørsmål** — «må jeg bruke alle fire?», «hva om jeg allerede har et
   prosjekt i gang?», «hva er forskjellen på `/clear` og `/compact`?»,
   «hvorfor heter kommandoene `/faseflyt:fase-start`?», «hvordan oppdaterer jeg
   pakken?».

**`docs/installasjon.md`** — det tekniske som ikke hører hjemme i README:
org-opplasting av hver skill-mappe til claude.ai-katalogen, sentral utrulling via
managed settings med JSON-eksempel, valgfri `~/.claude/CLAUDE.md`-snutt for de som
vil ha reglene alltid aktive, og hvordan pakken oppdateres
(`/plugin marketplace update`) når du pusher en ny versjon.

**`CHANGELOG.md`** — en delt pakke er noe kollegaer bygger prosjekter på, og et
prosjekt scaffoldet med v0.1 må fortsatt kunne åpnes når pakken står på v0.4.
Derfor: semver i `plugin.json`, én linje per endring, og endringer som brekker
eksisterende `kunnskap/`-struktur markeres eksplisitt som brytende — med hva som
må gjøres i gamle prosjekter. Regelen er ellers at `fase-start` skal tåle eldre
struktur (se Fase 2 steg 0), så brytende endringer bør være sjeldne.

**`NOTICE.md`** — `grill-me` bygger på `grill-me`/`grilling` fra
github.com/mattpocock/skills (MIT). Attribusjonen står allerede i selve SKILL.md og
blir stående der, men samles også på repo-nivå — og MIT krever mer enn en
navnehenvisning: den fullstendige lisensteksten (copyright- og
tillatelsesnotisen) fra mattpocock/skills tas inn i `NOTICE.md`. Repoet er
internt, så egen lisens for pakken selv er ikke nødvendig — en linje om at den er
til intern bruk i Vestfold fylkeskommune holder.

## Etterpå (utenfor denne planen, avklares med deg)

`nytt-prosjekt` finnes i to drevne kopier — `~/.claude/skills/nytt-prosjekt/` og
`c:\dev\fint-samtykke\.claude\skills\nytt-prosjekt\`. Når pakken er ferdig bør
begge erstattes av den installerte pluginen, og whitelist-oppføringene i
`claude-global-config` ryddes. Gjøres ikke uten din bekreftelse.

## Verifisering

1. **Manifestene lastes:** `/plugin marketplace add ./` fra repoet lokalt, deretter
   `/plugin install faseflyt@claude-code-skills`. Alle fire skills skal dukke opp
   som `faseflyt:*`. Installer `web-prototype` og `fint-graphql` hver for seg, og
   verifiser at `faseflyt` alene fungerer uten dem — pluginene skal være uavhengige.
2. **Tørrkjøring av `nytt-prosjekt`** i en tom scratch-katalog, én gang per
   prosjekttype: verifiser at webapp-typen deklarerer `web-prototype` i
   `.claude/settings.json` og nevner DesignSync, at script-typen *ikke* gjør det,
   at dokumentasjonstypen ikke oppretter `arkitektur.md`, og at Windows-reglene
   havner i STATUS. Kjør i tillegg én gang i et **eksisterende, ikke-tomt prosjekt**:
   ingenting skal overskrives, `git init` skal hoppes over, og eksisterende
   `CLAUDE.md` skal utvides — ikke erstattes.
3. **Rundtur:** kjør `/fase-slutt` i scratch-prosjektet, `/clear`, deretter
   `/fase-start` — STATUS + `kunnskap/plan.md` skal alene være nok til å gjenoppta
   uten kodeutforskning. **Rytmevaktene testes i samme rundtur:** be om vesentlig
   nytt arbeid uten plan → planmodus skal foreslås; si «verifisert, alt OK» →
   `/fase-slutt` skal foreslås; be om noe utenfor fasen → TODO.md skal foreslås.
4. **Læringssløyfen lukkes:** i rundturen skal `/fase-slutt` skrive minst ett
   handlingsbart punkt til `laering.md` + STATUS, og `/fase-start` etter `/clear`
   skal kvittere på nøyaktig de punktene. Kjør så en fase til: neste `/fase-slutt`
   skal evaluere om punktet ble fulgt, og stryke det hvis det er innarbeidet.
5. **Bakoverkompatibilitet:** kjør `/fase-start` mot `ElevPC-fakturagrunnlag`
   (gammel STATUS-form, intakt): den skal starte normalt, ikke kræsje på manglende
   `laering.md`, og tilby oppgradering uten å gjøre den selv. Kjør deretter mot
   `fint-samtykke`, der planpekeren peker på en slettet fil: skillen skal si det
   tydelig og foreslå å rekonstruere `kunnskap/plan.md` fra STATUS/logg — ikke
   feile eller late som planen finnes.
6. **Selvbærende-test:** flytt `~/.claude/CLAUDE.md` midlertidig til side (den
   gjelder ellers alltid, så det finnes ingen annen måte å simulere en kollegas
   maskin på), kjør punkt 2–4 på nytt, og legg fila tilbake — flyten skal fungere
   uten den.
7. **Renhetssjekk før publisering** (kjøres FØR hver push, ETTER `git add`).
   Kanonisk liste med begrunnelser står i `docs/installasjon.md` under
   «Renhetskrav» — kortversjonen:
   - `v-t-f-k` (hyphenert her, ellers treffer regelen seg selv) skal gi **null
     treff i hele repoet** — organisasjonen heter Vestfold fylkeskommune, og den
     gamle forkortelsen skal ikke finnes noe sted, heller ikke i repo-navn,
     marketplace-navn, forfatterfelt eller eksempel-JSON. Treff på `vestfold`
     skal kun være i eierskapsfeltene.
   - Absolutte brukerstier i pakken — søk **generisk**, aldri etter et bestemt
     brukernavn. Et navngitt brukernavn måler én maskin og går ren for alle andre.
   - `fint` og `fint-samtykke` skal gi null treff i `plugins/faseflyt/` — men er
     legitimt i `plugins/fint-graphql/`, og i `kunnskap/` som referanse til
     prosjektet arbeidsflyten ble utviklet for.
   - Ingen fødselsnummer, testbrukere, miljø-URL-er eller secrets i eksempler
     — gjelder særlig `fint-graphql`, og gjelder også `kunnskap/`.
   - Personnavn, maskinnavn og referanser til private repo er **tillatt i
     `kunnskap/`** — loggen skal kunne navngi beslutningstaker, maskin og faktisk
     push-mål. I pakken er det bare *avhengigheter* til utilgjengelige repo som er
     forbudt, ikke det å nevne dem.
   - Alltid én positiv kontroll i samme runde.
8. **Synlighet og branch:** etter `gh repo create` — verifiser med
   `gh repo view vestfoldfylke/claude-code-skills --json visibility,owner,defaultBranchRef`
   at repoet er `PRIVATE`, eid av `vestfoldfylke` (ikke en personlig konto), og at
   standardbranchen er `main`.
9. **Overtakelsestest:** klon scratch-prosjektet fra Fase 1 til en ny mappe som om
   du var en kollega, åpne det, og se at arbeidsflyt-skillene blir tilgjengelige via
   `.claude/settings.json` uten manuell installasjon — og at ingen av dem er kopiert
   inn i `.claude/skills/`.
10. **README-test:** be en kollega som ikke kjenner arbeidsflyten følge «Kom i gang»
    fra tom mappe til første `/fase-slutt`, uten å spørre deg underveis. Det som
    krever oppklaring, mangler i README-en.
11. **Org-opplasting** følger kanalvalg-tabellen: kun `grill-me` (pilot først) og
    `fint-graphql` lastes opp — faseflyt-trioen er CLI-only og skal *ikke* i
    org-katalogen. web-prototype oppdateres til slutt — det er den som bytter
    master, og bør gjøres når resten er bekreftet å virke.
