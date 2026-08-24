---
name: fase-start
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

Gjør følgende, i rekkefølge:

0. **Sjekk at pakken er oppdatert — raskt, og aldri blokkerende.** Tre
   versjoner kan sprike: den økten kjører, den som er installert, og den som
   ligger i org-repoet.
   - *Kjørende:* les `version` i `.claude-plugin/plugin.json` to nivåer over
     denne skillens basekatalog (katalogen står i kallet).
   - *Installert:* les `version` i
     `~/.claude/plugins/marketplaces/claude-code-skills/plugins/faseflyt/.claude-plugin/plugin.json`.
   - *Org-repoet:* sammenlign `git -C
     ~/.claude/plugins/marketplaces/claude-code-skills rev-parse HEAD` med
     `git -C <samme mappe> ls-remote origin main`.

   Er installert nyere enn kjørende: si det, og be brukeren lukke og starte
   Claude Code på nytt når økten er ferdig — en kjørende prosess beholder
   versjonen den startet med. Er org-repoet nyere enn installert: foreslå
   `/plugin marketplace update claude-code-skills` i terminalen (ikke i VS
   Code-chatten), og omstart etterpå. Får du ikke lest en fil eller nådd
   nettet: si det i én setning og fortsett — sjekken skal aldri stoppe en økt.
   Den sammenligner versjonsnummer og commit, ikke innhold — den er et varsel,
   ikke en port. (Cache-oppbygningen den leser er observert på våre maskiner,
   ikke dokumentert kontrakt — derfor den myke feilingen.)

1. Les `kunnskap/STATUS.md`. Finnes den ikke: IKKE gjett — si fra og spør om
   prosjektet skal settes opp med fase-arbeidsflyten (`nytt-prosjekt`-skillen).

2. **Ble forrige økt avsluttet?** STATUS beskriver den økten som sist kjørte
   `fase-slutt`. Ble en økt avbrutt — lukket lokk, møte, glemt — beskriver STATUS
   en eldre tilstand enn den du står i, og stegene under stoler blindt på den.
   I et prosjekt med git, spør om to ting:

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

   Gir én av dem treff: si det tydelig — «det ligger arbeid her som STATUS ikke
   vet om, så forrige økt ble trolig ikke avsluttet med `fase-slutt`» — og tilby
   å oppsummere hva som faktisk er gjort, fra endringene og de commitene, før
   økten fortsetter. **Aldri automatisk opprydding, commit eller `git checkout`**
   — brukeren bestemmer hva som skjer med det ucommittede.

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

3. Les `kunnskap/plan.md`. Finnes den ikke, følg `**Plan:**`-linjen i STATUS.
   Peker den på en fil som ikke finnes (typisk en gammel
   `~/.claude/plans/`-sti): si det tydelig og tilby å rekonstruere
   `kunnskap/plan.md` fra STATUS + logg — ikke lat som planen finnes. Les også
   `TODO.md` hvis den finnes. `logg.md` og `laering.md` leses KUN hvis STATUS
   er uklar om noe du trenger akkurat nå.

4. IKKE utforsk kodebasen for ting STATUS/planen allerede svarer på. Trengs
   utforskning senere i økten: deleger til Explore-subagent — bare konklusjonen
   inn i hovedtråden.

5. Oppsummer kort i chatten: fase/tilstand, hva som er verifisert, og foreslå
   ETT konkret neste steg (inkludert valg som allerede er tatt — ikke gjenåpne
   dem). Har brukeren gitt en tilleggsbeskjed, er det den som gjelder.

6. **Kvitter på `## Arbeidsmåte neste økt`** i STATUS: gjenta hvert punkt som en
   konkret forpliktelse for denne økten («Denne økten: …»), ikke bare
   gjengivelse. Dette er læringssløyfens andre halvdel — punktene ble skrevet av
   forrige `fase-slutt` og evalueres av neste.

7. Gjengi per-økt-påminnelser fra STATUS («Det en ny økt må vite») og
   prosjektets `CLAUDE.md` — f.eks. personvern-arbeidsflyt eller
   encoding-regler.

8. VENT på klarsignal fra brukeren før du begynner på arbeidet — med mindre
   tilleggsbeskjeden alt er en klar arbeidsordre; da setter du i gang med den.

## Eldre prosjekter (tåles alltid)

Prosjekter satt opp med tidligere versjoner kan mangle `laering.md`,
`## Arbeidsmåte neste økt` og relativ planpeker. Håndter det uten å feile:
mangler en seksjon, hopp over det tilhørende steget. Tilby ÉN gang å oppgradere
(opprett `laering.md`, flytt planen til `kunnskap/plan.md`, legg til
STATUS-seksjonene) — aldri automatisk; brukeren bestemmer.
