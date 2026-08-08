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
overstyrer i så fall forslaget ditt i steg 4) følger med kallet.

Gjør følgende, i rekkefølge:

1. Les `kunnskap/STATUS.md`. Finnes den ikke: IKKE gjett — si fra og spør om
   prosjektet skal settes opp med fase-arbeidsflyten (`nytt-prosjekt`-skillen).

2. Les `kunnskap/plan.md`. Finnes den ikke, følg `**Plan:**`-linjen i STATUS.
   Peker den på en fil som ikke finnes (typisk en gammel
   `~/.claude/plans/`-sti): si det tydelig og tilby å rekonstruere
   `kunnskap/plan.md` fra STATUS + logg — ikke lat som planen finnes. Les også
   `TODO.md` hvis den finnes. `logg.md` og `laering.md` leses KUN hvis STATUS
   er uklar om noe du trenger akkurat nå.

3. IKKE utforsk kodebasen for ting STATUS/planen allerede svarer på. Trengs
   utforskning senere i økten: deleger til Explore-subagent — bare konklusjonen
   inn i hovedtråden.

4. Oppsummer kort i chatten: fase/tilstand, hva som er verifisert, og foreslå
   ETT konkret neste steg (inkludert valg som allerede er tatt — ikke gjenåpne
   dem). Har brukeren gitt en tilleggsbeskjed, er det den som gjelder.

5. **Kvitter på `## Arbeidsmåte neste økt`** i STATUS: gjenta hvert punkt som en
   konkret forpliktelse for denne økten («Denne økten: …»), ikke bare
   gjengivelse. Dette er læringssløyfens andre halvdel — punktene ble skrevet av
   forrige `fase-slutt` og evalueres av neste.

6. Gjengi per-økt-påminnelser fra STATUS («Det en ny økt må vite») og
   prosjektets `CLAUDE.md` — f.eks. personvern-arbeidsflyt eller
   encoding-regler.

7. VENT på klarsignal fra brukeren før du begynner på arbeidet — med mindre
   tilleggsbeskjeden alt er en klar arbeidsordre; da setter du i gang med den.

## Eldre prosjekter (tåles alltid)

Prosjekter satt opp med tidligere versjoner kan mangle `laering.md`,
`## Arbeidsmåte neste økt` og relativ planpeker. Håndter det uten å feile:
mangler en seksjon, hopp over det tilhørende steget. Tilby ÉN gang å oppgradere
(opprett `laering.md`, flytt planen til `kunnskap/plan.md`, legg til
STATUS-seksjonene) — aldri automatisk; brukeren bestemmer.
