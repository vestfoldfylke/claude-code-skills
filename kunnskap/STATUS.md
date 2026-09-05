# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. Merkelappen `kjent-før-test` =
bevisst utsatt av MVP-frysen 2026-08-19.

**TO MASKINER SKRIVER TIL DETTE REPOET.** Kjør `git fetch` og sammenlign med
`origin/main` før du stoler på denne fila.

**Fase:** `web-prototype` **0.1.3** pushet 2026-09-05 fra `VPC-5CG3433WMH`
(hjemmekontor) — sv/Designsystemet-drift rettet i skillen og bekreftet mot
testprosjektet `klengenavn`. **Begge maskinene må kjøre
`/plugin marketplace update claude-code-skills` + omstart** før 0.1.3 virker der.

## Neste — start her

1. **Fortsett tørrkjøringen** i `klengenavn` (kun på denne maskinen,
   `C:\dev\claude-code-skills-testoppgave-0.6`, slettes når ferdig brukt): fase
   1–4. Prøv samtidig web-prototype 0.1.3 sitt nye steg 9 (design-tokens) helt
   gjennom — kun kjørt isolert i scratchpad så langt, ikke i et ekte prosjekt.
   Se også om plan-malen bør si at Claude ikke skal forsøke brukerens
   verifisering selv, og om `limit` på `Read` av `logg.md`/`laering.md` faktisk
   brukes (umålt så langt).
2. **Mac-pre-flight** — fortsatt viktigste umålte post, urørt.
3. **Umålt:** at `/model sonnet` (0.6.1) virker på alle kollegaers oppsett.

## Arbeidsmåte neste økt

- **[faktisk-bruk-foran-pakkekildekode]** Har et pakke-funn et ekte
  testprosjekt å sjekke mot: les PROSJEKTETS logg/filer før forslaget skrives
  ferdig, ikke bare pakkens egen kildekode/`--help`.
- **[testprosjekt-er-forgjengelig]** Siter konkrete funn (kommandoer,
  filinnhold) direkte i STATUS/logg — ikke bare pek til testprosjektets sti;
  den kan være borte eller lokal til én maskin.

## Det en ny økt må vite

- **Testprosjekter er midlertidige og lokale** (BK, 2026-09-05): `klengenavn`
  m.fl. slettes når ferdig brukt og finnes kun på hjemmekontor-maskinen — ikke
  en varig referanse for andre økter/maskiner.
- **To promoteringsforslag venter fortsatt på BKs klarsignal:**
  `[proev-forslaget-mot-prosjektets-egne-laerdommer]` og
  `[ord-jeg-selv-innfoerer-maa-holdes-mot-tabellen]` — begge inn i `CLAUDE.md`.
- `[nullavvik-krever-samme-kontroll-som-nullsvar]` og `[en-maaling-per-tur]`
  arkivert som aktive, ikke opphevet — ennå uten å bli satt på prøve.
- Norske commit-meldinger lukker ikke issues — `gh issue close` er eget kall.
- Engangsgodkjenninger brenner målfiler — velg alltid en urørt fil som mål.
- Ingen automatisk sjekk finnes. Diffen er eneste port; `sjekk.sh` +
  `claude plugin validate .` kjøres fra Bash ETTER `git add`.
- Pakkeendring = bump BEGGE manifestene + `CHANGELOG.md`. Målinger dateres og
  navngir maskinen — verifisert med `hostname`, ikke antatt.
- Flyttes en regel fra én fil til en annen: grep hele pakken etter forrige
  plassering, ikke bare filene forslaget selv nevner (se `laering.md`).
- `kunnskap/` har også `kollegatest.md`, `testplan.md`, `selvbaerende-test.md`.
- Allowlist-saken er LUKKET. Ikke gjenåpne.
- `/plugin` og `/permissions` kun i terminalen.
- Flerlinjede commit-meldinger: meldingsfil + `git commit -F`.
