# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. Merkelappen `kjent-før-test` =
bevisst utsatt av MVP-frysen 2026-08-19.

**TO MASKINER SKRIVER TIL DETTE REPOET.** Kjør `git fetch` og sammenlign med
`origin/main` før du stoler på denne fila.

**Fase:** `faseflyt` **0.6.0** pushet 2026-09-04 fra `VPC-8WD9VC4` (`7061125`)
— kvalitetsheving før samlingen 14. september, bevisst unntak fra frysen.
**Begge maskinene må kjøre `/plugin marketplace update claude-code-skills` +
omstart** før 0.6.0 virker der — en kjørende prosess beholder sin versjon.

**Feil i CHANGELOG, uavklart:** 0.6.0-innslaget navngir feil maskin
(`VPC-5CG3433WMH` — skal være `VPC-8WD9VC4`). Forslag lagt fram, venter på
klarsignal. Se `logg.md` 2026-09-04.

## Neste — start her

1. **Tørrkjør 0.6.0**, etter marketplace-update + omstart: `/faseflyt:nytt-
   prosjekt` (webapp) i tom mappe, én fase, `/faseflyt:fase-slutt`. Sjekk at
   sjekk-forklaringene faktisk kommer i chatten, rundetall-formatet, og at
   arkivlesingen i fase-slutt bruker `limit`. Full liste: `logg.md` 2026-09-04.
2. **Mac-pre-flight** — fortsatt viktigste umålte post, urørt.
3. **`web-prototype` er utdatert på to punkter** (logg 2026-08-30) — neste
   pakkesak etter tørrkjøringen av 0.6.0.

## Arbeidsmåte neste økt

- `[ny-regel-maa-avgrenses-mot-den-den-ligner-paa]` (2. runde) Skriver du en
  ny instruks som ligner en disiplin som alt gjelder, si i teksten hva som
  skiller dem.
- `[maskinnavn-antatt-ikke-sjekket]` Kjør `hostname` FØR et maskinnavn skrives
  inn i en pakkefil.
- `[full-diff-fanger-det-enkelt-edit-ikke-viser]` Etter en batch med mange
  samtidige redigeringer, les hele diffen mot det som var avtalt.

## Det en ny økt må vite

- **To promoteringsforslag venter på BKs klarsignal:**
  `[proev-forslaget-mot-prosjektets-egne-laerdommer]` (femtende runde) og NY
  `[ord-jeg-selv-innfoerer-maa-holdes-mot-tabellen]` (tredje brutte runde,
  konkret forslag i `laering.md` 2026-09-04) — begge inn i `CLAUDE.md`.
- `[nullavvik-krever-samme-kontroll-som-nullsvar]` og `[en-maaling-per-tur]`
  arkivert som aktive, ikke opphevet — sjuende runde uten å bli satt på prøve.
- Norske commit-meldinger lukker ikke issues — `gh issue close` er eget kall.
- Engangsgodkjenninger brenner målfiler — velg alltid en urørt fil som mål.
- Allowlist-saken er LUKKET. Ikke gjenåpne.
- Ingen automatisk sjekk finnes. Diffen er eneste port; `sjekk.sh` +
  `claude plugin validate .` kjøres fra Bash ETTER `git add`.
- Beskrevet omfang er avtalt omfang. Pakkeendring = bump BEGGE manifestene +
  `CHANGELOG.md`. Målinger dateres og navngir maskinen — verifisert med
  `hostname`, ikke antatt (se punktet over).
- `kunnskap/` har også `kollegatest.md`, `testplan.md`, `selvbaerende-test.md`.
- `/plugin` og `/permissions` kun i terminalen.
- Flerlinjede commit-meldinger: meldingsfil + `git commit -F`.
