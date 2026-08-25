# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. `TODO.md` bærer beslutninger og
resonnement. Merkelappen `kjent-før-test` = bevisst utsatt.

**FRIST: samlingen er 14. september 2026.** Tre uker. Seks grupper, deltakernes
egne maskiner, satt opp på forhånd av BK (Mac + ARM + x86_64).

**Fase:** tørrkjøringen er avsluttet (fase 0/1/2 verifisert, fase 3 bevisst ikke
kjørt). **LEVERT 2026-08-25 (dag), på `VPC-5CG3433WMH`:** `faseflyt` **0.5.9** —
permission-formene er målt, org-leddet er ute av steg 0 i begge skillene, og
grense 10 er ny i `maler.md`.

**Kjørende er 0.5.8, repoet står på 0.5.9.** Neste økt kjører den først etter
`/plugin marketplace update claude-code-skills` + omstart.

**Motbevist 2026-08-25 (dag) — ikke gjenopprett:** teksten om at tilde-form er
påkrevd i Bash. **En sti i et `Bash`-prefiks matcher ikke i det hele tatt.** Full
sti virker, men bærer brukernavnet og kan derfor aldri stå i en mal eller i en
delt `settings.json`. `Read` er motsatt: tilde, full sti og `**` matcher alle.
**Og `.claude/settings.json` leses ikke på nytt midt i en økt** — bare
`settings.local.json` gjør det. Belegg og metode: `logg.md` samme dato.

## Neste — start her

**1. Tørrkjør allowlisten i en tom mappe utenfor dette repoet.** Fortsatt umålt,
og nå med to nye ting å se etter: at malens fire oppføringer skrives riktig, og
at `nytt-prosjekt` faktisk sier fra at de først virker etter omstart. Den ene
endringen som treffer alle seks gruppene.

**2. Mac-pre-flight (helt urørt, plattformen flest er på) og ARM-pre-flight**
(kontor-PC, Snapdragon). `kollegatest.md` har alle bokser tomme. Kritisk vei.
Rekkefølgen for ARM står i `TODO.md` under «Maskinstatus»: `git -C ~/.claude
pull` FØRST, så `/plugin marketplace add`. Denne maskinen er AMD64 — ingen av de
to kan gjøres herfra.

**3. Åpent spørsmål, ingen fiks gjort:** Read-dialogen på `0.5.8/plugin.json` i
oppstarten lot seg ikke gjenskape senere i samme økt. At det var øktens første
kall er en gjetning. Dukker den opp igjen, er den verdt å isolere.

## Arbeidsmåte neste økt

- **[tell-forekomstene-for-du-lover-omfanget]** *(ny)* Søk opp alle forekomster
  av teksten, tallet eller regelen du vil endre FØR du legger fram omfanget —
  ikke etter at det er godkjent.
- **[maal-en-variabel-om-gangen]** *(ny)* Før du ber brukeren måle: sjekk at hver
  variant treffes av nøyaktig én oppføring. En test der to regler dekker samme
  kall måler ingenting.

## Det en ny økt må vite

- **PROMOTERINGSFORSLAG VENTER, åttende runde:**
  `[proev-forslaget-mot-prosjektets-egne-laerdommer]` inn i `CLAUDE.md` under
  `## Målinger`, ut av STATUS. **Krever BKs klarsignal — aldri automatisk.**
- **Dette repoets allowlist ble utvidet samme dag:** lesende sjekker som gjentas
  hver faseslutt står i `.claude/settings.json`, de to org-kallene i full sti i
  `.claude/settings.local.json` (gitignorert, per maskin). `commit` og `push`
  spør fortsatt — det er bevisst.
- **Ingen automatisk sjekk finnes.** Diffen er eneste port. Renhetssjekken kjøres
  fra Bash ETTER `git add`, alltid med ett kontrollsøk som skal gi treff, og
  `claude plugin validate .` ved siden av.
- **Beskrevet omfang er avtalt omfang:** ingen pakke-/mal-/dokumentfil endres
  uten ordlyd-forslag og klarsignal. Pakkeendring = bump BEGGE manifestene +
  `CHANGELOG.md`. Målinger dateres og navngir maskinen.
- **Én person kan ikke fullføre en faseslutt i et nytt `vestfoldfylke`-repo** —
  org-regelsamling `9211483`. Vårt eget repo er fritatt (2026-08-19).
- `kunnskap/` har også `kollegatest.md`, `testplan.md`, `selvbaerende-test.md`.
- `/plugin` og `/permissions` kun i terminalen — ikke i VS Code-utvidelsen.
- Flerlinjede commit-meldinger: meldingsfil + `git commit -F`.
