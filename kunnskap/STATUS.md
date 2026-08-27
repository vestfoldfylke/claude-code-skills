# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. `TODO.md` bærer beslutninger og
resonnement. Merkelappen `kjent-før-test` = bevisst utsatt.

**FRIST: samlingen er 14. september 2026.** Under tre uker. Seks grupper,
deltakernes egne maskiner, satt opp på forhånd av BK (Mac + ARM + x86_64).

**Fase:** tørrkjøringen er avsluttet (fase 0/1/2 verifisert, fase 3 bevisst ikke
kjørt). Siste utgivelse er `faseflyt` **0.5.9** (2026-08-25). **Øktene 26. og
27. august ga ingen utgivelse — de målte.**

## Allowlist-saken er LUKKET — ikke gjenåpne uten ny bestilling

**Målt 2026-08-27 på `VPC-8WD9VC4` (kontor-PC, Snapdragon X Elite, ARM64, VS
Code-utvidelsen). Belegg: `logg.md` 2026-08-27, begge innslag.**

**Allowlisten er ikke det som bestemmer.** Tolv `Bash`-kall i én faseslutt, alle
fire dialogene fotografert, så fraværet av dialog er like målt som treffene: to
oppføringer som matcher ordrett ga dialog, mens `hostname` og `git push` — som
ikke står i fila — gikk rett gjennom. Det setter Bash-funnet fra 2026-08-26 i
tvil og svekker samtidig «`settings.json` er inert».

**Beslutning (BK, godkjenninger ved oppstart):** noen få godkjenninger i
oppstarten er greit og skal bare sies tydelig i dokumentasjonen. Det som ikke er
greit er at lavterskel lesing maser gjennom hele økten — og det kriteriet er
innfridd: samtlige `Read`-kall i økten gikk gjennom uten dialog, og dialogene kom
for å kjøre et script, kjøre en binær, et grep med secret-ord i mønsteret, og
`git commit`. Fire valg i en hel faseslutt.

**Derfor utgår fil-mot-omstart-riggen** som sto her. Den var verdifull bare så
lenge malens allowlist var eneste vern mot maset. **Umålt og skal stå som umålt:**
hvorfor `Bash(bash .github/renhet/sjekk.sh)` og `Bash(claude plugin validate:*)`
ikke matcher, og om `settings.json` er inert for `Read`.

## Neste — start her

**1. Ordlyd-forslag til BK: si i dokumentasjonen at oppstarten koster noen
godkjenninger.** Eneste pakkeendring beslutningen over medfører — README under
«Vanlige spørsmål» og `nytt-prosjekt` steg 6. Poenget som skal fram: noen
dialoger kommer, valget «allow for this project» gjør dem varige, og lesing maser
ikke. **Krever klarsignal før noen fil endres.**

**2. Mac-pre-flight** (helt urørt, plattformen flest er på, og fristen er nær).
`kollegatest.md` har alle bokser tomme. Kan ikke gjøres fra denne maskinen.

**3. Tørrkjør i en tom mappe utenfor dette repoet.** Fortsatt umålt. Henger ikke
lenger på allowlisten — den er lukket.

*`settings.local.json` er gitignorert, finnes bare på denne maskinen, og sto ved
øktslutt med tre linjer. Den kan ryddes ved anledning; den måler ikke lenger noe.*

## Arbeidsmåte neste økt

- **[en-maaling-per-tur]** *(ny)* En måletur inneholder instruksen og kallet —
  ingenting annet. Oppsett, filskriving og begrunnelse hører i turen før, og
  brukeren får si fra når det er klart.
- **[nullresultat-maa-ha-en-entydig-aarsak]** *(ny)* Før riggen kjøres: skriv ned
  hva hvert mulige utfall kan tilskrives. Har «ingen dialog» to årsaker, er det
  ingen måling — fjern en arm først.
- **[sett-brukerinstruksen-rett-for-kallet]** *(videreført, utilstrekkelig alene)*
  Instruksen står på egen linje rett før kallet — men plassering hjelper ikke hvis
  turen også bærer annet arbeid.

## Det en ny økt må vite

- **PROMOTERINGSFORSLAG VENTER, tiende runde:**
  `[proev-forslaget-mot-prosjektets-egne-laerdommer]` inn i `CLAUDE.md` under
  `## Målinger`, ut av STATUS. **Krever BKs klarsignal — aldri automatisk.**
- **Engangsgodkjenninger brenner målfiler.** Trykker brukeren «Yes», går fila
  gjennom ut økten uansett form. Velg alltid en urørt fil som mål, og si «trykk
  No» rett før kallet. Godkjenninger gjelder én økt — etter omstart er alle
  målemål friske igjen, også `hjelp/SKILL.md`, som ble brent 2026-08-27.
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
