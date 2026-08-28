# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. `TODO.md` bærer beslutninger og
resonnement. Merkelappen `kjent-før-test` = bevisst utsatt.

**FRIST: samlingen er 14. september 2026.** Under tre uker. Seks grupper,
deltakernes egne maskiner, satt opp på forhånd av BK (Mac + ARM + x86_64).

**TO MASKINER SKRIVER TIL DETTE REPOET.** Kjør `git fetch` og sjekk
`origin/main..HEAD` før du stoler på denne fila — `fase-start` steg 2 stiller bare
lokale spørsmål og ser ikke at remote har gått videre. Observert 2026-08-28: push
avvist, STATUS var overskrevet av en faseslutt fra den andre maskinen.

**Fase:** tørrkjøringen internt er avsluttet (fase 0/1/2 verifisert, fase 3
bevisst ikke kjørt). Siste utgivelse er `faseflyt` **0.5.11** (2026-08-27,
`fd86599`). Ingen pakkeendring siden.

**Pakken er nå målt identisk i cache og repo på BEGGE Windows-maskinene mot
0.5.11:** x86 `VPC-5CG3433WMH` 2026-08-27 (tredje gang der) og ARM `VPC-8WD9VC4`
2026-08-28 (11 filer, 0 avvik, med kontroll som gav avvik). ARM-pre-flighten er
dermed komplett — tre ledd målt 2026-08-27, innhold fil-for-fil dagen etter.
**Køen er ellers tom bak MVP-frysen** — seks av sju åpne issues bærer
`kjent-før-test` (#15, #10, #9, #8, #7, #3). Å ta en av dem er å oppheve frysen:
BKs valg, ikke en oppgave å plukke.

## Neste — start her

**1. Tørrkjøringen. Alle forutsetninger på ARM-maskinen er innfridd.** Case:
«Oppgave 5 — Utstyrsskapet», sitert ordrett i `TODO.md` — **sitatet limes inn
ordrett, det skal IKKE språkvaskes**; det er avstemt mot websiden og er fasit.
**Skal skje i en blank økt i en tom mappe utenfor dette repoet** — en økt som har
lest `plan.md`/`TODO.md` måler seg selv med fasit i hånda. Noter hvert sted du må
forklare noe, hvert sted du venter, og hvert spørsmål du besvarer med kunnskap en
deltaker ikke har.

**2. Mac-pre-flight — viktigste umålte post før fristen.** Helt urørt, og
plattformen flest er på. `kollegatest.md` har alle bokser tomme. Krever en
frivillig Mac; kan ikke gjøres fra en Windows-maskin. **Måleoppskrift** (skriptet
finnes ikke i repoet — se korrigeringen under): sammenlign
`~/.claude/plugins/cache/claude-code-skills/faseflyt/<versjon>/` mot
`plugins/faseflyt/`, fil for fil, med **CRLF→LF og BOM strippet** før hashing, og
**se bort fra `.in_use/`** (hypotese: Claude Codes bokføring over prosesser som
holder versjonen i bruk — ikke verifisert på noen maskin).

## Arbeidsmåte neste økt

- **[en-maaling-per-tur]** *(videreført, femte runde — tørrkjøringen avgjør)* En
  måletur inneholder instruksen og kallet, ingenting annet. Holdt mot en
  flertrinnsmåling 2026-08-28 (fire turer, ett trinn hver); tørrkjøringen er en
  større rigg.
- **[ord-jeg-selv-innfoerer-maa-holdes-mot-tabellen]** *(videreført, ikke prøvd)*
  Et uvanlig ord eller et lån passerer bare hvis det står i klarspråktabellen,
  forklares i samme setning, eller byttes til vanlig norsk. Gjelder chatten,
  overskrifter og teksten som følger et verktøykall.
- **[skriv-maaleskriptet-der-det-kan-gjenbrukes]** *(videreført — brutt
  2026-08-28)* Skal målingen gjentas på en annen maskin, tilby å legge skriptet i
  repoet FØR det kjøres. To av tre maskiner er nå målt med hvert sitt
  engangsskript, så Mac-målingen må skrives fra bunnen igjen.

## Det en ny økt må vite

- **PROMOTERINGSFORSLAG VENTER, trettende runde:**
  `[proev-forslaget-mot-prosjektets-egne-laerdommer]` inn i `CLAUDE.md` under
  `## Målinger`, ut av STATUS. **Krever BKs klarsignal — aldri automatisk.**
- **Ny kandidat til samme sted, ikke bestilt:**
  `[nullavvik-krever-samme-kontroll-som-nullsvar]` — enhver måling som konkluderer
  «ingen forskjell» eller «ingen treff» kjører ett tilfelle som skal gi utslag, i
  samme runde. Regelen finnes alt for renhetsporten (`CLAUDE.md`) og
  `fase-slutt` steg 6, men ikke generelt. Skrevet 2026-08-28; holdt utenfor de
  aktive tre fordi de tre over er mer presserende, ikke fordi den er svakere.
- **Åpent forslag, ikke bestilt:** rad for «derisker» → «fjerner en usikkerhet» i
  klarspråktabellen. BK sa «radene kan bare stå», tolket som *la tabellen være*.
  Sies det noe annet, gjelder både `CLAUDE.md` her og den fulle tabellen i
  `nytt-prosjekt/SKILL.md` — det siste er en pakkeendring.
- **Arkivert i `laering.md`:** `[foer-verdien-maa-fanges-foer-handlingen]`
  (strøket som innarbeidet), `[sett-brukerinstruksen-rett-for-kallet]` (hentes
  tilbake når en måling krever brukerhandling) og
  `[arvet-ordlyd-maa-vaskes-foer-den-limes-inn]` — merk at tørrkjøringens sitat er
  **unntaket** fra den siste: det skal limes ordrett. Skal **ikke** promoteres:
  ratchet-en teller punkter som gjentar seg fordi de ikke følges.
- **Norske commit-meldinger lukker ikke issues.** GitHub kjenner
  `Closes`/`Fixes`/`Resolves`. Bruk `gh issue close` som eget kall.
- **Engangsgodkjenninger brenner målfiler.** Trykker brukeren «Yes», går fila
  gjennom ut økten uansett form. Velg alltid en urørt fil som mål, og si «trykk
  No» rett før kallet. Godkjenninger gjelder én økt.
- **Allowlist-saken er LUKKET.** Sammenhengen mellom `.claude/settings.json` og
  oppstartsdialogene finnes ikke. Noen få valg i oppstarten er greit og sies
  tydelig i dokumentasjonen (BK). Ikke gjenåpne uten ny bestilling. Fila er
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
