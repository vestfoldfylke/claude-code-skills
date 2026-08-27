# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. `TODO.md` bærer beslutninger og
resonnement. Merkelappen `kjent-før-test` = bevisst utsatt.

**FRIST: samlingen er 14. september 2026.** Under tre uker. Seks grupper,
deltakernes egne maskiner, satt opp på forhånd av BK (Mac + ARM + x86_64).

**Fase:** tørrkjøringen er avsluttet (fase 0/1/2 verifisert, fase 3 bevisst ikke
kjørt). Siste utgivelse er `faseflyt` **0.5.10** (2026-08-27, `a4cc111`).

**Verifisert 2026-08-27 på `VPC-8WD9VC4` (kontor-PC, Snapdragon X Elite, ARM64,
VS Code-utvidelsen): 0.5.10 kjører på ARM-maskinen.** Alle tre ledd observert —
før-verdi 0.5.9 begge steder, `/plugin marketplace update` + omstart, og
`/faseflyt:hjelp` oppga basekatalogen `…\faseflyt\0.5.10\…`. Belegg: `logg.md`
2026-08-27 (sent kveld). Ikke gjenta denne målingen på denne maskinen.

**Allowlist-saken er LUKKET — ikke gjenåpne uten ny bestilling.** Sammenhengen
mellom `.claude/settings.json` og oppstartsdialogene finnes ikke; tolv `Bash`-kall
med alle fire dialogene fotografert viste at ordrette treff ga dialog mens
udekkede kall gikk gjennom. **Beslutning (BK, godkjenninger ved oppstart):** noen
få valg i oppstarten er greit og skal bare sies tydelig i dokumentasjonen — og
lavterskel lesing maser ikke, samtlige `Read`-kall gikk rene. Belegg: `logg.md`
2026-08-27, begge innslag. **Umålt og skal stå som umålt:** hvorfor
`Bash(bash .github/renhet/sjekk.sh)` og `Bash(claude plugin validate:*)` ikke
matcher, og om `settings.json` er inert for `Read`.

## Neste — start her

**1. Tørrkjør i en tom mappe utenfor dette repoet.** Nå den billigste
gjenstående. **Skal skje i en blank økt** — en økt som har lest
`plan.md`/`TODO.md` måler seg selv med fasit i hånda, så åpne Claude Code i en
tom scratch-mappe framfor å `/clear` her. Casen ligger som sitat i `TODO.md`
(«Oppgave 5 — Utstyrsskapet»), avstemt ordrett mot websiden.

**2. Mac-pre-flight — viktigste umålte post før fristen.** Helt urørt, og
plattformen flest er på. `kollegatest.md` har alle bokser tomme. Kan ikke gjøres
fra denne maskinen; krever en frivillig Mac.

*Cachen har nå `0.2.1`, `0.5.9` og `0.5.10` side om side — oppdateringen legger til
framfor å rydde. Ikke et avvik. `settings.local.json` er gitignorert, finnes bare
på denne maskinen, og kan ryddes ved anledning; den måler ikke lenger noe.*

## Arbeidsmåte neste økt

- **[en-maaling-per-tur]** *(videreført, ikke presset ennå)* En måletur inneholder
  instruksen og kallet — ingenting annet. Oppsett, filskriving og begrunnelse hører
  i turen før, og brukeren får si fra når det er klart.
- **[foer-verdien-maa-fanges-foer-handlingen]** *(ny)* Før en handling som skal
  måles: skriv ned dagens verdi — også når handlingen føles opplagt nok til å hoppe
  over det. Uten før-verdi kan «virket» ikke skilles fra «sto der alt».
- **[sett-brukerinstruksen-rett-for-kallet]** *(videreført, ikke prøvd i forrige
  økt)* Instruksen står på egen linje rett før kallet — men plassering hjelper ikke
  hvis turen også bærer annet arbeid.

## Det en ny økt må vite

- **PROMOTERINGSFORSLAG VENTER, elvte runde:**
  `[proev-forslaget-mot-prosjektets-egne-laerdommer]` inn i `CLAUDE.md` under
  `## Målinger`, ut av STATUS. **Krever BKs klarsignal — aldri automatisk.**
- **Arkivert i `laering.md`, ikke i STATUS:**
  `[maalekallet-laster-ogsaa-instruksen]` — bruker du et skill-kall som
  måleinstrument, si hvilken del av instruksen du bevisst ikke følger. Falt ut på
  maks-tre-grensen, så neste faseslutt teller den ikke.
- **Engangsgodkjenninger brenner målfiler.** Trykker brukeren «Yes», går fila
  gjennom ut økten uansett form. Velg alltid en urørt fil som mål, og si «trykk
  No» rett før kallet. Godkjenninger gjelder én økt — etter omstart er alle
  målemål friske igjen.
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
