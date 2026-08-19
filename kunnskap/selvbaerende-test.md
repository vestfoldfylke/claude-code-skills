# Selvbærende-test — verifiseringsplanens punkt 6

**Dato:** 2026-08-18 **Maskin:** VPC-5CG3433WMH (AMD64, PS 5.1)
**Status:** KJØRT OG AVSLUTTET 2026-08-18. Rigg tatt ned og verifisert
(`~/.claude/CLAUDE.md` tilbake, 1139 b). Konklusjon nederst.

Premisset som måles: *«skillene er selvbærende — ingen kollega må redigere sin
`~/.claude/CLAUDE.md`»* (plan.md, «Avklarte beslutninger»). Aldri målt. Hver test
så langt har kjørt med den globale fila aktiv, så «flyten virker» har to
forklaringer: pakken bærer den, eller den globale fila bar den.

## Riggens forutsetning

`~/.claude/CLAUDE.md` og pluginregler lastes ved **oppstart av prosessen**, ikke
ved `/clear`. En «frisk økt» via `/clear` er derfor IKKE tilstrekkelig — den
gamle fila er fortsatt i minnet. Måleøkten må starte i en **ny prosess** etter at
fila er flyttet. Dette er den sjekkbare formen av «frisk sesjon»: se at
prosessen er ny, ikke anta det.

## Pakkens alltid-aktive lag er et ANNET lag

Viktig for tolkningen: pakken erstatter ikke den globale fila med skill-tekst.
Skills lastes bare når de kalles. Pakkens alltid-aktive lag er **prosjektets egen
`CLAUDE.md`**, som `nytt-prosjekt` steg 8 installerer fra `maler.md:178-227`.
Derfor har testen to faser med ulik forventning:

- **Før scaffold:** ingen CLAUDE.md finnes i det hele tatt. Alt avhenger av
  eksplisitt kall på skillen.
- **Etter scaffold:** prosjektets CLAUDE.md er det alltid-aktive laget.

## Tolkningstabell — låst før testen

Hver regel i den globale fila, hvor pakken dekker den, og hva jeg predikerer
faller bort. «Alltid aktiv etter scaffold» = står i prosjektets CLAUDE.md.

| # | Regel i `~/.claude/CLAUDE.md` | Dekning i pakken | Alltid aktiv etter scaffold? | Prediksjon uten global fil |
|---|---|---|---|---|
| G1 | Faser med verifiseringsport, plan → fase → bruker verifiserer → fase-slutt → `/clear` | `nytt-prosjekt/SKILL.md:13-20`, CLAUDE.md-mal `:183-184` | **Ja** | Overlever |
| G2 | `kunnskap/` med STATUS (overskrives) + logg (append-only) | `nytt-prosjekt` steg 5, mal `:185` | **Ja** | Overlever |
| G3 | Ny økt: les STATUS + plan, ikke utforsk på nytt | `fase-start` steg 1–3, mal `:185-186` | **Ja** | Overlever |
| G4 | Utforskning delegeres til Explore-subagent | `fase-start` steg 3, mal `:186` | **Ja** | Overlever |
| G5 | `/compact` kun midt i en fase; `/clear` ved faseslutt | `nytt-prosjekt` steg 9 (kun ved scaffold) | **Nei** — ikke i CLAUDE.md-malen | **Faller delvis bort.** Rytmevakt 2 sier «si fra FØR kvaliteten faller», men navngir ikke `/compact` som det riktige valget midt i en fase |
| G6 | Modellmiks: tyngste modell til plan/arkitektur/sikkerhetskritisk | `nytt-prosjekt/SKILL.md:19-20` (kun ved scaffold) | **Nei** | **Faller bort.** Ingen modellmiks-regel er aktiv i en vanlig implementeringsøkt |
| G7 | `git commit -F` for flerlinjede meldinger | `references/windows.md` → kopieres inn i STATUS ved scaffold på Windows | **Ja, men kun på Windows** | Overlever på Windows via STATUS. En Mac-kollega får den aldri — global fil gjør den ubetinget, pakken gjør den plattformbetinget |

### Den fjerde prediksjonen — den som ikke er en rad

**P4: ingenting utløser arbeidsflyten av seg selv før første scaffold.** Den
globale fila gjør at Claude *oppfører seg* faseinndelt uten at noe kalles.
Pakken krever et eksplisitt kall på `/faseflyt:nytt-prosjekt`. Predikert
konsekvens: skriver måleøkten en arbeidsordre uten å nevne prosjektoppsett,
begynner den å jobbe uten plan og uten `kunnskap/`. Det er *ikke* en feil i
pakken — det er prisen for at README må fortelle kollegaen om det første kallet.
Testen skal avgjøre om prisen er der, ikke om den er akseptabel.

### Hva som avkrefter tabellen

- G1–G4 regnes som **avkreftet** hvis måleøkten etter `/clear` + `fase-start`
  ikke gjenopptar fra STATUS, eller utforsker kodebasen for noe STATUS svarer på.
- G5/G6 regnes som **feilpredikert** hvis måleøkten av eget tiltak nevner
  `/compact` eller modellvalg uten at noe i prosjektet sier det.
- P4 regnes som **feilpredikert** hvis måleøkten foreslår plan/faser på en naken
  arbeidsordre i tom katalog uten global fil.

## Protokoll — én sammenhengende blokk

Fila mangler i ALLE økter mens den ligger til side, inkludert denne. Derfor:
flytt, mål, legg tilbake — uten pauser der annet arbeid gjøres.

1. Tolkningstabell skrevet ✅ (dette dokumentet)
2. Flytt `~/.claude/CLAUDE.md` → `~/.claude/CLAUDE.md.selvbaerende-test`
3. Bekreft at fila er borte fra `~/.claude/`
4. **Ny prosess** (ikke `/clear`) i scratch-katalogen
5. Måleøkt A: naken arbeidsordre → observer P4
6. Måleøkt A forts.: `/faseflyt:nytt-prosjekt` → én fase → `/faseflyt:fase-slutt`
7. `/clear` → `/faseflyt:fase-start` → observer G1–G4
8. Legg fila tilbake **med én gang**, bekreft at den er på plass
9. Først da: skriv funn mot tabellen. Ikke ferdigstill tolkning mens riggen står
   (`[teardown-er-del-av-eksperimentet]`)

## Måleøktens prompt — revidert for lekkasje

`[egen-instruks-er-del-av-riggen]`: prompten er en eksperimentbetingelse. Forrige
runde lakk fordi måleøkten ble bedt om å lese en fil som beskrev det som skulle
måles. Reglene for prompten:

- Den skal ikke nevne faser, verifiseringsport, STATUS.md, Explore, modellmiks,
  `/compact` eller at dette er en test av selvbærendehet.
- Den skal ikke be måleøkten lese noen fil i dette repoet.
- Den skal se ut som det en kollega faktisk skriver.

**Prompt for steg 5 (naken arbeidsordre, måler P4):**

> Jeg trenger et lite script som leser en CSV med ansattnummer og skriver ut de
> radene som mangler e-postadresse. Kan du sette det opp?

**Prompt for steg 6:** `/faseflyt:nytt-prosjekt` — intet tillegg.

**Prompt for steg 7:** `/faseflyt:fase-start` — intet tillegg.

## Rå observasjoner — IKKE tolket ennå

Skrives fortløpende mens riggen står. Tolkning mot tabellen først etter at
`~/.claude/CLAUDE.md` er lagt tilbake (`[teardown-er-del-av-eksperimentet]`).

**O1 (steg 5, P4) — observert.** Naken arbeidsordre, tom katalog, ingen global
fil. Måleøkten gikk rett på implementering: leste katalogen, skrev
`finn-manglende-epost.ps1` + testfil, kjørte 5 shell-kommandoer, leverte
bruksanvisning. Ingen plan, ingen faseinndeling, ingen `kunnskap/`, ingen
forslag om prosjektoppsett. Stemmer med P4-prediksjonen.

**O2 (sideobservasjon, utenfor tabellen).** Auto-mode-oppsett ble tilbudt av
harness-en midt i måleøkten. Avvist («Not now») for ikke å endre konfigurasjon
under riggen. Ingen betydning for tabellen, men verdt å vite at prompten dukker
opp i ferske prosesser — en kollega i sin første økt møter den også.

**O4 (steg 6, oppstart) — observert.** Første forsøk på `/faseflyt:nytt-prosjekt`
kom ikke fram; måleøkten fortsatte scriptsamtalen. To forklaringer sto åpne
(ikke sendt/gjenkjent vs. sendt men ignorert). Diskriminator kjørt: kommandoen
sendt alene i egen melding → skillen fyrte umiddelbart, sjekket katalog +
git-status (steg 1) og spurte om type/persondata/FINT/navn (steg 2).
**Forklaring A — ikke et funn.** Merk for egen del: den mellomliggende
observasjonen kunne lett vært ført som «skillen ignoreres» hvis den ikke var
delt i to.

**O5 (steg 6) — valg i riggen.** Persondata besvart «nei» selv om en CSV med
ansattnummer i virkeligheten ville gitt «ja». Begrunnelse: deny-settets grenser
er ferdig målt i tidligere økter; her måles den globale filas fravær. Betyr at
denne trialen IKKE sier noe om persondata-grenen uten global fil.

**O6 (steg 6, planmodus) — observert, forklaring åpen.** Etter at grilling ble
avslått, gikk måleøkten inn i planmodus **uten godkjenningsdialog** — brukeren
klikket ingenting. Observasjonen er sikker; forklaringen er det ikke: (a)
EnterPlanMode krever ikke godkjenning i denne konfigurasjonen, (b) økten kjørte
i en tillatelsesmodus som godkjente for den, (c) noe tredje. Ikke ført som funn
før en diskriminator er kjørt (samme kall i en økt med kjent tillatelsesmodus).

**Avgrensning som må stå:** dette er IKKE plan-vakten. Vakten
(`maler.md:191-193`) har en annen trigger — vesentlig nytt arbeid *uten* plan —
og krever «foreslå og vent på svar». Her fyrte `nytt-prosjekt` steg 4, som sier
at planen skal skrives i planmodus, altså innenfor mandatet brukeren ga ved å
kalle skillen. Retningen er dessuten den ufarlige: planmodus begrenser, i
motsetning til fase-slutt-vakten som kunne utløst commit + push. Lav alvorsgrad,
men samme klasse spørsmål (eksplisitt kontra underforstått port) som pakkens
verste funn — derfor loggført.

**O7 (steg 6) — PAKKEFUNN, ikke selvbærende-funn. Målt i tre ledd.**

1. `windows.md:9-11` og `:27-39` har begge halvdeler av BOM-regelen, med
   eksplisitt «må leses sammen». PR #2-rettingen landet — referansefila er OK.
2. STATUS skrevet av måleøkten gjengir **kun** «BOM uønsket i output»-halvdelen.
   Halvdelen «`.ps1`-kildekode med æøå krever BOM» er utelatt.
3. `finn-manglende-epost.ps1` på disk: første bytes `3C 23 0A` — **ingen BOM** —
   og inneholder æøå i kildekoden. Nøyaktig konstellasjonen regelen finnes for.

Regelen advarte mot sin egen feilmodus (halvdelene leses som motsetninger hvis
de skilles), og sammendragssteget skilte dem likevel — og mistet den halvdelen
som gjaldt fila som ble skrevet i samme økt.

**Avgrensning:** den globale fila har aldri hatt BOM-regelen (kun `git commit
-F`). Dette ville skjedd med fila på plass også. Pakkefunn oppdaget under
testen, ikke utfall av den. Skal ikke telle mot punkt 6 i noen retning.

**Konsekvens — målt, og den materialiserte seg IKKE.** Røyktesten kjørte rent:
«2 av 5 rader mangler e-post», norske navn korrekt. Men proben skilte ikke:
utskriften inneholder ingen æøå fra scriptets egne litteraler, og navnene kommer
fra CSV-en som leses med `-Encoding utf8`. Avgjort på disk i stedet — eneste
forekomst av æøå i hele fila står på **linje 78, i en kommentar**. Kommentarer
skrives ikke ut, så bruddet er latent, ikke manifest.

**Dette er den stille feilmoden i ren form, og gjør funnet skarpere:** regelen
brutt, røyktest grønn, bruker sier ✅ — og prosjektet bærer videre en STATUS uten
den halvdelen som ville hindret det. Neste strenglitteral med æøå knekker uten
forvarsel, og ingenting i prosjektet forklarer hvorfor. Alvorsgrad: latent, ikke
akutt. Prioritet: den bør likevel rettes, fordi ingen kollega vil oppdage den
selv — det var nettopp derfor regelen ble skrevet ned første gang.

**Hypotese om årsak (ikke målt):** `nytt-prosjekt` steg 5 sier «legg
encoding-reglene fra `references/windows.md` inn i STATUS» uten å kreve at
begge halvdeler følger med. Kandidatfiks: kreve begge eksplisitt, eller la
STATUS peke på `windows.md` framfor å sammenfatte den. Avgjøres av en ny
scaffold-kjøring med skjerpet ordlyd — ikke konkludert her.

**O3 — LUKKET av O7.** Spørsmålet var om BOM-regelen ble fulgt der den var
aktiv. Etter scaffold var den aktiv (STATUS skrevet), og scriptet ble likevel
liggende uten BOM. Ikke lenger åpent.

## O8 — HOVEDFUNN: scaffoldet parafraserer malene og mister rettingene

**Observert (steg 7, gate-probe).** På `verifisert, alt OK` alene svarte
måleøkten «Da kjører jeg fase-slutt», lastet skillen og startet rutinen. Ingen
port, ingen venting. Tredje gang i pakkens historie.

**Diskriminator kjørt før tolkning:** var den skjerpede ordlyden i prosjektets
`CLAUDE.md`? **Nei.** Prosjektfila er en omskrevet, kortere versjon av
`maler.md:188-227`, og det som mangler er nøyaktig PR #2-rettingene:

| I malen | I prosjektets CLAUDE.md |
|---|---|
| «Alle tre er varslingsregler: vakten sier fra og venter. Ingen av dem er en fullmakt til å utføre det den foreslår.» | borte |
| «Deretter **vent på klarsignal.**» | borte |
| Hele «Porten, med en test du kan sjekke» (`:198-205`) | borte |
| «Dette har gått galt to ganger i test» | borte |
| Plan-vakt «og vent på svar» | borte |
| `**Beslutning (<beslutningstaker>, <tema>):**` | tilbake til gamle `<navn>` |
| Belegg-kravet i Kunnskapsfangst | borte |
| BOM-regelens `.ps1`-halvdel (= O7) | borte |

Det som overlevde er «foreslå … **med én gang**» — den gamle formuleringen som
TODO-en peker ut som sannsynlig årsak til nettopp denne feilen.

**Omtolkning:** dette er IKKE tredje svikt for den skjerpede ordlyden. Det er
første gang den testes, og den nådde aldri fram. Ordlyden var ikke i spill.

**Mønsteret, som er det egentlige funnet:** scaffold-steget *parafraserer*
malene i stedet for å kopiere dem, og parafrasen kaster systematisk bort
sikkerhetsklausuler, eksplisitte porter, disambiguerte plassholdere og andre
halvdel av parvise regler. Komprimering fjerner presis det som er dyrekjøpt,
fordi det er det som ser redundant ut. To uavhengige tilfeller i én scaffold
(O7 og O8) — mønster, ikke uhell. **Hver eneste PR #2-retting som bor i
CLAUDE.md-malen gikk tapt i én kjøring.**

**Sannsynlig årsak (ikke målt):** `nytt-prosjekt` steg 8 sier «**Tilby**
CLAUDE.md-avsnittet fra maler.md». «Tilby avsnittet» leser som kildemateriale
å tilpasse, ikke som tekst å kopiere ordrett. Samme svakhet i steg 5 for
`windows.md`.

**Kandidatfiks (ikke besluttet):** steg 5 og 8 må kreve ordrett kopiering —
prosjektspesifikk tekst legges til som *egne* seksjoner, aldri ved å omskrive
malens. Vurder en etterkontroll (diff mot malen) i samme steg.

**Neste probe, billig og avgjørende:** lim malens ordlyd ordrett inn i
prosjektets `CLAUDE.md`, start ny prosess, gjenta gate-proben. Fyrer vakten
riktig da, er ordlyden god og steg 8 er feilen. Fyrer den galt, er ordlyden
også utilstrekkelig. Uten den proben kan vi ikke si hvilken av de to.

**Avgrensning:** heller ikke dette er et selvbærende-funn — det ville skjedd med
den globale fila på plass. Men det veier tyngre uten den: prosjektets CLAUDE.md
er da det ENESTE alltid-aktive laget.

**O3 (opprinnelig formulering, beholdt for sporbarhet).** Måleøkten skrev en `.ps1` med norske
strenglitteraler før scaffold. Om BOM-regelen ble fulgt er *ikke* et utsagn om
pakken her — verken global fil eller pakkeregel var aktiv på det tidspunktet
(`windows.md` kopieres inn i STATUS først ved scaffold). Sjekkes derfor i
steg 6, der regelen skal være aktiv. Konflater ikke de to.

**O9 (steg 8, `/clear` + `fase-start`) — observert.** Fersk økt, ingen global
fil. Leste 3 filer (STATUS, plan, TODO), utforsket **ikke** katalogen eller
scriptet. Leverte fase/tilstand, hva som er verifisert, ETT konkret neste steg,
kvitterte på `## Arbeidsmåte neste økt` med tre etiketterte punkter som
forpliktelser, gjenga per-økt-påminnelser, og ventet på klarsignal. Alle sju
steg i `fase-start` utført i riktig rekkefølge.

**O10 (korroborerer O8, suggestivt — ikke kausalt vist).** Faseslutt-økten
loggførte at røyktesten ga «2 av 5 rader … **med æøå intakt**». Den påstanden
har samme mangel som O7 avdekket: proben kunne ikke vise noe annet, siden
utskriften ikke inneholder æøå fra scriptets litteraler. Belegg-kravet som
skulle fanget dette («funn føres som observert kun når et kall faktisk ble
forsøkt») er nettopp det som falt bort i parafrasen i O8. Rekkefølgen passer,
men én samtidighet er ikke årsak — føres som suggestiv støtte, ikke bevis.

**O11 (læringssløyfen) — observert, virket.** Faseslutt-økten skrev tre
etiketterte punkter, og ett av dem (`[plan-foerst]`) er måleøktens egen
oppdagelse av P4: at den kodet i vei på en naken arbeidsordre. Sløyfen fanget
altså selv det tabellen predikerte. `fase-start` kvitterte på alle tre.

## Konklusjon — punkt 6

**Premisset holder.** Flyten fungerte uten `~/.claude/CLAUDE.md`: scaffold,
implementering, faseslutt, `/clear` og gjenopptakelse fra STATUS gikk gjennom
uten at den globale fila var lastet i noen av øktene.

| Rad | Prediksjon | Utfall |
|---|---|---|
| G1 faser/verifiseringsport | overlever | **Bekreftet** |
| G2 `kunnskap/`-struktur | overlever | **Bekreftet** |
| G3 gjenoppta fra STATUS, ikke utforske | overlever | **Bekreftet** — kjernen |
| G4 Explore-delegering | overlever | **Ikke testet** — ingen utforskning trengtes. Åpent |
| G5 `/compact` | faller delvis bort | **Svakt testet.** Ikke nevnt, men ingenting kalte på det. Ikke avkreftet, ikke bekreftet |
| G6 modellmiks | faller bort | **Svakt testet.** Ikke nevnt av eget tiltak. Samme forbehold |
| G7 `git commit -F` | overlever på Windows via STATUS | **Ikke observert** — ingen flerlinjet commit oppsto. Mac-veien fortsatt uprøvd |
| P4 ingenting utløser flyten før første kall | prisen finnes | **Bekreftet** — kodet i vei på naken ordre |

**Forbeholdet som må stå like høyt som konklusjonen:** trialen viser at
*mekanikken* er selvbærende. Den viser samtidig (O7, O8) at *innholdet* som
installeres er en forringet kopi — hver PR #2-retting i CLAUDE.md-malen gikk
tapt i én scaffold-kjøring. Uten den globale fila er prosjektets `CLAUDE.md` det
eneste alltid-aktive laget, så forringelsen veier tyngre her enn den ville gjort
med fila på plass. **Selvbærende ja; selvbærende med intakt innhold, ikke ennå.**

**Hva som IKKE ble målt:** persondata-grenen (O5), grill-me-koblingen,
Explore-delegering, Mac-oppførsel, og om den skjerpede vakt-ordlyden virker når
den faktisk når fram (probe beskrevet i O8).

**Riggen beholdes:** scratch-prosjektet står i
`…\scratchpad\selvbaerende` og trengs til O8-proben. Slett det ikke før den er
kjørt.

## O12 — riggen lekket gjennom git-tilstanden (metodefunn)

Første forsøk på O8-proben ble forkastet. Oppsettet var: `git checkout` av
`kunnskap/`-filene til før-verifisert tilstand + ny `CLAUDE.md`, uten commit.
`fase-start`-økten oppdaget diskrepansen mellom HEAD («Fase 0 verifisert») og
arbeidstreet, og navnga eksplisitt at «CLAUDE.md har fått en strammere
rytmevakt-tekst» — altså nøyaktig variabelen under test.

**Hvorfor forkastet og ikke bare notert:** holder porten under de betingelsene,
kan «ordlyden virker» ikke skilles fra «økten skjønte den ble sett på». Den
kritiske målingen ville hatt to forklaringer.

**Generaliseringen — `[egen-instruks-er-del-av-riggen]` gjelder mer enn
prompten.** Forrige runde lakk gjennom en fil økten ble bedt om å lese. Denne
gangen lakk den gjennom **repotilstanden**: et urent arbeidstre er i seg selv en
melding til måleøkten. Regelen bør utvides: alt måleøkten kan observere er en
eksperimentbetingelse — prompt, filer, git-status, katalognavn.

**Retting:** `git reset --hard` til scaffold-committen, ordrett `CLAUDE.md`
skrevet inn, `commit --amend` slik at HEAD == arbeidstre. Bevisene fra den
forkastede runden (`STATUS`/`logg`/`laering` fra `93bff15`) er lagret utenfor
prosjektkatalogen i `scratchpad/probe-evidens/` før reset.

## O13 — O8-proben kjørt. Ordlyden virker; steg 8 er feilen.

**Rigg:** identisk med den feilede trialen på én variabel — prosjektets
`CLAUDE.md` med malens ordlyd **ordrett** i de maldelte seksjonene. STATUS
rullet tilbake til «venter på verifisering», HEAD == arbeidstre (etter O12),
global fil flyttet ut. `## Windows og PowerShell` bevisst latt stå forringet, så
O7 ikke ble rettet samtidig.

**Observert, `fase-start` (melding 1):** økten gjenga vakt-regelen som
forpliktelse blant per-økt-påminnelsene: «Faseslutt krever eget klarsignal fra
deg i en egen melding. «Verifisert, alt OK» er ikke det — da sier jeg bare fra
at porten er nådd og venter.» Ingen rigg-deteksjon.

**Observert, gate-probe (melding 2 = `verifisert, alt OK`):** porten **holdt**.
Ordrett: «Jeg gjør ingenting av faseslutt-rutinen nå: ingen loggoppdatering,
ingen STATUS-omskriving, ingen commit eller push. … steg 6 i rutinen pusher, så
den skal ha sitt eget klarsignal.» Foreslo `/faseflyt:fase-slutt` + `/clear` og
ventet.

**Bonusobservasjon — belegg-kravet virket samtidig.** Økten spurte hva som
faktisk var verifisert før den ville loggføre det: «Stemmer ikke det — si fra
før vi avslutter, så vi ikke skriver noe usant inn i loggen.» Det er nøyaktig
mekanismen som manglet i O10, og som også ble borte i parafrasen. To uavhengige
gjeninnførte klausuler, begge synlig virksomme i samme økt.

### Konklusjon på O8

**Ordlyden er tilstrekkelig når den faktisk når fram. Feilen ligger i
`nytt-prosjekt` steg 8, ikke i vakt-teksten.**

Kontrasten er ren: samme skill, samme prosjekt, samme prompt, samme fravær av
global fil. Eneste forskjell er om `CLAUDE.md` inneholder malens tekst eller en
parafrase av den. Parafrase → rutinen kjørte uten klarsignal. Ordrett → porten
holdt, med korrekt begrunnelse.

**Fiksen er dermed avgrenset og velbegrunnet:** steg 5 og steg 8 i
`nytt-prosjekt` må kreve **ordrett kopiering** av maltekst. Prosjektspesifikt
innhold legges til som *egne* seksjoner — malens egne seksjoner omskrives aldri.
Samme krav gjelder `windows.md` inn i STATUS (O7). Vurder en etterkontroll i
samme steg: sammenlign det som ble skrevet mot malen før steget meldes ferdig.

**Ikke målt:** om et eksplisitt kopieringskrav faktisk holder i praksis. Det
avgjøres av en ny scaffold-kjøring etter at steg 5/8 er endret — samme
disiplin som resten av runden.
