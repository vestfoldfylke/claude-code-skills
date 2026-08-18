---
name: fase-slutt
description: >-
  Avslutter en fase eller økt i et faseinndelt prosjekt: oppdaterer logg og
  STATUS, skriver selvvurdering til læringsloggen, kjører kvalitetsport og
  sikkerhetsrøyktest, committer og klargjør for /clear. Brukes når en fase er
  ferdig og verifisert av brukeren, eller når en økt avsluttes midt i en fase.
  Triggere: «fase-slutt», «avslutt fasen», «avslutt økten», «end the phase»,
  «wrap up this session».
---

# Fase-slutt

**Porten: denne skillen kjøres BARE når brukeren har bedt om den.** At brukeren
bekrefter en verifisering («verifisert, alt OK») er ikke en bestilling — da
foreslår du fase-slutt og venter (fase-slutt-vakten i prosjektets `CLAUDE.md`).
Grunnen er steg 6: det committer og pusher uten eget klarsignal, og det er bare
forsvarlig når det var brukeren som kalte skillen.

**Sjekk porten før du begynner, den er observerbar:** finn meldingen der brukeren
ba om dette — `/faseflyt:fase-slutt`, «avslutt fasen» eller tilsvarende. Finner du
den ikke, ble du utløst av en vakt eller av eget initiativ. Stopp da her, si at
porten er nådd, foreslå kommandoen og vent. Ikke utfør stegene «for hånd» i stedet
— det er samme handling uten porten. Dette har gått galt to ganger i test (rutinen
kjørte helt gjennom og committet uten å spørre), så behandle det som en kjent
felle: er du i tvil, spør før du gjør noe.

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
   hypotese, med hvilken probe som ville avgjort den. En overskrift skal ikke
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
   d. Før alt som datert innslag øverst i `kunnskap/laering.md`, legg de aktive
      punktene i STATUS (maks 3), og vis dem i chatten.
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

4. **Kvalitetsport:** Kjør prosjektets egen sjekk — bygg/typecheck/tester slik
   de er definert i prosjektets `CLAUDE.md` eller `package.json`. Finnes ingen:
   hopp over og si det eksplisitt. Feiler den: IKKE commit stille — rapporter
   resultatet og la brukeren avgjøre. Før resultatet i loggen, slik at
   «fase X ✅» faktisk betyr noe.

5. **Sikkerhetsrøyktest** (røyktest, ikke review — full gjennomgang gjøres med
   `/security-review` som egen jobb). I git-prosjekter:
   - `git ls-files` skal ikke vise andre env-filer enn `.env.example`
   - `git grep` etter 11-sifrede tall (fødselsnummer) og `client_secret` i
     tracked filer — kjente eksempelverdier i dokumentasjon er OK
   Utenfor git: samme sjekker med vanlig filsøk i prosjektmappen. Skaler etter
   prosjekttype: for dokumentasjonsprosjekter er persondata-sjekken hovedsaken.

6. **Commit og push** med beskrivende melding. Flerlinjet melding → skriv
   meldingsfil og bruk `git commit -F <fil>`. (Ikke-git-prosjekter: hopp over,
   men si det.) Dette steget forutsetter porten øverst: at brukeren kalte
   skillen. Kom du hit uten det, stopp og spør.

7. **Avslutt** med: «FERDIG — klar for /clear. Start neste økt med
   /faseflyt:fase-start.» Er planens faser ferdige: foreslå å flytte
   gjenstående punkter til `TODO.md`. Legg ved en oppstartsmelding i kodeblokk
   som FALLBACK for økter i verktøy uten skillen (fyll inn konkret):

   ```
   Les kunnskap/STATUS.md og planen i kunnskap/plan.md.
   Fortsett med <konkret neste steg/fase, inkl. valg som alt er tatt>.
   <per-økt-påminnelser som må gjentas — f.eks. personvern-arbeidsflyt
   eller encoding-regler>
   ```

Fast rytme etter dette: brukeren kjører `/clear`, og neste økt starter med
`/faseflyt:fase-start`. `/compact` brukes kun midt i en fase som ikke rekker å
fullføres.
