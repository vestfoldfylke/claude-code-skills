# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. Merkelappen `kjent-før-test` =
bevisst utsatt av MVP-frysen 2026-08-19.

**TO MASKINER SKRIVER TIL DETTE REPOET.** Kjør `git fetch` og sammenlign med
`origin/main` før du stoler på denne fila.

**Fase:** Tørrkjøring av `klengenavn` (fase 0–4) er FULLFØRT og gjennomgått
2026-09-05 fra `VPC-5CG3433WMH`. Ni pakkefunn er ført i `TODO.md` under «Hold
kunnskapsfilene edruelige» — ikke implementert ennå. `web-prototype` 0.1.3 er
uendret siden forrige faseslutt.

## Neste — start her

1. **Implementer de ni funnene i `kunnskap/TODO.md`** (punktet «Hold
   kunnskapsfilene edruelige»), delt i minst to faser:
   - `fase-slutt`/`fase-start`: tredje ratchet-utfall («ikke aktuelt lenger»),
     modell-instruks som ubetinget siste linje (ikke påstand om øktmodell),
     ordlekkasje-kontrollsøk, sikkerhetssøkets selvforurensning
     (`client_secret` treffer egen logg), steg 5 hopper over gjentatt grønn
     sjekk, issue-kriteriet utvides.
   - `web-prototype`: Designsystemet er responsivt ut av boksen (si det),
     deny-regel-forslag mot `npx playwright install`/`puppeteer` videre til
     `nytt-prosjekt` sin mal.
2. **`/model sonnet`-spørsmålet er delvis avgjort:** virker når BRUKEREN
   skriver kommandoen, IKKE når skillen startes fra en trigger-frase i vanlig
   tekst — da blir økten på øktmodellen uansett frontmatter. Gjenstår: verifisere
   samme skille på kollegaers oppsett.
3. **Mac-pre-flight** — fortsatt viktigste umålte post, urørt.
4. `web-prototype` 0.1.3 steg 9 (design-tokens) — fortsatt bare kjørt i
   scratchpad, ikke i et ekte prosjekt gjennom hele fase 4.

## Arbeidsmåte neste økt

- **[tilsyn-oeker-todo-uten-fortetting]** Fortett TODO.md-punktet til det som
  faktisk gjennomføres når fasen over er ferdig — ikke bær tilsynshistorikken
  videre ubearbeidet.
- **[ni-funn-krever-fase-oppdeling]** Del implementeringen i minst to faser
  (se punkt 1 over) — én «gjør alt niende funn»-fase er feil snitt.

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
