# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. `TODO.md` bærer bare beslutninger
og resonnement. Merkelappen `kjent-før-test` = bevisst utsatt.

**FRIST: samlingen er 14. september 2026.** Tre uker. Seks grupper, deltakernes
egne maskiner, satt opp på forhånd av BK (Mac + ARM + x86_64).

**Fase:** pre-test-batchen levert; **tørrkjøringen er i gang og halvveis.**
**LEVERT 2026-08-24 (natt):** `378a624` — `fallgruver.md` fikk
`[selvobservasjon-i-samme-artefakt]`, **faseflyt 0.4.1**, issue #11 lukket.

**Verifisert på `VPC-5CG3433WMH` (`uname -m: x86_64`):** porten kjørt (11 søk · 0
feil · 0 advarsler, positiv kontroll 37 treff; `claude plugin validate .` ✔).
Cache mot repo: 11 filer, 0 avvik — **positiv kontroll mot 0.4.0 ga 2 avvik,
presis de to filene commiten rørte.** Kjørende = installert = repo = **0.4.1**.

**Tørrkjøringen (`C:\dev\test-utstyrskapet`, nå på `bkaarstein`):** fase 0
verifisert i nettleser, faseslutt nummer én kjørt. **To av tre umålte påstander
observert** («nytt prosjekt» og `web-prototype` trigger av seg selv). **Alle tre
rytmevaktene målt i begge retninger.** Læringssløyfen lukket ende til ende utenfor
dette repoet. Detaljene: `logg.md` 2026-08-24 (natt).

## Neste — start her

1. **Fase 1 + faseslutt nummer to i tørrkjøringen** (BK, eget prosjekt).
   Suksesskriteriet er minst to faseslutt. **Scope-vakten er den eneste uprøvde** —
   be om noe utenfor fasen midt i fase 1.
2. **Issue om org-regelsamlingen** — teksten ligger klar til godkjenning, se under.
3. **ARM-pre-flight** (kontor-PC, Snapdragon) og **Mac-pre-flight** (helt urørt,
   plattformen flest er på). **Kollegatesten er ikke kjørt** — protokollen i
   `kollegatest.md` har alle bokser tomme.

## Arbeidsmåte neste økt

- **[proev-forslaget-mot-prosjektets-egne-laerdommer]** *(gjentakelse — se
  promoteringsforslag)* Før et råd om tilgang, regler eller konfigurasjon: søk i
  `plan.md`, `TODO.md` og `logg.md` etter om det alt er målt. Jeg anbefalte
  `gh pr merge --admin`; svaret sto i `plan.md` fra 2026-08-18.
- **[begrensning-er-ikke-det-samme-som-hull]** *(ny)* Melder jeg hva en måling
  ikke dekket, sier jeg den smaleste sanne versjonen. Jeg gjorde «ett svar gikk
  ikke mot anbefalingen» til «grillingen ble ikke målt»; BK korrigerte.
- **[bruker-er-kilden-for-tilgangsfakta]** *(ny)* Pakkens oppførsel måler jeg selv;
  organisasjonens oppsett og BKs rettigheter spør jeg om først. Fem `gh api`-kall
  ble avvist, og svaret kom i én setning.

## Det en ny økt må vite

- **PROMOTERINGSFORSLAG VENTER:** `[proev-forslaget-mot-prosjektets-egne-laerdommer]`
  har stått i tre påfølgende faseslutt. Forslag: inn i `CLAUDE.md` under «Målinger
  og språk», ut av STATUS. **Krever BKs klarsignal** — aldri automatisk.
- **NYTT FUNN, ikke `kjent-før-test`:** et nytt repo i `vestfoldfylke` arver
  org-regelsamling `9211483` (`pull_request` + `non_fast_forward`,
  `require_last_push_approval`, tomme bypass-aktører). **Én person kan ikke
  fullføre en faseslutt alene** — `--admin` feiler på samme regel den skal omgå.
  `fase-slutt` steg 7 antar push rett på `main`. Vårt eget repo er fritatt
  (2026-08-19), så vi har målt unntaket og lest det som normalen.
- **Cache-posten i `TODO.md` er IKKE lukket** — ARM-leddet er umålt.
- **`claude plugin validate` leser BARE manifester** — derfor det ellevte søket.
- **Ingen automatisk port finnes.** Diffen er eneste port, også etter 1.0.
  Renhetsporten kjøres fra Bash ETTER `git add`, alltid med én positiv kontroll.
- Beskrevet omfang er avtalt omfang: ingen pakke-/mal-/dokumentfil endres uten
  ordlyd-forslag og klarsignal. Målinger dateres og navngir maskinen.
- `kunnskap/` har også `kollegatest.md`, `testplan.md`, `selvbaerende-test.md`.
- `/plugin` og `/permissions` kun i terminalen — ikke i VS Code-utvidelsen.
- Flerlinjede commit-meldinger: meldingsfil + `git commit -F`.
