---
name: fase-start
model: sonnet
description: >-
  Starter en ny økt i et faseinndelt prosjekt: leser STATUS og plan, kvitterer
  på arbeidsmåte-korrigeringer, oppsummerer nåsituasjonen og foreslår neste
  steg. Brukes som FØRSTE handling i en ny økt. Triggere: «fase-start», «start
  økten», «ny økt», «start a phase», «resume the project», «pick up where we
  left off».
---

# Fase-start

Ny økt i et faseinndelt prosjekt. Brukerens tilleggsbeskjed (kan være tom, og
overstyrer i så fall forslaget ditt i steg 5) følger med kallet.

## Hva du skriver i chatten

Rapporter **avvik, ikke gjennomføring**. Et steg som ikke fant noe får ingen egen
seksjon — det nevnes med noen få ord i åpningslinja, eller ikke i det hele tatt.
Et steg som fant noe får den plassen funnet trenger.

Normaltilfellet — alt rent — er én linje: «Faseflyt <versjon> kjørende og
installert, forrige økt avsluttet, plan lest.» Så rett på nåsituasjon og neste
steg (steg 5).

**Tak: høyst ti linjer i det rene tilfellet, telles i tørrkjøringen — ikke
anslås.** Planen har detaljene, gjenta dem ikke. Målt: 0.6.1 lå på ~15 linjer
for samme tilfelle.

Dette gjelder utskriften, ikke arbeidet: hvert steg kjøres som før.

## Kall som ikke skal koste en godkjenning

Steg 0 og 2 er de eneste stegene som leser utenfor prosjektmappa eller kaller
git, og de kjøres i hver eneste økt. To skrivemåter gjør dem dyre for brukeren:

- **Bruk tilde-form** (`~/.claude/...`) i `Read`. Full brukersti matcher like
  godt, men kan ikke stå i en delt `settings.json` — den bærer brukernavnet.
- **Ett kall per kommando.** To allowlistede kommandoer slått sammen med `&&`
  eller `;` matcher ingen av dem.
- **Aldri en sti i et `Bash`-prefiks.** `Bash(git status:*)` matcher;
  `Bash(git -C ~/... rev-parse:*)` gjør det ikke, og formen som virker bærer
  brukernavnet. Trenger du git mot en annen katalog, koster det en godkjenning
  — derfor gjør stegene under det ikke.

Målt 2026-08-25 på `VPC-5CG3433WMH`, hver form isolert mot en kontrollinje som
skulle gå gjennom. Teksten som sto her sa at tilde-form var påkrevd også i
Bash; det er motbevist, ikke utelatt.

Gjør følgende, i rekkefølge:

Før kallene i steg 0 og 2: én linje til brukeren om hva som kommer — «Først to
raske sjekker: at pakken er oppdatert, og at forrige økt ble avsluttet ordentlig.
Det er noen lesekommandoer mot git; ingen av dem endrer noe.» Deretter kommer
resultatlinja fra utdatakontrakten over. Normaltilfellet er altså to linjer:
hva som sjekkes, og at alt var rent.

0. **Sjekk at pakken er oppdatert — raskt, og aldri blokkerende.** To
   versjoner kan sprike: den økten kjører, og den som er installert.
   - *Kjørende:* les `version` i `.claude-plugin/plugin.json` to nivåer over
     denne skillens basekatalog (katalogen står i kallet). **Basekatalogen
     oppgis absolutt** — skriv den om til tilde-form
     (`~/.claude/plugins/cache/...`) før du leser, ellers koster kallet en
     godkjenning selv når allowlisten dekker fila.
   - *Installert:* les `version` i
     `~/.claude/plugins/marketplaces/claude-code-skills/plugins/faseflyt/.claude-plugin/plugin.json`.

   Er installert nyere enn kjørende: si det, og be brukeren lukke og starte
   Claude Code på nytt når økten er ferdig — en kjørende prosess beholder
   versjonen den startet med. Får du ikke lest en fil: si det i én setning og
   fortsett — sjekken skal aldri stoppe en økt. Den sammenligner
   versjonsnummer, ikke innhold — den er et varsel, ikke en port.
   (Cache-oppbygningen den leser er observert på våre maskiner, ikke
   dokumentert kontrakt — derfor den myke feilingen.)

   **Org-repoet sjekkes ikke herfra.** Det krever git mot en annen katalog, og
   den formen koster en godkjenning i hver økt hos hver bruker (se over).
   `/plugin marketplace update claude-code-skills` kjøres i terminalen ved
   behov — README svarer på hvordan under «Vanlige spørsmål».

1. Les `kunnskap/STATUS.md`. Finnes den ikke: IKKE gjett — si fra og spør om
   prosjektet skal settes opp med fase-arbeidsflyten (`nytt-prosjekt`-skillen).

2. **Ble forrige økt avsluttet?** STATUS beskriver den økten som sist kjørte
   `fase-slutt`. Ble en økt avbrutt — lukket lokk, møte, glemt — beskriver STATUS
   en eldre tilstand enn den du står i, og stegene under stoler blindt på den.
   I et prosjekt med git, spør om tre ting:

   - *Ucommittet arbeid:* `git status --porcelain`. Ikke tomt = det ligger
     endringer her STATUS ikke vet om.
   - *Arbeid ingen faseslutt har oppsummert:* finn commiten som sist rørte
     loggen, og se hva som kom etter:

     ```
     git log -1 --format=%H -- kunnskap/logg.md
     git log --oneline <commiten>..HEAD
     ```

     `fase-slutt` skriver logg og committer i samme runde, så alt etter den
     commiten er arbeid som ikke er loggført.

   - *Har noen pushet siden sist?* Finnes en remote: `git fetch`, deretter
     `git rev-list --count HEAD..@{u}`. Er tallet over 0, har en annen maskin
     eller person pushet etter din siste økt, og STATUS på disk kan være
     foreldet — si det, og tilby `git pull` FØR du leser videre. Feiler
     kommandoene (ingen remote, ingen nett, ingen upstream): si det i én
     setning og fortsett. Observert 2026-08-28 på `VPC-8WD9VC4`: STATUS var
     overskrevet på remote før økten begynte, og de to spørsmålene over er
     lokale og kunne ikke se det.

   Gir ett av de to første treff: si det tydelig — «det ligger arbeid her som
   STATUS ikke vet om, så forrige økt ble trolig ikke avsluttet med `fase-slutt`»
   — og tilby å oppsummere hva som faktisk er gjort, fra endringene og de
   commitene, før økten fortsetter. **Aldri automatisk opprydding, commit eller `git checkout`**
   — brukeren bestemmer hva som skjer med det ucommittede.

   **Kjent falsk positiv: `.claude/settings.json`.** Fila er tracket — pakken
   skriver den ved oppsett — og enhver permission-godkjenning endrer den. Er
   den eneste ucommittede endringen, og berører den bare `permissions`, er det
   nesten alltid en godkjenning fra forrige økt og ikke uavsluttet arbeid.
   Nevn den i én linje og la brukeren avgjøre; ikke behandle den som funn.
   Observert i to prosjekter 2026-08-25. **Ser du en absolutt brukersti i
   linjene, si fra:** fila følger med i klonen, så stien havner hos alle som
   henter prosjektet.

   Kantene — de to første er målt 2026-08-24, og begge gir **stille** feil:

   - **Gir første kommando tom verdi**, er `logg.md` aldri committet. Ikke kjør
     den andre: `..HEAD` er gyldig git-syntaks som betyr `HEAD..HEAD` og svarer
     tomt uten å feile. Da er *alle* commits uloggførte — si det i stedet.
   - **Ikke bruk datoformen** `git log --since=<dato fra logg.md>`.
     `--since=2026-08-24` ga 0 treff mens seks commits fra samme dag fantes: git
     tolker en bar dato som er i dag som «nå», ikke som midnatt
     (`--since='2026-08-24 00:00'` ga 6). Blindsonen ligger på dagen sjekken
     oftest kjøres.
   - Ikke et git-prosjekt, eller ingen `kunnskap/logg.md`: hopp over steget i
     stillhet.

3. Les `kunnskap/plan.md`. **Er den lang (over ~150 linjer), les ikke hele:**
   finn fasene med `Grep` etter `### Fase`, og les `## Avklarte beslutninger` og
   fasene fra gjeldende fase og utover med `Read` og `offset`. Kontekst og
   ferdige faser står i loggen om de trengs. Finnes ikke planen, følg
   `**Plan:**`-linjen i STATUS. Peker den på en fil som ikke finnes (typisk en
   gammel `~/.claude/plans/`-sti): si det tydelig og tilby å rekonstruere
   `kunnskap/plan.md` fra STATUS + logg — ikke lat som planen finnes.
   `TODO.md` leses bare når STATUS peker dit for neste steg, eller når planens
   faser er ferdige — ikke som rutine. `logg.md` og `laering.md` leses KUN hvis
   STATUS er uklar om noe du trenger akkurat nå.

4. IKKE utforsk kodebasen for ting STATUS/planen allerede svarer på. Trengs
   utforskning senere i økten: deleger til Explore-subagent — bare konklusjonen
   inn i hovedtråden.

5. Oppsummer fase/tilstand i **én linje** — navn og status, ikke gjenfortalt
   innhold, planen har resten — hva som er verifisert, og foreslå ETT konkret
   neste steg (inkludert valg som allerede er tatt — ikke gjenåpne dem). Har
   brukeren gitt en tilleggsbeskjed, er det den som gjelder.

   **Gjengi fasens `**Verifisering:**`-linje fra planen ordrett.** Det er det
   økten skal ende i, og det brukeren skal se før fasen kan avsluttes — begge
   skal vite det før arbeidet starter.

   **Modell-instruksen står alene som siste linje i svaret, uthevet og
   formulert som handling** — aldri en påstand om hva økten kjører på. Ut fra
   planens beskrivelse av fasen: mekanisk implementering → «**Skriv `/model
   sonnet` nå, før du gir klarsignal.**»; planendring, arkitektur eller
   sikkerhetskritisk → samme setning med tyngste modell. Ingen begrunnelse,
   ingen linjer etter denne. Skillen kan ikke bytte for brukeren, og kan ikke
   vite hva økten faktisk kjører på — bare en instruks plassert som siste
   handling blir fulgt. Belegg: linja lå tidligere midt i teksten og ble ikke
   handlet på; én gang påsto den «Sonnet» mens økten sto på Opus.

   **Kommandoformen er den som gir Sonnet.** Skriver brukeren
   `/faseflyt:fase-start` direkte, kjører *denne skillen* på sitt eget
   `model: sonnet`-felt, uansett hva økten ellers står på. Slås skillen i
   stedet inn av en frase i vanlig tekst («start økten», «ny økt» …), kjører
   den på øktens gjeldende modell. Det er derfor instruksen over aldri
   kan påstå hva som skjer etterpå — den vet i beste fall om seg selv, ikke om
   økten som fortsetter etter den.

   **Per-økt-påminnelser fra STATUS («Det en ny økt må vite») og prosjektets
   `CLAUDE.md` gjengis ikke som liste.** Du har lest dem, og brukeren skrev dem.
   Nevn den ene som er relevant for steget du foreslår — behandler prosjektet
   persondata og neste steg rører data, sier du det der og da. Ellers ingenting.

6. **Kvitter på `## Arbeidsmåte neste økt`** i STATUS: gjenta hvert punkt som en
   konkret forpliktelse for denne økten («Denne økten: …»), ikke bare
   gjengivelse. **Én linje per punkt, maks tre** — forpliktelsen er poenget, ikke
   utbroderingen. Dette er læringssløyfens andre halvdel — punktene ble skrevet
   av forrige `fase-slutt` og evalueres av neste.

7. VENT på klarsignal fra brukeren før du begynner på arbeidet — med mindre
   tilleggsbeskjeden alt er en klar arbeidsordre; da setter du i gang med den.

## Eldre prosjekter (tåles alltid)

Prosjekter satt opp med tidligere versjoner kan mangle `laering.md`,
`## Arbeidsmåte neste økt` og relativ planpeker, og på Windows kan
encoding-snutten stå i STATUS i stedet for CLAUDE.md (flyttet i 0.6.1). Håndter
det uten å feile: mangler en seksjon, hopp over det tilhørende steget. Tilby ÉN
gang å oppgradere (opprett `laering.md`, flytt planen til `kunnskap/plan.md`,
legg til STATUS-seksjonene, flytt Windows-snutten til CLAUDE.md) — aldri
automatisk; brukeren bestemmer.
