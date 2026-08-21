# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`

**Fase:** køpunkt 2 **LEVERT 2026-08-21 (sent kveld)** — faseflyt **0.2.4**
(`4d86520`: språkregel i CLAUDE.md-malen + klarspråktabell-speiling) og
**repo-CLAUDE.md** (`f1b4a68`: promoteringen av
[beskrevet-omfang-er-avtalt-omfang] + øktreglene). Porter grønne ×2.

**Versjonstilstand:** installert cache = 0.2.3, repo = **0.2.4** → steg 0 i
fase-start VIL melde avvik. Riktig respons: `/plugin marketplace update
claude-code-skills` (terminal) → **omstart Claude Code** → mål om. Cache ble
målt innholdsren mot 0.2.3 denne økten (hjemme-PC, positiv kontroll OK).

**Maskiner:** hjemme `VPC-5CG3433WMH` (AMD64, målt ren t.o.m. 0.2.3-cache),
kontor `VPC-8WD9VC4` (ARM64, gammelt oppsett). PS 5.1.

## Neste — start her

1. **Oppdater + omstart + mål om** mot 0.2.4 (`4d86520`) på maskinen som brukes.
2. **Tørrkjør Oppgave 5, Utstyrsskapet** — blank økt, tom mappe utenfor
   repoet; bestillingen ordrett i `TODO.md`. MVP-frys gjelder: ikke bygg mer
   før kollegatesten.
3. **Ubesvart (BK):** designsporet inn på websiden? **Actions:** BK tar samtalen.

## Arbeidsmåte neste økt

- **[kilden-teller-ikke-listen]** *(ny)* Speilinger telles mot kilden, ikke mot
  notatet som omtaler dem: TODO navnga tre ordlisterader, mekanisk sammenligning
  mot websiden fant fire (`økt`). Sammenlign FØR forslaget skrives.

## Det en ny økt må vite

- **Repoet har nå `CLAUDE.md`** (lastes automatisk i hver økt): porten før push,
  pakkeendringsrutinen (main + begge manifestene + CHANGELOG), måle- og
  språkregler og beskrevet-omfang-regelen bor DER — ikke lenger her.
- Kjørende skill-versjon står i skill-kallets basekatalog; avviker den fra
  repoet: les repoets SKILL.md og følg den.
- Artefakt-oppdatering: WebFetch artefakt-URL-en først, publiser med `url`-param.
- Renhetsregler: personnavn/maskinnavn OK i `kunnskap/`; `fint` = 0 treff i
  `plugins/faseflyt/`. Maskinlokale tillatelser i `.claude/settings.local.json`;
  `/plugin` og `/permissions` kun i terminalen.
