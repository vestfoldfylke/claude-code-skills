# STATUS — les denne først i ny økt

*Overskrives ved hver faseslutt. Historikk: `logg.md`. Selvvurdering:
`laering.md`. `kunnskap/` er gitignored — finnes bare på maskinen under.*

**Maskin denne STATUS ble skrevet på:** `VPC-5CG3433WMH` (hjemmekontor-PC, AMD64,
PowerShell 5.1, ingen `pwsh`). **Er du et annet sted, sjekk hostname først** —
kontor-PC-en (`VPC-8WD9VC4`) er ARM og har fortsatt gammelt oppsett.
CLI-binæren: `~\.local\bin\claude.exe`, ikke alltid på PATH.

**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md` (les «Helhetsvurdering»
og «Forcing function» der — de styrer retningen nå)

**Fase:** O8-fiksen er levert og målt. **PR #12 er OPEN og venter review** —
branch `ordrett-maltekst`, seks commits, alt pushet, `MERGEABLE`. faseflyt 0.2.1.

**Verifisert (observert):** verifiseringsplanens **punkt 2 er grønt** — fersk
scaffold, script-type på Windows med persondata = ja, kjørt av egen økt som ikke
visste hva som ble målt. Fire malseksjoner diffet mot malkopien økten leste:
CLAUDE.md-avsnittet (54 linjer), STATUS-snutten (18), logg-malen (20),
laering-malen (18) — **alle ORDRETT, null avvik.** Punkt 6 (selvbærende) fra før.

**Umålt, skal stå som umålt:** webapp-, dokumentasjons- og API-typene; **Mac og
Snapdragon/ARM** (både innhold og installasjon); punkt 5, 9, 10.

## Neste — start her

1. **Få PR #12 gjennom review og merget.** Push ALT før du ber om godkjenning.
2. **Punkt 9 (overtakelsestest)** — riggen står klar: `prosjekt-a` (sti under).
   Klon den; rigg-artefakten `.claude/skills/nytt-prosjekt/` ble aldri committet,
   så klonen er scenariet rent. NB: `.claude/settings.json` peker på GitHub, der
   0.1.0 fortsatt ligger ⇒ testen måler **mekanismen**, ikke innholdsversjonen.
3. **O8-issue: vurder om det fortsatt trengs** — PR #12 dokumenterer funn og fiks.
   BK avgjør; ikke opprett uten å spørre.
4. **Punkt 5 (bakoverkompatibilitet)** mot `ElevPC-fakturagrunnlag` og `fint-samtykke`.
5. **Pre-flight for samlingen** (30 deltakere, gruppearbeid, forhåndsinstallerte
   skrivemaskiner): kontor-PC-en/ARM er kritisk vei, Mac trenger en frivillig.

## Arbeidsmåte neste økt

- **[riggen-fryses-under-måling]** Ikke rediger det som måles mens målingen løper.
  Frys, eller noter snapshot-stien i samme melding som endringen gjøres. Belegg:
  språkfiksen endret malen midt i målingen; fasit måtte byttes til kopien.
- **[todo-er-datert-observasjon-ikke-tilstand]** Verifiser et TODO-punkt mot kode
  og CHANGELOG FØR du lover arbeidet. Belegg: Mac-skjevheten var alt rettet i PR #2.
- **[egne-verktøy-treffes-av-pakkens-egne-feller]** Kastescripter og sjekkere er
  kode: møt dem med prosjektets egne feller før de brukes som målestokk. Belegg:
  `-like` ga 12 falske avvik; en ubekreftet sjekker er verre enn ingen.

## Det en ny økt må vite

- **Org-regler krever PR** — aldri direkte til `main`. `Hardening` er arvet, aktivt,
  null bypass: 1 godkjenning + `require_last_push_approval`.
- **Installert plugin er 0.1.0** (`cfc4558`, pre-PR#2) — marketplace-klonen er aldri
  oppdatert. Skal noe måles mot gjeldende skill, må den legges **prosjekt-scopet**;
  ellers måler du gammel tekst. Gjelder også `fase-start`/`fase-slutt` du selv kjører.
- **Renhetsregler før hver push** (kanonisk liste: `docs/installasjon.md`): gammel
  forkortelse `v-t-f-k` 0 treff i hele repoet; ingen absolutte brukerstier i pakken
  — søk **generisk**, aldri etter et bestemt brukernavn; `fint` kun i
  `plugins/fint-graphql/` + deklarasjonslogikk. **Personnavn, maskinnavn og private
  repo-referanser er tillatt i `kunnskap/`.** Kjør ETTER `git add`, og **alltid
  positiv kontroll i samme kjøring** — «0 treff» fra en død probe måler ingenting.
- **Ingen kvalitetsport** (ingen `package.json`) — si det eksplisitt ved faseslutt.
- **Malen skal ikke love mer enn den har målt.** Hypoteser med forbehold og
  navngitt probe, aldri som funn.
- `/plugin` og `/permissions` finnes ikke i VS Code-utvidelsens chat — bruk
  terminalen. Regler lastes ved **oppstart**, ikke ved `/clear`.
- Utracket `.claude/` i repo-roten er lokale tillatelser — committes IKKE.
- **Riggen fra i kveld** (scratchpad er økt-spesifikk, så absolutt sti):
  `~/AppData/Local/Temp/claude/c--dev-claude-code-skills/<økt-id>/scratchpad/`
  — inneholder `prosjekt-a` (scaffoldet testprosjekt) og `sammenlign-mal.ps1`
  (ordrett-sjekker, verifisert i begge retninger — gjenbrukbar).
- **Synk-repoet er ryddet (gjort 2026-08-18 kveld, `6cda506`, pushet):** de gamle
  skillene og kommandoene er slettet fra `~/.claude`, whitelist-linjene fjernet, og
  README peker på pakkens README som kanonisk. **Kontor-PC-en:** kjør
  `git -C ~/.claude pull` FØRST — ellers skygger de gamle kopiene for
  plugin-versjonen — deretter `/plugin marketplace add` + installer de tre.
  Noter underveis: det er samtidig ARM-pre-flighten, som står som umålt.
- **Synk-repoet er lagt om til `main`** (`c12b881`, default branch endret).
  `master` finnes som MIDLERTIDIG speil av samme commit, kun fordi kontor-PC-en
  sporer den. Etter at den maskinen har byttet:
  `git -C $HOME\.claude checkout -B main origin/main; git -C $HOME\.claude branch -D master`
  — og deretter slett remote-branchen. **Halvferdig omlegging til den er gjort.**
- Løse ender: remote-branchen `funn-testplan-1-3` i pakkerepoet kan slettes, og
  `master` i synk-repoet når kontor-PC-en er over på `main`.
