# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. `TODO.md` bærer beslutninger og
resonnement. Merkelappen `kjent-før-test` = bevisst utsatt.

**FRIST: samlingen er 14. september 2026.** Tre uker. Seks grupper, deltakernes
egne maskiner, satt opp på forhånd av BK (Mac + ARM + x86_64).

**Fase:** tørrkjøringen er avsluttet (fase 0/1/2 verifisert, fase 3 bevisst ikke
kjørt). **LEVERT 2026-08-25 (natt), på `VPC-5CG3433WMH`:** `faseflyt` **0.5.6**
(steg 0 lukker godkjenningshullet), **0.5.7** (allowlist inn i malen) og **0.5.8**
(faseslutten sier hva økten leverte). Renhetssjekken og
`claude plugin validate .` kjørt foran hver push.

**Kjørende er 0.5.7, installert er 0.5.8** — 0.5.8 ble skrevet etter omstarten.
Neste økt kjører den først etter `/plugin marketplace update` + ny omstart.

**Målt og avgjort:** kolon-prefiksformen matcher der eksakt-form ikke gjør det.
Samme `ls-remote`-kall ga dialog i eksakt-form og ingen dialog etter omleggingen,
i samme økt. Tilde-form er like påkrevd som før — og gjelder også stier skillen
selv oppgir absolutt.

## Neste — start her

**1. Tørrkjør allowlisten i en tom mappe utenfor dette repoet.** 0.5.7 la seks
lesende oppføringer i `.claude/settings.json`-malen. At `nytt-prosjekt` skriver
dem riktig, og at oppstarten i det nye prosjektet så går uten dialoger, er
**skrevet, ikke målt**. Dette er den ene endringen som treffer alle seks
gruppene, så den bør måles før samlingen.

**2. Mac-pre-flight (helt urørt, plattformen flest er på) og ARM-pre-flight**
(kontor-PC, Snapdragon). `kollegatest.md` har alle bokser tomme. Kritisk vei.
Rekkefølgen for ARM står i `TODO.md` under «Maskinstatus»: `git -C ~/.claude
pull` FØRST, så `/plugin marketplace add`. Denne maskinen er AMD64 — ingen av de
to kan gjøres herfra.

**3. `fase-slutt`s utdatakontrakt — LUKKET i 0.5.8, men umålt.** Skillen krever
nå en kort «levert i denne runden»-del før stegrapporteringen, og at stegene
kommer i sin egen rekkefølge. Teksten er skrevet etter tre observasjoner, men
**aldri kjørt** — første måling er neste faseslutt som kjører 0.5.8.

## Arbeidsmåte neste økt

- **[ikke-rapporter-utfall-du-ikke-kan-se]** *(ny)* Rapporter bare det
  verktøysvarene faktisk viser. Utfall bare brukeren kan se — dialoger, hva
  skjermen viste — spørres om eller utelates.
- **[flytt-regelen-dit-den-leses]** *(ny)* Foreslår jeg en regel: sjekk i samme
  åndedrag om den lastes der den skal virke. Er svaret nei, er plasseringen
  fiksen — ikke teksten.
- **[skriv-forbud-som-treffer-bare-det-du-mener]** *(ny)* Et forbud rettes mot
  betydningen, ikke bokstavene. Søk om ordet har en annen bruk i prosjektet som
  skal beholdes.

## Det en ny økt må vite

- **PROMOTERINGSFORSLAG VENTER, sjuende runde:**
  `[proev-forslaget-mot-prosjektets-egne-laerdommer]` inn i `CLAUDE.md` under
  `## Målinger`, ut av STATUS. **Krever BKs klarsignal — aldri automatisk.**
- **Språkreglene står nå i `CLAUDE.md` som tekst, ikke som henvisning.** De
  gjelder chatten og teksten som følger hvert verktøykall, ikke bare filene.
  `port` er beholdt som repoets ord om det som må passeres før `main`.
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
