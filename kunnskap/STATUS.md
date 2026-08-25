# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. `TODO.md` bærer beslutninger og
resonnement. Merkelappen `kjent-før-test` = bevisst utsatt.

**FRIST: samlingen er 14. september 2026.** Tre uker. Seks grupper, deltakernes
egne maskiner, satt opp på forhånd av BK (Mac + ARM + x86_64).

**Fase:** pakken er testbar og tørrkjøringen har passert suksesskriteriet.
**LEVERT 2026-08-25 (kveld), på `VPC-5CG3433WMH`:** fire utgivelser —
`faseflyt` **0.5.0** (utdatakontrakt: rapporter avvik, ikke gjennomføring),
**0.5.1** (scope-vakten hardet), **0.5.2** (`.claude/settings.json` som kjent
falsk positiv) og `web-prototype` **0.1.1** (`<ds-button>`-motsigelsen).
Renhetsporten kjørt foran hver push: 11 søk · 0 feil, positiv kontroll.
Arbeidstreet er rent. **Alle tre rytmevakter er nå målt.**

## Neste — start her

**1. Tørrkjøringens faseslutt nummer tre** (`C:\dev\test-utstyrskapet`, egen økt).
Fase 2 er verifisert i nettleseren. **Fase 3 skal ikke kjøres** — beslutning BK.
Ved selvvurderingen der: `[pakkekilde-foer-referanse]` skal **presiseres**, ikke
strykes og ikke promoteres («referansefila først; pakkens CSS når fila ikke
svarer») — belegget er `data-variant`-episoden i loggen. Og
`[les-regelen-foer-flagget]`: si eksplisitt om den strykes fordi oppførselen
sitter, eller fordi org-regelsamlingen forsvant med flyttingen til `bkaarstein`.

**2. Etterpå: `/plugin marketplace update claude-code-skills` i terminalen +
omstart.** Sperren gjaldt kun til faseslutt tre var i havn. Merk at
scope-vakt-hardningen ikke når prosjekter som alt er scaffoldet.

**3. Mac-pre-flight (helt urørt, plattformen flest er på) og ARM-pre-flight**
(kontor-PC, Snapdragon). `kollegatest.md` har alle bokser tomme. Dette er
kritisk vei for samlingen; fase 3 i tørrkjøringen var det ikke.

**4. `data-size`-premisset** er fortsatt umålt i
`node_modules/@digdir/designsystemet-css/dist`. Ikke skriv issuet før det.

## Arbeidsmåte neste økt

- **[proev-forslaget-mot-prosjektets-egne-laerdommer]** *(femte runde — se
  promoteringsforslag)* Før et råd om tilgang, regler eller konfigurasjon: søk i
  `plan.md`, `TODO.md` og `logg.md` etter om det alt er målt eller avgjort.
- **[still-spoersmaal-som-tar-ja-som-svar]** *(ny)* Jeg formulerer spørsmål slik
  at «ja» bare kan bety én ting. «Juster ordlyden!» kunne bety både *rediger fila*
  og *endre forslaget* — fordi jeg spurte «si fra hvis den skal justeres».
- **[tell-forekomster-ikke-omtaler]** *(ny)* Teller jeg belegg, teller jeg
  hendelser. Jeg meldte «tre forekomster» der det var to prosjekter; den tredje
  var samme fil nevnt om igjen.

## Det en ny økt må vite

- **PROMOTERINGSFORSLAG VENTER, femte runde:**
  `[proev-forslaget-mot-prosjektets-egne-laerdommer]` inn i `CLAUDE.md` under
  «Målinger og språk», ut av STATUS. **Krever BKs klarsignal — aldri automatisk.**
- **Umålt hypotese:** virker `Read(~/...)` i en permission-matcher? Neste
  fase-start er testen — leses manifestene uten prompt, virker tilde-formen.
  Feiler den, er konsekvensen bare en forespørsel.
- **Ingen automatisk port finnes.** Diffen er eneste port. Renhetsporten kjøres
  fra Bash ETTER `git add`, alltid med én positiv kontroll, og
  `claude plugin validate .` ved siden av.
- **Beskrevet omfang er avtalt omfang:** ingen pakke-/mal-/dokumentfil endres
  uten ordlyd-forslag og klarsignal. Pakkeendring = bump BEGGE manifestene +
  `CHANGELOG.md`. Målinger dateres og navngir maskinen.
- **Én person kan ikke fullføre en faseslutt i et nytt `vestfoldfylke`-repo** —
  org-regelsamling `9211483`. Vårt eget repo er fritatt (2026-08-19).
- `kunnskap/` har også `kollegatest.md`, `testplan.md`, `selvbaerende-test.md`.
- `/plugin` og `/permissions` kun i terminalen — ikke i VS Code-utvidelsen.
- Flerlinjede commit-meldinger: meldingsfil + `git commit -F`.
