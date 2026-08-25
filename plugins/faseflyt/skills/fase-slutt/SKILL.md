---
name: fase-slutt
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

## Hva du skriver i chatten

Rapporter **avvik, ikke gjennomføring**. Et steg som gikk rent får én linje i en
samlelinje, ikke egen seksjon; et steg som fant noe får plassen funnet trenger.

**Unntaket er steg 5 og 6.** Der er rapporten selve belegget, og den skal alltid
si hva som ble kjørt og hva som skjedde. Kort, men konkret: «`npm run check`: 0
feil / 179 filer» framfor et avsnitt. Å stryke den rapporten er å gjøre sjekken
formelt til stede og reelt borte.

Dette gjelder utskriften, ikke arbeidet: hvert steg kjøres som før.

Fasen er ferdig (eller økten avsluttes). Gjør følgende, i rekkefølge:

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

2. **Selvvurdering** (læringssløyfen — skrives til fil, ikke bare chat):
   a. **Evaluer forrige økts punkter** i STATUS `## Arbeidsmåte neste økt`:
      ble hvert punkt fulgt? Innarbeidede punkter strykes; punkter som ikke ble
      fulgt videreføres.
   b. Tell gjentakelser via stikkordsetikettene i `kunnskap/laering.md`: et
      punkt som har stått i **tre påfølgende faseslutt** er en manglende regel —
      foreslå å skrive den permanent inn i prosjektets `CLAUDE.md` og fjerne
      den fra STATUS.
   c. Skriv 1–3 **nye** handlingsbare punkter, hver med stabil
      stikkordsetikett (`[explore-delegering]`-stil) og konkret belegg — dekk
      både prosess/token-bruk og kodekvalitet/framgangsmåte. «Kunne vært mer
      effektiv» er ikke et punkt.
   d. Før alt som datert innslag øverst i `kunnskap/laering.md`, og legg de
      aktive punktene i STATUS (maks 3). **Ikke gjengi dem i chatten** — de
      skrives til fil nettopp for å overleve `/clear`, og en opplesning i
      tillegg er samme tekst to ganger. Én linje om hvor de ble ført, og hva
      som ble strøket eller promotert, holder.
   e. **Gjelder et punkt arbeidsflyten selv** (skillene, ikke prosjektet):
      tilby å opprette et issue i `vestfoldfylke/claude-code-skills`
      (`gh issue create`). Issue-teksten skal beskrive arbeidsflytproblemet og
      ALDRI prosjektets data — ingen persondata, secrets, interne URL-er eller
      sensitive prosjektdetaljer — og brukeren skal se og godkjenne teksten før
      kommandoen kjøres.

3. **STATUS:** Overskriv `kunnskap/STATUS.md` (maks ~30 linjer): fase og
   tilstand, hva som er verifisert, gjenstående med konkret neste steg,
   kritiske filer, `## Arbeidsmåte neste økt` (fra steg 2), og det en ny økt MÅ
   vite for å fortsette uten å utforske kodebasen. STATUS skal være SELVBÆRENDE
   for `fase-start`: `**Plan:** kunnskap/plan.md` rett under tittelen, peker
   til `TODO.md`, per-økt-påminnelser i STATUS eller prosjektets CLAUDE.md.
   Hold den skarp — historikk hører hjemme i loggen.
   (Mangler `kunnskap/` eller `kunnskap/plan.md`: opprett mappen/filene; en
   godkjent plan som bare finnes under `~/.claude/plans/` kopieres inn som
   `kunnskap/plan.md` NÅ — den originale er en engangsartikkel.)

4. **Er noe i `TODO.md` avklart av det som ble gjort nå?** Finnes `TODO.md`,
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
   jobb. I git-prosjekter:
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

   **Meld hva du kjørte og hva du fant**, ikke «sjekk utført»: brukeren skal kunne
   se hvilke søk som faktisk ble gjort. Skaler etter prosjekttype — for
   dokumentasjonsprosjekter er persondata-sjekken hovedsaken. Utenfor git: samme
   sjekker med vanlig filsøk i prosjektmappen.

   **Vær ærlig om hva dette er.** Sjekken er en instruks du følger, ikke en regel
   noe håndhever — den kan overses, i motsetning til `deny`-reglene. Behandler
   prosjektet persondata, er `.gitignore` og deny-settet førstelinjen; denne
   sjekken er et nett under, ikke i stedet for.

7. **Commit og push** med beskrivende melding. Flerlinjet melding → skriv
   meldingsfil og bruk `git commit -F <fil>`. (Ikke-git-prosjekter: hopp over,
   men si det.) Dette steget forutsetter porten øverst: at brukeren kalte
   skillen. Kom du hit uten det, stopp og spør.

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
