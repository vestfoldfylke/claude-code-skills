# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. `TODO.md` bærer bare beslutninger
og resonnement. Merkelappen `kjent-før-test` = bevisst utsatt.

**FRIST: samlingen er 14. september 2026.** Tre uker. Seks grupper, deltakernes
egne maskiner, satt opp på forhånd av BK (Mac + ARM + x86_64).

**Fase:** pre-test-batchen levert; **tørrkjøringen har nådd suksesskriteriet —
to faseslutt.** Fase 3 gjenstår, og med den den siste umålte rytmevakten.
**LEVERT 2026-08-25 (natt):** **issue #16** (`fase-slutt` steg 6 mangler positiv
kontroll). **Ingen pakkeendring** — ingen versjonsbump, ingen manifestendring.

**Verifisert på `VPC-5CG3433WMH` (`uname -m: x86_64`, hjemmekontor):** issue #16
opprettet, tittelens `ø` verifisert intakt etterpå, merkelappslista tom som
avtalt. Kjørende = installert = **0.4.1**. Cachen i marketplace-repoet står på
`378a624` mens `origin/main` er nyere — **`/plugin marketplace update` i
terminalen + omstart** når det passer; pakkeversjonen er uendret, så det haster
ikke.

**Tørrkjøringen (`C:\dev\test-utstyrskapet`, nå på `bkaarstein`):** fase 1
verifisert i nettleser, faseslutt nummer to kjørt (`npm run check` 0 feil / 179
filer). **Fase-slutt-vakten fyrte uoppfordret for andre gang** og utførte ikke.
**Ratchet-en er målt i den gunstige retningen** (alle tre punkter fulgt og
strøket) — den vanskelige halvdelen, at et punkt overlever, er umålt der.
Detaljene: `logg.md` 2026-08-25 (natt).

## Neste — start her

**1. Fase 2 i tørrkjøringen, i morgen på hjemmekontor-PC-en.** Oppskriften, delt
i to fordi priming ødelegger målingen (`[selvobservasjon-i-samme-artefakt]`,
issue #11):

- **Skriv bart `/faseflyt:fase-start`** — ingen tilleggsbeskjed. Skillen skal
  foreslå fase 2 selv; sier du «fortsett med fase 2», har du gitt den svaret.
- **Ikke kjør `marketplace update` der først** — fase 0–2 måles på samme pakke.
- **La `.claude/settings.json` ligge ucommittet.** Gratis måling: steg 2 skal
  melde «arbeid STATUS ikke vet om» — en **falsk positiv**, siden fila er
  auto-generert av en permission-godkjenning. Hver kollega får den. Noter ordlyden.
- **Scope-vakten, midt i fase 2:** etter at implementeringen har begynt, før du
  verifiserer. Be naturlig («kan du også …») om én ting som verken står i
  `plan.md` eller `TODO.md` der — f.eks. statistikkside eller mørk modus, om de er
  ledige. De tre postene som alt ligger i `TODO.md` er dårlige valg. **Riktig
  utfall:** foreslår `TODO.md` og fullfører fasen. **Feil i begge retninger:**
  setter i gang, eller avviser uten TODO-sporet.
- **Ved faseslutt nummer tre:** `[pakkekilde-foer-referanse]` kan gjenta seg, siden
  fase 2 bygger UI med Designsystemet — gjør den det og punktet overlever, er
  ratchet-ens vanskelige halvdel målt. `[les-regelen-foer-flagget]` vil trolig
  *ikke* gjenta seg: prosjektet er flyttet til `bkaarstein`, så regelsamlingen som
  utløste den er borte. Strykes den, er det fordi situasjonen forsvant — ikke
  fordi oppførselen ble innarbeidet.
- **Noter, ikke skriv til økten:** vaktens ordlyd, hva steg 2 sa om settings-fila,
  og om `data-size` dukker opp igjen.

**2. Mål `data-size`-premisset** i `node_modules/@digdir/designsystemet-css/dist`
i tørrkjøringsprosjektet. Det avgjør om issuet skal si at `components.md` mangler
noe, eller at linje 1367 ligger der ingen leter. Ikke skriv issuet før dette.

**3. ARM-pre-flight** (kontor-PC, Snapdragon) og **Mac-pre-flight** (helt urørt,
plattformen flest er på). **Kollegatesten er ikke kjørt** — `kollegatest.md` har
alle bokser tomme.

## Arbeidsmåte neste økt

- **[proev-forslaget-mot-prosjektets-egne-laerdommer]** *(fjerde runde — se
  promoteringsforslag)* Før et råd om tilgang, regler eller konfigurasjon: søk i
  `plan.md`, `TODO.md` og `logg.md` etter om det alt er målt. Fulgt tre ganger
  uoppfordret sist; står bare fordi promoteringen venter på klarsignal.
- **[maal-det-maalbare-foer-du-spor]** *(ny, to forekomster samme økt)* Er svaret
  målbart fra denne maskinen, måler jeg det først. Jeg satte `‹maskin›` som luke i
  en issue-tekst og spurte BK — `hostname` var ett kall unna. Og jeg brukte et
  kontrollord fra hukommelsen i sikkerhetssjekken; det fantes ikke, så kontrollen
  ga null treff. **Verifiser kontrollstrengen før du stoler på kontrollen.**
- **[les-status-for-indre-motsigelser]** *(ny)* Jeg leser STATUS'
  verifisert-påstander mot dens egen neste-liste før jeg kvitterer. Linje 22 og
  linje 29 motsa hverandre i en fil jeg nettopp hadde lest i sin helhet.

## Det en ny økt må vite

- **PROMOTERINGSFORSLAG VENTER, nå fjerde runde:**
  `[proev-forslaget-mot-prosjektets-egne-laerdommer]` inn i `CLAUDE.md` under
  «Målinger og språk», ut av STATUS. Mønsteret er nå målt i begge retninger —
  brutt den ene økten det var strøket, fulgt tre ganger da det sto. **Krever BKs
  klarsignal** — aldri automatisk.
- **`[les-status-for-indre-motsigelser]` er også et pakkefunn:** `fase-start` har
  ingen sjekk av STATUS mot seg selv. Ligger nær issue #15 og hører antakelig som
  kommentar der framfor eget issue. Tilbudt, ikke opprettet.
- **Toppnivået fyrer, men issuene lander ikke:** fase 0 i tørrkjøringen tilbød et
  issue som aldri ble opprettet, og `data-size`-issuet er nå også utsatt. Forslag
  produseres pålitelig; landingen er køen.
- **Én person kan ikke fullføre en faseslutt i et nytt `vestfoldfylke`-repo** —
  org-regelsamling `9211483`, `--admin` feiler på samme regel den skal omgå. Vårt
  eget repo er fritatt (2026-08-19). Tørrkjøringsprosjektet er flyttet til
  `bkaarstein` for å komme rundt det.
- **Cache-posten i `TODO.md` er IKKE lukket** — ARM-leddet er umålt.
- **`claude plugin validate` leser BARE manifester** — derfor det ellevte søket.
- **Ingen automatisk port finnes.** Diffen er eneste port, også etter 1.0.
  Renhetsporten kjøres fra Bash ETTER `git add`, alltid med én positiv kontroll.
- Beskrevet omfang er avtalt omfang: ingen pakke-/mal-/dokumentfil endres uten
  ordlyd-forslag og klarsignal. Målinger dateres og navngir maskinen.
- `kunnskap/` har også `kollegatest.md`, `testplan.md`, `selvbaerende-test.md`.
- `/plugin` og `/permissions` kun i terminalen — ikke i VS Code-utvidelsen.
- Flerlinjede commit-meldinger: meldingsfil + `git commit -F`.
