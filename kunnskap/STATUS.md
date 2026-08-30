# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. `TODO.md` bærer beslutninger og
resonnement. Merkelappen `kjent-før-test` = bevisst utsatt.

**FRIST: samlingen er 14. september 2026.** To uker. Seks grupper, deltakernes
egne maskiner, satt opp på forhånd av BK (Mac + ARM + x86_64).

**TO MASKINER SKRIVER TIL DETTE REPOET.** Kjør `git fetch` og sammenlign med
`origin/main` før du stoler på denne fila — `fase-start` steg 2 stiller bare
lokale spørsmål og ser ikke at remote har gått videre. Observert 2026-08-28: push
avvist, STATUS var overskrevet av en faseslutt fra den andre maskinen.

**Fase:** siste utgivelse er `faseflyt` **0.5.12** (2026-08-30, `703ef89`):
`model: sonnet` på fase-slutt og fase-start, og fase-slutt samler turene (steg
6-søkene parallelt, filskrivingene i steg 1–3 samlet). **Effekten er umålt.**
**Begge maskinene må kjøre `/plugin marketplace update claude-code-skills` +
omstart** før versjonen virker — en kjørende prosess beholder sin versjon.

**Tørrkjøringene er gjennomført**, i to repoer utenfor dette:
`bkaarstein/test-utstyrskapet` (x86, 24.–25.08) og
`bkaarstein/test-oppgave-samling` (ARM, 28.08 — nytt prosjekt fra bunnen på
0.5.11, tre verifiserte faseslutt). Verifiseringsporten holdt i begge. Funnene som
angår pakkene: logg 2026-08-30. **Køen er ellers tom bak MVP-frysen** — seks av
sju åpne issues bærer `kjent-før-test`. Å ta en av dem er å oppheve frysen: BKs
valg, ikke en oppgave å plukke.

## Neste — start her

**1. Mac-pre-flight — viktigste umålte post før fristen.** Helt urørt, og
plattformen flest er på. `kollegatest.md` har alle bokser tomme. Krever en
frivillig Mac; kan ikke gjøres fra en Windows-maskin. **Måleoppskrift:**
sammenlign `~/.claude/plugins/cache/claude-code-skills/faseflyt/<versjon>/` mot
`plugins/faseflyt/`, fil for fil, med **CRLF→LF og BOM strippet** før hashing, og
**se bort fra `.in_use/`** (hypotese: Claude Codes bokføring over prosesser som
holder versjonen i bruk — ikke verifisert på noen maskin). **Legg skriptet i
repoet før det kjøres** — to maskiner er alt målt med hvert sitt engangsskript.

**2. Venter på BK — ikke oppgaver å plukke:** ordlyd-forslag for to utdaterte
punkter i `web-prototype` (logg 2026-08-30); fortetting av de gjennomførte
tørrkjøring-postene i `TODO.md` (forslag lagt fram 2026-08-30, ikke utført); og
om «Oppgave 5»-sitatet fortsatt skal måles mot fasit i en blank økt — ARM-økten
dekket flyten, men ikke deltaker-friksjonen.

## Arbeidsmåte neste økt

- **[deleger-lesing-av-fremmede-repoer]** *(ny)* Klon og les et fremmed repo
  gjennom en Explore-subagent, ikke i hovedtråden. Trengs ordrette sitater til
  loggen, be agenten om dem.
- **[ny-regel-maa-avgrenses-mot-den-den-ligner-paa]** *(ny)* Skriver du en ny
  instruks i pakken som ligner på en disiplin som alt gjelder, si i teksten hva
  som skiller dem — leseren er en økt ingen av oss ser.
- **[ord-jeg-selv-innfoerer-maa-holdes-mot-tabellen]** *(videreført — brutt
  2026-08-30 med «frontmatter» uforklart i CHANGELOG)* Et uvanlig ord eller et lån
  passerer bare hvis det står i klarspråktabellen, forklares i samme setning,
  eller byttes til vanlig norsk.

## Det en ny økt må vite

- **PROMOTERINGSFORSLAG VENTER, fjortende runde:**
  `[proev-forslaget-mot-prosjektets-egne-laerdommer]` inn i `CLAUDE.md` under
  `## Målinger`, ut av STATUS. **Krever BKs klarsignal — aldri automatisk.**
  Samme sted venter `[nullavvik-krever-samme-kontroll-som-nullsvar]`: enhver
  måling som konkluderer «ingen forskjell» eller «ingen treff» kjører ett tilfelle
  som skal gi utslag, i samme runde.
- **`[en-maaling-per-tur]` er arkivert som aktivt punkt, ikke opphevet.** Sjette
  runde uten å bli satt på prøve. Gjelder fortsatt en flertrinnsmåling der
  utfallet av ett trinn avgjør det neste — det er noe annet enn de parallelle
  søkene 0.5.12 innførte i `fase-slutt` steg 6.
- **Norske commit-meldinger lukker ikke issues.** GitHub kjenner
  `Closes`/`Fixes`/`Resolves`. Bruk `gh issue close` som eget kall.
- **Engangsgodkjenninger brenner målfiler.** Trykker brukeren «Yes», går fila
  gjennom ut økten uansett form. Velg alltid en urørt fil som mål, og si «trykk
  No» rett før kallet. Godkjenninger gjelder én økt.
- **Allowlist-saken er LUKKET.** Sammenhengen mellom `.claude/settings.json` og
  oppstartsdialogene finnes ikke. Ikke gjenåpne uten ny bestilling. Fila er
  tracket og endres av hver godkjenning — kjent falsk positiv i `fase-start`
  steg 2. Les diffen framfor å anta; en absolutt brukersti der havner hos alle.
- **Ingen automatisk sjekk finnes.** Diffen er eneste port. Renhetssjekken kjøres
  fra Bash ETTER `git add`, alltid med ett kontrollsøk som skal gi treff, og
  `claude plugin validate .` ved siden av.
- **Beskrevet omfang er avtalt omfang:** ingen pakke-/mal-/dokumentfil endres
  uten ordlyd-forslag og klarsignal. Pakkeendring = bump BEGGE manifestene +
  `CHANGELOG.md`. Målinger dateres og navngir maskinen.
- `kunnskap/` har også `kollegatest.md`, `testplan.md`, `selvbaerende-test.md`.
- `/plugin` og `/permissions` kun i terminalen — ikke i VS Code-utvidelsen.
- Flerlinjede commit-meldinger: meldingsfil + `git commit -F`.
