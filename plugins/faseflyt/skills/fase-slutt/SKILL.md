---
name: fase-slutt
model: sonnet
description: >-
  Avslutter en fase eller økt i et faseinndelt prosjekt: oppdaterer logg og
  STATUS, skriver selvvurdering til læringsloggen, sjekker at prosjektet fortsatt
  virker, kjører en rask sikkerhetssjekk, committer og klargjør for /clear.
  Brukes når en fase er
  ferdig og verifisert av brukeren, eller når en økt avsluttes midt i en fase.
  Triggere: «fase-slutt», «avslutt fasen», «avslutt økten», «end the phase»,
  «wrap up this session».
---

# Fase-slutt

**Porten: denne skillen kjøres BARE når brukeren har bedt om den.** At brukeren
bekrefter en verifisering («verifisert, alt OK») er ikke en bestilling — da
foreslår du fase-slutt og venter (fase-slutt-vakten i prosjektets `CLAUDE.md`).
Grunnen er steg 7: det committer og pusher uten eget klarsignal, og det er bare
forsvarlig når det var brukeren som kalte skillen.

**Sjekk porten før du begynner, den er observerbar:** finn meldingen der brukeren
ba om dette — `/faseflyt:fase-slutt`, «avslutt fasen» eller tilsvarende. Finner du
den ikke, ble du utløst av en vakt eller av eget initiativ. Stopp da her, si at
porten er nådd, foreslå kommandoen og vent. Ikke utfør stegene «for hånd» i stedet
— det er samme handling uten porten. Dette har gått galt to ganger i test (rutinen
kjørte helt gjennom og committet uten å spørre), så behandle det som en kjent
felle: er du i tvil, spør før du gjør noe.

**Ta klokkeslett når porten er passert:** `date +%H:%M`, ett kall. Skillen har
ingen klokke ellers, og tiden fra kommando til «FERDIG» er en måling av skillen
selv — den føres i steg 7.

## Hva du skriver i chatten

**Start med hva økten leverte.** «Avvik, ikke gjennomføring» under gjelder
stegene i denne skillen — ikke arbeidet økten gjorde. Før stegrapporteringen
kommer en kort del som sier hva som faktisk ble levert: utgivelser med
versjonsnummer, commits, hva som ble målt, og hva som fortsatt er utestet.
Brukeren skal kunne avgjøre om fasen er ferdig uten å bla opp i økten. Fem linjer
er nok — en liste over filendringer er ikke en leveranse.

Stegene rapporteres deretter i sin egen rekkefølge.

Rapporter **avvik, ikke gjennomføring**. Et steg som gikk rent får én linje i en
samlelinje, ikke egen seksjon; et steg som fant noe får plassen funnet trenger.

**Unntaket er steg 5 og 6.** Der er rapporten selve belegget, og den skal alltid
si hva som ble kjørt og hva som skjedde. Kort, men konkret: «`npm run check`: 0
feil / 179 filer» framfor et avsnitt. Å stryke den rapporten er å gjøre sjekken
formelt til stede og reelt borte.

Dette gjelder utskriften, ikke arbeidet: hvert steg kjøres som før.

Fasen er ferdig (eller økten avsluttes). Gjør følgende, i rekkefølge:

Rekkefølgen gjelder tenkingen, ikke turene: loggen (steg 1), læringsloggen
(steg 2d) og STATUS (steg 3) er uavhengige filer, så når innholdet i alle tre er
bestemt, sendes filskrivingene i samme melding — én tur i stedet for tre, på det
punktet i økten der hver tur koster mest.

**Les toppen, ikke arkivet.** `logg.md` og `laering.md` får nye innslag øverst
og vokser for hver faseslutt. For å legge inn et innslag trenger du bare de
første ~15 linjene (`Read` med `limit`) — der står overskriften og det forrige
innslagets dato, som er alt du trenger som ankerpunkt. Å lese hele fila koster
like mye som fila er lang, i den turen der konteksten alt er størst, og
ingenting i stegene under trenger innholdet lenger ned. Gjentakelser telles i
STATUS (steg 2b), ikke ved å lese læringsloggen.

1. **Logg:** Legg et datert innslag øverst i `kunnskap/logg.md`: hva som ble
   implementert/verifisert, beslutninger med hvorfor
   (`**Beslutning (<beslutningstaker>, <tema>):**` + begrunnelse — personen som
   bestemte, ikke bare temaet), overraskelser og funn.
   Kortfattet — dette er arkivet. Er fasen skrevet men ikke verifisert av
   brukeren ennå, føres den som «skrevet (verifisering hos bruker)» — ✅ først
   når brukeren har bekreftet.
   **Funn krever belegg:** «observert» betyr at et kall faktisk ble forsøkt og
   utfallet sett — skriv hva som ble kjørt og hva som skjedde. Alt annet føres som
   hypotese, med hvilken test som ville avgjort den. En overskrift skal ikke
   påstå mer enn forbeholdene under den tillater. (Samme belegg-krav som
   `laering.md` har.)

   **Søk før du skriver:** `Grep` etter fasens overskrift i `logg.md`
   («Fase <N>»). Finnes et innslag alt — skrevet underveis i fasen — oppdateres
   det og flyttes øverst; det legges ikke et nytt. Søket gjør noe annet enn
   toppen-lesingen over: den sparer tokens, søket hindrer dobbeltføring.
   Observert 2026-09-04: fasen skrev innslaget selv og la det nederst;
   fase-slutt fant det bare fordi samme økt hadde skrevet det.

2. **Selvvurdering** (læringssløyfen — skrives til fil, ikke bare chat):
   a. **Evaluer forrige økts punkter** i STATUS `## Arbeidsmåte neste økt`.
      Hvert punkt får ett av tre utfall, og situasjonen avgjør hvilket:
      - *Fulgt* — situasjonen punktet gjelder oppsto, og punktet ble fulgt:
        strykes som innarbeidet.
      - *Brutt igjen* — situasjonen oppsto, punktet ble ikke fulgt: videreføres,
        rundetallet øker.
      - *Ikke utløst* — situasjonen oppsto ikke i fasen. Kan en gjenstående fase
        utløse den? Ja: videreføres, rundetallet står. Nei: strykes, med peker
        til logginnslaget. Et punkt som aldri ble satt på prøve har ikke hatt en
        runde. Belegg: et punkt nådde «3. runde» uten å ha blitt prøvd én gang.
   b. **Tell rundene i STATUS**, ikke i læringsloggen: hvert punkt bærer et
      rundetall (`(2. runde)`). Bare «brutt igjen» øker tallet; et nytt punkt
      starter uten tall; et punkt uten tall i et eldre prosjekt regnes som
      første runde. Står et punkt i **tredje runde**, er det en manglende regel
      — foreslå å skrive det inn i prosjektets `CLAUDE.md` og ta det ut av
      STATUS **i samme redigering**: et punkt bor på én adresse, aldri begge.
      Mangler prosjektet en `CLAUDE.md`, tilby å opprette den med punktet som
      eneste innhold.
      **Forslaget legges fram én gang.** Sier brukeren nei eller «ikke nå»,
      føres svaret i `laering.md`, punktet tas ut av STATUS, og forslaget
      gjentas ikke.
   c. Skriv 1–3 **nye** handlingsbare punkter, hver med stabil
      stikkordsetikett (`[explore-delegering]`-stil) og konkret belegg — dekk
      både prosess/token-bruk og kodekvalitet/framgangsmåte. **Svar alltid på
      ett spørsmål om fasesnittet:** fikk fasen plass i én økt uten `/compact`?
      Hvis ikke, var fasen for stor — foreslå hvordan de gjenstående fasene bør
      deles, og legg det inn i `kunnskap/plan.md` når brukeren sier ja. «Kunne
      vært mer effektiv» er ikke et punkt.
   d. Før alt som datert innslag øverst i `kunnskap/laering.md`, og legg de
      aktive punktene i STATUS (maks 3). Innslaget er kort: én linje per
      evaluert punkt, to–tre linjer per nytt punkt, belegget som én setning. Et
      innslag på over ~20 linjer er et tegn på at det skrives arkiv framfor
      korrigering. **Ikke gjengi dem i chatten** — de
      skrives til fil nettopp for å overleve `/clear`, og en opplesning i
      tillegg er samme tekst to ganger. Én linje om hvor de ble ført, og hva
      som ble strøket eller promotert, holder.
   e. **Gjelder et punkt arbeidsflyten selv** — det navngir en skill eller
      oppskrift (`web-prototype`, `fase-slutt`, `nytt-prosjekt`, …), sier at en
      instruks var feil eller utdatert, **eller pakken kunne ha vernet mot det i
      neste prosjekt**: tilby å opprette et issue i
      `vestfoldfylke/claude-code-skills` (`gh issue create`). Issue-teksten skal
      beskrive arbeidsflytproblemet og ALDRI prosjektets data — ingen
      persondata, secrets, interne URL-er eller sensitive prosjektdetaljer — og
      brukeren skal se og godkjenne teksten før kommandoen kjøres.
      Stegrapporten i chatten får alltid en egen linje: «Issue til pakkerepoet:
      tilbudt» eller «Issue til pakkerepoet: ikke aktuelt». Uten linjen er et
      manglende tilbud usynlig. Observert 2026-09-04 på Sonnet: to punkter
      navngav `web-prototype`-oppskriften, ingen tilbud kom, og rapporten viste
      det ikke. Observert 2026-09-05: et forsøk på å installere en nettleser ble
      avvist som «ikke pakkens sak» fordi impulsen kom fra en generell skill —
      og pakken fikk vernet i neste versjon likevel.

3. **STATUS:** Overskriv `kunnskap/STATUS.md` (tak 45 linjer — telles, ikke
   anslås): fase og tilstand, hva som er verifisert, gjenstående med konkret
   neste steg, kritiske filer, `## Arbeidsmåte neste økt` (fra steg 2), og det
   en ny økt MÅ vite for å fortsette uten å utforske kodebasen. STATUS skal
   være SELVBÆRENDE
   for `fase-start`: `**Plan:** kunnskap/plan.md` rett under tittelen, peker
   til `TODO.md`, per-økt-påminnelser i STATUS eller prosjektets CLAUDE.md.
   Hold den skarp — historikk hører hjemme i loggen.

   **Én adresse per regel.** Før hvert «må vite»-punkt skrives, sjekkes det mot
   prosjektets `CLAUDE.md` (ett `Grep` etter et nøkkelord fra punktet). Står det
   der, strykes det fra STATUS — `CLAUDE.md` leses i hver økt uansett, og to
   adresser er det som får STATUS til å vokse. Belegg: fire av tolv punkter i
   ett prosjekt sto begge steder.

   **Tell etter skriving:** `wc -l kunnskap/STATUS.md`, eller siste linjenummer
   i `Read`. Over 45 kuttes før commit — historikk til loggen, dobbeltadresser
   strykes — og tallet føres i logginnslaget fra steg 1, så drift er synlig fra
   faseslutt til faseslutt. Målt: fem faseslutt lå på 42–47; «~30» er
   uoppnåelig med malens faste deler.

   **Et punkt under `## Det en ny økt må vite` tas ut bare med en peker til der
   teksten faktisk står nå — og du har lest at den står der.** Observert
   2026-09-04: encoding-regelen, commit-F-regelen og PowerShell 5.1-manglene
   ble byttet mot «står i `laering.md`», og `laering.md` hadde dem ikke.

   **Står Windows-snutten fra `windows.md` i STATUS** (prosjekt satt opp før
   0.6.1), følger den med ordrett i hver overskriving og teller ikke mot
   taket på 45 — eller flyttes til CLAUDE.md med brukerens klarsignal,
   én gang. Nye prosjekter får den i CLAUDE.md fra oppsettet.
   (Mangler `kunnskap/` eller `kunnskap/plan.md`: opprett mappen/filene; en
   godkjent plan som bare finnes under `~/.claude/plans/` kopieres inn som
   `kunnskap/plan.md` NÅ — den originale er en engangsartikkel.)

   **Ordlekkasje-søk i det du nettopp skrev.** Ett `Grep` i `STATUS.md`,
   `laering.md` og loggen etter `skaffold|scaffold|trigg|probe|harness` — ordene
   som er *observert* lekket fra Claude Codes eget vokabular inn i
   prosjektfiler. Treff skrives om til vanlig norsk (sette opp, slår inn,
   kontrollkall, Claude Code selv) før commit. Lista vokser bare med ord som
   faktisk er sett i et prosjekts filer, ikke med ord som kunne lekke.

4. **Plan og `TODO.md`.**

   **Er fasen verifisert ✅, kollapser den i `kunnskap/plan.md`** til én linje:
   «Fase N ✅ <dato> — detaljer i logg». Vis før/etter og vent på klarsignal. En
   fase avsluttet uten verifisering kollapses ikke. Planen skal holde seg rundt
   100–150 linjer; det den mister, står i loggen.

   **Endret økten hva verifiseringen av en fase betyr** — et punkt ble tatt ut,
   lagt til eller formulert om — endres `**Verifisering:**`-linja i `plan.md`,
   ikke bare STATUS eller `laering.md`. `fase-start` gjengir planens linje
   ordrett; en linje som bare er rettet i STATUS er rettet for én økt.

   **Er noe i `TODO.md` avklart av det som ble gjort nå?** Finnes `TODO.md`,
   sammenlign det økten faktisk leverte — loggen fra steg 1, commitene, issues
   som ble lukket — mot punktene fila beskriver som åpne.

   Finner du treff: **foreslå å fortette seksjonen til én pekerlinje** som sier
   hvor innholdet bor nå (dato i `logg.md`, versjon i `CHANGELOG.md`, commit,
   issue-nummer). Vis før/etter og **vent på klarsignal**. Ikke slett noe uten
   det, og ikke fortett noe økten ikke selv avklarte — punkter avgjort for hånd
   eller i en annen økt er usynlige for deg her.

   **Fortett, ikke slett.** `TODO.md` bærer beslutninger og resonnement, ikke
   oppgaver, og belegget for *hvorfor* noe ble som det ble er ofte det mest
   verdifulle i fila. En avklart seksjon erstattes derfor av én linje som peker
   videre — aldri av ingenting. Den som leser fila om tre måneder skal kunne
   finne begrunnelsen, ikke bare se at posten er borte.

   Er du i tvil om et punkt er avklart, la det stå. En åpen post som er lukket
   koster et blikk; en fjernet post som var åpen koster arbeidet på nytt.

5. **Virker prosjektet fortsatt?** Kjør sjekken prosjektet selv har, og skriv i
   loggen hva du kjørte og hva som skjedde — det er det som gjør at «fase X ✅»
   betyr noe.

   **Kjørte sjekken grønt i denne økten, etter siste endring i kodefiler, kjøres
   den ikke igjen.** Rapporten i chatten og loggen sier det i stedet — «sjekken
   kjørt grønt kl. 14:32, etterpå bare `kunnskap/`-filer» — med klokkeslett når
   du har det, ellers med hva som skjedde imellom. Er du usikker på om noe ble
   endret etterpå, kjør den. Belegg: 51 sekunder på en sjekk som var grønn åtte
   minutter tidligere.

   Si først i vanlig språk hva sjekken er og hva et godt utfall betyr — «jeg
   kjører prosjektets egen test, som sier om koden fortsatt henger sammen; alt
   grønt betyr at ingenting er brukket» — og først deretter kommandoen.

   **Let bredt før du melder at ingen sjekk finnes.** En sjekk er alt som kan
   svare ja/nei på om prosjektet henger sammen, ikke bare et byggverktøy: tester
   og typesjekk (`npm test`, `npm run build`, `pytest`), men også validering av
   manifester eller skjemaer (`claude plugin validate .`), at et script kjører
   uten feil, eller at en Markdown-lenke ikke er død. Sjekker prosjektets
   `CLAUDE.md`, `package.json` og eventuelle byggefiler — og spør deg hva slags
   prosjekt dette er før du konkluderer.

   Finnes det virkelig ingen, si det i vanlig språk («jeg finner ingen sjekk å
   kjøre i dette prosjektet») og gå videre. Ikke meld fravær av sjekk ut fra én
   manglende fil: et prosjekt uten `package.json` kan godt ha en. Feiler sjekken:
   IKKE commit stille — rapporter og la brukeren avgjøre.

6. **Rask sikkerhetssjekk.** Rask er nøkkelordet: dette fanger de grove tabbene,
   det er ikke en gjennomgang. Full gjennomgang er `/security-review`, en egen
   jobb.

   Før søkene: én setning om hva de leter etter og hvorfor — «jeg søker gjennom
   filene som lagres i git etter fødselsnummer, passord og nøkler; null treff er
   riktig, og ett av søkene skal treffe med vilje, så vi vet at søkingen
   virker.»

   I git-prosjekter:
   - `git ls-files` skal ikke vise andre env-filer enn `.env.example`
   - `git grep` etter 11-sifrede tall (fødselsnummer) og `client_secret` i
     tracked filer — kjente eksempelverdier i dokumentasjon er OK
   - **Datauttrekk skal være dekket av `.gitignore`.** Sjekk at ingen uttrekksfil
     er tracket — `git ls-files` mot datamappene prosjektet bruker.

   **Sjekk også filene arbeidsflyten selv har laget.** Dette er den lekkasjen som
   er lettest å gjøre og vanskeligst å se, fordi filene føles som notater:
   - `kunnskap/logg.md`, `STATUS.md` og `plan.md` skal beskrive **former og
     feltnavn, aldri verdier**. «Responsen har `fodselsnummer` og `fornavn`» er
     riktig; én ekte rad limt inn som «eksempel på responsformen» er en lekkasje
     — og den blir committet i samme åndedrag.
   - Skjermbilder av en prototype med ekte data ER persondata. Ligger det bilder
     i repoet, gjelder samme krav for dem.
   - Skal noe av dette ut som issue i org-repoet (steg 2), beskriv
     arbeidsflytproblemet — aldri prosjektets data.

   **Ett kontrollsøk som skal gi treff, i samme runde.** Fire søk som alle gir null
   treff er ikke skillbare fra fire søk som ikke virker — en regex som aldri kan
   matche, et `git grep` kjørt fra feil katalog, eller et tomt tracked-sett gir
   samme utfall som et rent prosjekt. Kjør derfor ett søk du vet skal treffe, for
   eksempel `git grep -c` etter et ord som finnes i en tracked fil, og meld
   treffantallet sammen med nullsvarene.

   Vær ærlig om hva kontrollen dekker: den viser at søket virker i denne katalogen,
   ikke at mønstrene er de riktige. En regex kan være gal og likevel bestå
   kontrollen.

   **Omtal søket uten å sitere søkeordet** — i chatten og i loggen. «Søk etter
   nøkkelord for hemmeligheter: 0 treff», ikke ordet selv. Skrives ordet i
   loggen, er loggens egen setning neste faseslutts eneste treff, og nullsvaret
   er borte. Belegg: to faseslutt på rad.

   **Alle søkene kjøres som parallelle kall i samme melding** — ls-files-sjekkene,
   grep-søkene og kontrollsøket sendes samlet, ikke som en tur per søk. Hvert kall
   er fortsatt én enkelt kommando (kombinerte kommandoer matcher ingen
   allowlist-oppføring). Dette er samme søk til samme pris i godkjenninger, men
   én tur i stedet for fem på det punktet i økten der hver tur koster mest.

   **Meld hva du kjørte og hva du fant**, ikke «sjekk utført»: brukeren skal kunne
   se hvilke søk som faktisk ble gjort. Skaler etter prosjekttype — for
   dokumentasjonsprosjekter er persondata-sjekken hovedsaken. Utenfor git: samme
   sjekker med vanlig filsøk i prosjektmappen.

   **Vær ærlig om hva dette er.** Sjekken er en instruks du følger, ikke en regel
   noe håndhever — den kan overses, i motsetning til `deny`-reglene. Behandler
   prosjektet persondata, er `.gitignore` og deny-settet førstelinjen; denne
   sjekken er et nett under, ikke i stedet for.

7. **Commit og push** med beskrivende melding. Først: `date +%H:%M` igjen, og
   differansen fra klokkeslettet ved porten inn i logginnslaget som én linje —
   «fase-slutt: 14:20–14:31, 11 min». Det er en måling, ikke et løfte; målet
   på ett minutt nås ikke av instruksene alene. Si så hva som skjer: «Nå
   lagrer jeg et sjekkpunkt i git og sender det til GitHub, så arbeidet ikke kan
   gå tapt.» Flerlinjet melding → skriv meldingsfil og bruk
   `git commit -F <fil>`. (Ikke-git-prosjekter: hopp over, men si det.)

   Feiler push — ingen remote, ikke innlogget, avvist — er commiten trygg
   lokalt. Si det i vanlig språk («arbeidet er lagret her, men ikke sendt til
   GitHub»), si hva som må til, og ikke prøv å løse det selv: ingen `--force`,
   ingen endring av remote, ingen innlogging på brukerens vegne.

   Dette steget forutsetter porten øverst: at brukeren kalte skillen. Kom du hit
   uten det, stopp og spør.

8. **Avslutt** med: «FERDIG — klar for /clear. Start neste økt med
   /faseflyt:fase-start.» Er planens faser ferdige: foreslå å flytte
   gjenstående punkter til `TODO.md`.

   **Oppstartsmeldingen som fallback skrives bare når den trengs:** brukeren ber
   om den, eller prosjektet skal fortsettes i et verktøy uten skillen. Den er
   forsikring for et tilfelle som sjelden inntreffer, og koster en kodeblokk hver
   eneste faseslutt. Blir den bedt om, fyll inn konkret:

   ```
   Les kunnskap/STATUS.md og planen i kunnskap/plan.md.
   Fortsett med <konkret neste steg/fase, inkl. valg som alt er tatt>.
   <per-økt-påminnelser som må gjentas — f.eks. personvern-arbeidsflyt
   eller encoding-regler>
   ```

Fast rytme etter dette: brukeren kjører `/clear`, og neste økt starter med
`/faseflyt:fase-start`. `/compact` brukes kun midt i en fase som ikke rekker å
fullføres.
