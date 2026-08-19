# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md` (les «Nytt 2026-08-19»)

**`kunnskap/` er nå i git (PR #14)** — felles for alle maskiner. Ikke lag lokale
varianter, ikke gjenopprett gitignoren.

**Fase:** synkingen fra issue #8 er **ferdig, begge steg**. faseflyt **0.2.1**
konsistent i begge manifester, `claude plugin validate .` ✔ exit 0. **Ingen kjente
åpne defekter.** PR #12, #13 og #14 merget; `main` = `578dc95` + denne commiten.

**Maskiner:** hjemme `VPC-5CG3433WMH` (AMD64), kontor `VPC-8WD9VC4` (ARM64).
**Begge ferdig satt opp og verifisert**, ingen duplikater på disk. PS 5.1, ingen
`pwsh`. CLI: `~\.local\bin\claude.exe`, ikke alltid på PATH. Sjekk hostname først.

**Umålt, skal stå som umålt:** webapp-, dokumentasjons- og API-typene; Mac;
punkt 9 og 10. **Punkt 5 er droppet** — se loggen, ikke gjenoppliv den.

## Neste — start her

1. **CI-sjekk for renhetskravene** (`TODO.md`). Høyest verdi: hardening er av og
   review droppet fram til 1.0, så det finnes ingen port mellom en commit og
   kollegaers `/plugin marketplace update`.
2. **Punkt 9 (overtakelsestest)** — riggen `prosjekt-a` lå i forrige økts
   scratchpad, som er øktspesifikk og borte. Må rigges på nytt.
3. **Tre `faseflyt`-oppføringer** i `claude plugin list` (1 user + 2 project, alle
   enabled) — uforklart, se loggen. Duplikater var det ryddejobben skulle fjerne.

Resten (slett `master` i synk-repoet, Mac-frivillig, issue #9) ligger i `TODO.md`.

## Arbeidsmåte neste økt

- **[todo-er-datert-observasjon-ikke-tilstand]** *(2. gang — står den igjen ved
  neste faseslutt, hører den permanent i `CLAUDE.md`)* Gjelder alt datert, «målt»
  inkludert. Belegg: `plan.md` påsto som målt 18.08 at hardening ikke kunne slås
  av; 19.08 ga `rulesets` `[]`. Forrige STATUS påsto plugin var 0.1.0; innholdet
  er 0.2.1. En måling er et faktum om et tidspunkt, ikke om nå.
- **[arvet-regel-prøves-før-den-etterleves]** Sjekk at en arvet regel
  generaliserer til dem den skal tjene før du sveiper mekanisk. Belegg:
  renhetsregelen lette etter én persons brukernavn og gikk ren for alle andre; jeg
  utvidet den før jeg spurte om den var riktig, og commit 2 reverserte commit 1.
- **[explore-delegering]** Kryssfilsøk der konklusjonen er poenget skal til
  Explore. Belegg: `.claude`-søket trakk 60 linjer fra 7 filer; jeg trengte 2.

## Det en ny økt må vite

- **Hardening er AV, review droppet fram til 1.0** (beslutning BK 19.08, målt `[]`).
  Direkte commit til `main` er greit for `kunnskap/`. Konsekvensen står i `plan.md`
  og skal tas opp ved 1.0: repoet er en instruksjonskanal inn i kollegaers økter,
  og nå finnes ingen port.
- **Versjonsetiketter lyver, ordlyd gjør det ikke.** `plugin list`, cache-katalogen
  og `plugin.json` sier alle 0.1.0 på hjemme-PC-en, mens innholdet er 0.2.1
  (`description: Setter opp …`, `Scaffolder` 0 treff). Mål på innhold. Mekanismen
  er hypotese med navngitt probe — se loggen.
- **Renhetsregler** — kanonisk med begrunnelser i `docs/installasjon.md`, tre
  nivåer: pakken / `kunnskap/` / måleregelen. Personnavn, maskinnavn og private
  repo-referanser er **tillatt i `kunnskap/`**. Søk brukerstier **generisk**, aldri
  etter et bestemt brukernavn. Kjør ETTER `git add`, alltid med positiv kontroll.
- **Porten er `claude plugin validate .`** — ingen `package.json`, men ikke meld
  «ingen kvalitetsport».
- **Maskinlokale tillatelser hører i `.claude/settings.local.json`** (gitignorert).
  `.claude/settings.json` er den delbare fila, reservert for plugin-deklarasjon.
- **Malen skal ikke love mer enn den har målt** — hypoteser med navngitt probe.
- `/plugin` og `/permissions` finnes ikke i VS Code-chatten; bruk terminalen.
  Regler lastes ved **oppstart**, ikke ved `/clear`.
