# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`

**Fase:** midt i **ordlydsgjennomgang av samlingsmaterialet** (BK gjennomgår,
jeg retter). Pakken er ikke lenger fryst: `faseflyt` **0.2.2** (klarspråkrunden,
se CHANGELOG). `main` = `095a1c1` + faseslutt-commiten.

**Maskiner:** hjemme `VPC-5CG3433WMH` (AMD64), kontor `VPC-8WD9VC4` (ARM64).
PS 5.1, ingen `pwsh`. CLI: `~\.local\bin\claude.exe`, ikke alltid på PATH. Sjekk
hostname først. **Uavklart:** om kontor-PC-en fortsatt har gammelt oppsett — kan
bare avgjøres PÅ den maskinen. **Neste økt fortsetter hjemme.**

**Verifisert 2026-08-20 (hjemme):** installert pakke = repoet — 0.2.2,
`gitCommitSha 4b64670`, **0 avvik på alle 10 filer**, én oppføring per plugin,
`~/.claude/skills|commands` tomme. Renhetssjekk 10 søk / 0 feil og
`claude plugin validate .` ✔ på hver commit.

**Umålt, skal stå som umålt:** Mac, ARM/kontor-PC-en, webapp-/dokumentasjons-/
API-typene, verifiseringspunkt 9 og 10, `pull_request`-triggeren i CI.
**Punkt 5 er droppet.**

## Neste — start her

1. **Fortsett ordlydsgjennomgangen av websiden** (privat Artifact-lenke, kilde i
   `kunnskap/lokalt/vaffelvakta.html`). BK har gitt to runder funn: «porten»,
   `økt`, «rytmen», hvordan man kommer i planmodus, og at `/clear` og tre andre
   rader manglet et **hvorfor**. Alt er rettet. **Åpent spørsmål BK ikke har
   svart på:** skal designsporet («Vil dere dele dere?») inn på websiden også,
   eller holder vi siden til hoveddelen?
2. **Websiden ligger to ordlydsrunder FORAN arket og `.docx`-en.** De har ennå
   «Det er dere som er porten», mangler `økt`-raden og har den gamle
   `/clear`-teksten. Bevisst holdt tilbake til ordlyden er godkjent, så de tre
   kopiene pusses én gang. `.docx`-en bygges med
   `kunnskap/lokalt/build-docx.ps1` fra `oppgavelapper.md` — endre kilden, kjør
   scriptet, ikke rediger `.docx`-en.
3. **To VURDERINGSPUNKTER øverst i `TODO.md` — gjennomgås i detalj med BK, rettes
   ikke på eget initiativ.** (a) `nytt-prosjekt` steg 6 mangler «ikke
   overskriv»-klausulen; kravet er at installasjon aldri overskriver noe hos en
   kollega. (b) Ordlyd. To utformede pakkefikser ligger i kø bak (a).
4. **Tørrkjør Oppgave 6, Utstyrsskapet** — blank økt, tom mappe utenfor repoet.
   Bestillingen står ordrett i `TODO.md`.
5. **Actions:** BK snakker med utviklerne. Målt: `actions/permissions` →
   `enabled: false`, så workflowen er inert. Spørsmålene ligger i `TODO.md`.

## Arbeidsmåte neste økt

- **[beskrevet-omfang-er-avtalt-omfang]** *(2. gang — ble ikke fulgt)* Beskrivelse
  er ikke avtale. Sier bestillingen «litt ekstra» og du ser at en full omskriving
  er riktig, **stopp og spør** — ikke beskriv og skriv i samme trekk. Belegg: BK ba
  om å «raffinere oppgavene litt ekstra»; jeg skrev om hele Ark 2, la til ordliste,
  endret alle seks bestillingene og la inn en ny seksjon, i én `Write` rett etter
  diagnosen.
- **[artefakter-divergerer-uten-eier]** Samme tekst i flere kopier divergerer innen
  én økt. Enten generér de andre fra én kilde, eller verifiser likhet mekanisk i
  samme runde. Belegg: ordlisten endte i tre kopier, og jeg skapte selv et avvik på
  to rader — oppdaget bare av en mekanisk sammenligning. Gjelder AKUTT nå: websiden
  ligger to runder foran arket.
- **[scratchpad-er-ikke-lagring]** Leveranser hører i prosjektet, aldri i øktens
  scratchpad. Belegg: jeg målte selv at en scratchpad-sti fra 18.08 var slettet, og
  la likevel websidens kildefil og byggescriptet der. Flyttet til
  `kunnskap/lokalt/` før avslutning.

## Det en ny økt må vite

- **Målinger er datert, også de i `plan.md`, `TODO.md` og STATUS.** *(Fulgt i fem
  påfølgende faseslutt.)* **Og en måling av «installert = repoet» dør i det du
  pusher** — vi gjorde vår egen usann i samme økt. Endrer du pakken: kjør
  `/plugin marketplace update claude-code-skills` og mål om.
- **Mål cache mot repo med linjeskift normalisert** — cachen er CRLF, repoet LF,
  så byte-hashing gir falske avvik (meldte 10 der 9 var reelle). Legg alltid ved en
  kontroll som viser at søket kan feile.
- **Hardening er AV, review droppet fram til 1.0** (BK 19.08). Pakkeendring går
  rett på `main`. Bump **begge** manifestene — `marketplace.json` ble glemt sist.
- **Porten er `bash .github/renhet/sjekk.sh` + `claude plugin validate .`** — kjør
  ETTER `git add`, og fra Bash-verktøyet: `bash` finnes ikke på PATH i PowerShell,
  og `$LASTEXITCODE` gir da en falsk «exit 0». Ti søk, kun trackede filer.
- **Klarspråk er nå TO tabeller** i `nytt-prosjekt/SKILL.md`: erstatning («si
  dette, ikke dette») og **forklaring** (arbeidsflytordene, som skal brukes men
  forklares første gang). Ordliste er svakere enn forklaring på stedet.
- **Arbeidsdokumenter holdes lokale:** `kunnskap/lokalt/` og
  `kunnskap/*.docx|xlsx|pptx|pdf` er gitignorert. `/plugin marketplace add` er en
  `git clone` av HELE repoet, så alt tracket havner hos hver kollega.
- **Renhetsregler:** personnavn, maskinnavn og private repo-referanser er tillatt i
  `kunnskap/`. Søk brukerstier **generisk**. `fint` = null treff i
  `plugins/faseflyt/`, tillatt i `plugins/fint-graphql/`.
- **Deny-runden er lukket** — grense-listen 1–9 i `maler.md` er kanonisk.
  PreToolUse-hooken er ikke på kritisk vei for samlingen.
- **Maskinlokale tillatelser i `.claude/settings.local.json`** (gitignorert).
  `/plugin` og `/permissions` finnes ikke i VS Code-chatten; bruk terminalen.
  Flerlinjede commit-meldinger: skriv meldingsfil og bruk `git commit -F`.
