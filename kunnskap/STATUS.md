# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`

**Fase:** ordlydsgjennomgangen av samlingsmaterialet er **FERDIG og godkjent av BK
(2026-08-21)**. **Kanal-beslutning (BK): kun artefakten deles** — ark og `.docx`
droppet, filene slettet. Kilde: `kunnskap/lokalt/ki-samling-oppgaver.html`
(omdøpt fra `vaffelvakta.html`), artefakt:
`https://claude.ai/code/artifact/473a90a1-191a-4946-b75b-ccf08e4c129e`.
Fem oppgaver (Snoozeloggen kuttet, renummerert 1–5; tørrkjøringscasen
Utstyrsskapet er nå **Oppgave 5**). Pakken uendret: faseflyt 0.2.2.

**Maskiner:** hjemme `VPC-5CG3433WMH` (AMD64), kontor `VPC-8WD9VC4` (ARM64,
fortsatt gammelt oppsett). PS 5.1, ingen `pwsh`. Sjekk hostname først.
**Verifisert 2026-08-20 (hjemme):** installert pakke = repo (0.2.2, `4b64670`) —
målingen dør ved neste pakke-push; da `marketplace update` + mål om.

## Neste — start her

1. **VURDERINGSPUNKT installasjon** (øverst i `TODO.md`) — gjennomgås i detalj
   med BK, rettes ikke på eget initiativ. I kø bak: to pakkefikser +
   klarspråktabell-speiling av de nye ordlisteradene.
2. **Tørrkjør Oppgave 5, Utstyrsskapet** — blank økt, tom mappe utenfor repoet.
   Bestillingen står ordrett i `TODO.md`. Mål «installert = repo» om på maskinen
   tørrkjøringen skjer på.
3. **Ubesvart (BK):** skal designsporet («Vil dere dele dere?») inn på websiden?
4. **Actions:** BK snakker med utviklerne — spørsmålene står i `TODO.md`.

## Arbeidsmåte neste økt

- **[beskrevet-omfang-er-avtalt-omfang]** *(3. gang — fulgt denne økten)*
  Beskrivelse er ikke avtale: forslag først, vent på klarsignal, aldri beskriv og
  skriv i samme trekk. Har nådd tre innslag = manglende regel; promoteringen
  (repo-CLAUDE.md) er utformet men parkert av BK bak vurderingspunkt installasjon.
- **[beslutninger-forplanter-seg]** *(ny)* Når en beslutning dreper en premiss,
  gå gjennom alt som hviler på premissen i samme runde — navn, metaforer,
  instrukser. Belegg: «deltakerark»-navnet ble foreslått etter at ark-konseptet
  var droppet, og avvist på det.

## Det en ny økt må vite

- **Artefakt-oppdatering fra ny økt:** publisering sperres til økten har sett
  gjeldende versjon — WebFetch artefakt-URL-en først (den dumper hele HTML-en i
  konteksten), publiser deretter med `url`-param. Kildesti kan avvike fra
  original; `url`-param holder lenken stabil.
- **Målinger er datert** — også i `plan.md`/`TODO.md`. Cache mot repo måles med
  linjeskift normalisert (cache CRLF, repo LF), alltid med positiv kontroll.
- **Hardening AV, review droppet fram til 1.0.** Pakkeendring rett på `main`;
  bump **begge** manifestene.
- **Porten:** `bash .github/renhet/sjekk.sh` + `claude plugin validate .` — kjør
  ETTER `git add`, fra Bash-verktøyet (`bash` finnes ikke på PATH i PowerShell,
  og `$LASTEXITCODE` gir da falsk exit 0).
- **`kunnskap/lokalt/` og `kunnskap/*.docx|xlsx|pptx|pdf` er gitignorert** —
  `marketplace add` er en `git clone` av hele repoet.
- **Renhetsregler:** personnavn/maskinnavn/private repo-refs tillatt i
  `kunnskap/`; brukerstier søkes generisk; `fint` = 0 treff i `plugins/faseflyt/`.
- Maskinlokale tillatelser i `.claude/settings.local.json`. `/plugin` og
  `/permissions` finnes ikke i VS Code-chatten — bruk terminalen. Flerlinjede
  commit-meldinger: meldingsfil + `git commit -F`.
