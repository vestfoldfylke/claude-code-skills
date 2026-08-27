# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. `TODO.md` bærer beslutninger og
resonnement. Merkelappen `kjent-før-test` = bevisst utsatt.

**FRIST: samlingen er 14. september 2026.** Under tre uker. Seks grupper,
deltakernes egne maskiner, satt opp på forhånd av BK (Mac + ARM + x86_64).

**Fase:** tørrkjøringen internt er avsluttet (fase 0/1/2 verifisert, fase 3
bevisst ikke kjørt). Siste utgivelse er `faseflyt` **0.5.11** (2026-08-27,
`fd86599`). Ingen utgivelse i forrige økt.

**Køen er tom bak frysen.** Seks av sju åpne issues bærer `kjent-før-test` (#15,
#10, #9, #8, #7, #3) — det er MVP-frysen (BK 2026-08-19: ikke bygg mer før testen
er gjort). **Å ta et av dem er å oppheve frysen — BKs valg, ikke en oppgave å
plukke.**

## Neste — start her

**1. Tørrkjøringen: 28. august på kontormaskinen `VPC-8WD9VC4`, sammen med en
kollega.** Case: «Oppgave 5 — Utstyrsskapet», sitert ordrett i `TODO.md`. **Skal
skje i en blank økt i en tom mappe utenfor dette repoet** — en økt som har lest
`plan.md`/`TODO.md` måler seg selv med fasit i hånda.

**FØR den starter: den maskinen kjørte 0.5.10, repoet står på 0.5.11.** Kjør
`/plugin marketplace update` **og start Claude Code på nytt** — en kjørende
prosess beholder versjonen den startet med. Les versjonene FØRST.

**2. Innholdssammenligning cache mot repo på `VPC-8WD9VC4`** — aldri gjort der;
kun versjonsnummer er målt på ARM. Egen tur, ikke slått sammen med punkt 1.
Gjort tre ganger på hjemme-PC-en `VPC-5CG3433WMH` (0.2.1, 0.4.0, 0.5.11 —
0 avvik hver gang). Oppskrift, siden skriptet lå i scratchpad og er borte:
sammenlign `~/.claude/plugins/cache/claude-code-skills/faseflyt/<versjon>/` mot
`plugins/faseflyt/` i repoet, fil for fil. **Normaliser CRLF til LF og strip BOM**
(`[IO.File]::ReadAllText` gjør det siste) før hashing, ellers falske avvik.
**Se bort fra `.in_use/`** — cachen har filer der som repoet ikke har (hypotese:
Claude Codes egen bokføring over prosesser som holder versjonen i bruk).

**3. Mac-pre-flight — viktigste umålte post før fristen.** Helt urørt, og
plattformen flest er på. `kollegatest.md` har alle bokser tomme. Krever en
frivillig Mac; kan ikke gjøres fra en Windows-maskin.

## Arbeidsmåte neste økt

- **[en-maaling-per-tur]** *(videreført, siste runde — tørrkjøringen avgjør)* En
  måletur inneholder instruksen og kallet, ingenting annet. Forrige økt avstod
  fra en billig tilleggsmåling; holder det i morgen, strykes punktet.
- **[ord-jeg-selv-innfoerer-maa-holdes-mot-tabellen]** *(ny)* Et uvanlig ord eller
  et lån passerer bare hvis det står i klarspråktabellen, forklares i samme
  setning, eller byttes til vanlig norsk. Gjelder chatten, overskrifter og teksten
  som følger et verktøykall — der «derisker» lakk gjennom tre ganger.
- **[skriv-maaleskriptet-der-det-kan-gjenbrukes]** *(ny)* Skal målingen gjentas på
  en annen maskin, tilby å legge skriptet i repoet FØR det kjøres — ikke etterpå.

## Det en ny økt må vite

- **PROMOTERINGSFORSLAG VENTER, trettende runde:**
  `[proev-forslaget-mot-prosjektets-egne-laerdommer]` inn i `CLAUDE.md` under
  `## Målinger`, ut av STATUS. **Krever BKs klarsignal — aldri automatisk.**
- **Åpent forslag, ikke bestilt:** rad for «derisker» → «fjerner en usikkerhet» i
  klarspråktabellen. BK sa «radene kan bare stå», tolket som *la tabellen være*.
  Sies det noe annet, gjelder både `CLAUDE.md` her og den fulle tabellen i
  `nytt-prosjekt/SKILL.md` — det siste er en pakkeendring.
- **Arkivert i `laering.md`:** `[sett-brukerinstruksen-rett-for-kallet]` (hentes
  tilbake når en måling krever brukerhandling) og
  `[foer-verdien-maa-fanges-foer-handlingen]` (strøket som innarbeidet — steg 0 og
  måleskriptets før-blokk bærer den nå). Skal **ikke** promoteres: ratchet-en
  teller punkter som gjentar seg fordi de ikke følges.
- **Norske commit-meldinger lukker ikke issues.** GitHub kjenner
  `Closes`/`Fixes`/`Resolves`, ikke «Lukker #16». Bruk `gh issue close` som eget
  kall. Observert 2026-08-27.
- **Engangsgodkjenninger brenner målfiler.** Trykker brukeren «Yes», går fila
  gjennom ut økten uansett form. Velg alltid en urørt fil som mål, og si «trykk
  No» rett før kallet. Godkjenninger gjelder én økt.
- **Allowlist-saken er LUKKET.** Sammenhengen mellom `.claude/settings.json` og
  oppstartsdialogene finnes ikke. Noen få valg i oppstarten er greit og sies
  tydelig i dokumentasjonen (BK). Ikke gjenåpne uten ny bestilling. Fila er
  tracket og endres av hver godkjenning — kjent falsk positiv i `fase-start`
  steg 2. Les diffen framfor å anta; en absolutt brukersti der havner hos alle.
- `kunnskap/` har også `kollegatest.md`, `testplan.md`, `selvbaerende-test.md`.
- `/plugin` og `/permissions` kun i terminalen — ikke i VS Code-utvidelsen.
