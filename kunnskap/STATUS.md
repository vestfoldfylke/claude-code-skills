# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`

**Fase:** vurderingspunkt installasjon **LUKKET og implementert 2026-08-21** —
faseflyt **0.2.3** pushet (`156dd94`): flettevern for `.claude/settings.json` og
`.gitignore`, pluss versjonssjekk som steg 0 i `fase-start` og `nytt-prosjekt`.
Porter grønne. Ikke prøvd i drift ennå.

**Kritisk funn 2026-08-21: kjørende ≠ installert.** Økten som bygde 0.2.3 kjørte
selv 0.1.0 — en `claude`-prosess beholder versjonen den startet med. Måleprosedyren
er nå TRE ledd: `/plugin marketplace update` (terminal) → **omstart Claude Code** →
mål «installert = repo» (linjeskift normalisert, positiv kontroll).

**Maskiner:** hjemme `VPC-5CG3433WMH` (AMD64, oppdatert t.o.m. 0.2.2-cache), kontor
`VPC-8WD9VC4` (ARM64, gammelt oppsett). PS 5.1. **Mål hostname nå — som handling.**

## Neste — start her

1. **Oppdater + omstart + mål om** mot 0.2.3 (`156dd94`) på maskinen som brukes —
   versjonssjekkens steg 0 skal deretter selv melde riktig tilstand.
2. **Køen er åpen (BK-klarsignal per punkt):** promotering av
   [beskrevet-omfang-er-avtalt-omfang] til repo-CLAUDE.md (4. gang, utformet),
   språkregel i CLAUDE.md-malen, klarspråktabell-speiling av ordlisteradene.
3. **Tørrkjør Oppgave 5, Utstyrsskapet** — blank økt, tom mappe utenfor repoet;
   bestillingen ordrett i `TODO.md`.
4. **Ubesvart (BK):** designsporet inn på websiden? **Actions:** BK tar samtalen.

## Arbeidsmåte neste økt

- **[beskrevet-omfang-er-avtalt-omfang]** *(4. gang — fulgt)* Forslag først,
  klarsignal før skriving. Promoteringen er ublokkert — se købunkt 2.
- **[paaminnelser-utfoeres-ikke-gjengis]** *(ny)* Per-økt-påminnelser er
  handlinger: utfør dem idet de kvitteres (hostname ble gjengitt, ikke målt).
- **[metadata-i-kallet-er-maaledata]** *(ny)* Les skill-kallets basekatalog:
  versjonsavviket (0.1.0) sto i øktens første melding og ble sett timevis senere.

## Det en ny økt må vite

- **Kjørende skill-versjon står i skill-kallets basekatalog.** Avviker den fra
  repoet: les repoets SKILL.md og følg den (gjort for fase-slutt 2026-08-21).
- **Artefakt-oppdatering:** WebFetch artefakt-URL-en først (dumper ~20k tegn HTML
  i konteksten), publiser deretter med `url`-param.
- **Porten:** `bash .github/renhet/sjekk.sh` + `~/.local/bin/claude.exe plugin
  validate .` — ETTER `git add`, fra Bash-verktøyet (`claude` mangler på PATH).
  Linjebryting av unntakslistede linjer krever oppdatert `fint-unntak.txt`.
- **Hardening AV, review droppet til 1.0.** Pakkeendring rett på `main`; bump
  BEGGE manifestene. Målinger er datert — også i `plan.md`/`TODO.md`.
- **`kunnskap/lokalt/` og Office-filer er gitignorert** — `marketplace add` kloner
  hele repoet. Renhetsregler: personnavn/maskinnavn OK i `kunnskap/`; `fint` = 0
  treff i `plugins/faseflyt/`.
- Maskinlokale tillatelser i `.claude/settings.local.json`. `/plugin` og
  `/permissions` kun i terminalen. Flerlinjet commit: meldingsfil + `git commit -F`.
