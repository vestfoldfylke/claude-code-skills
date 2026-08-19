# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`

**Fase:** pakken er **fryst for MVP-test** (beslutning BK). Neste jobb er ikke
kode, men å teste på et par kollegaer. faseflyt 0.2.1, `claude plugin validate .`
✔ exit 0, renhetssjekken 9 søk / 0 feil. Ingen kjente åpne defekter.
`main` = `a33a11e` + denne commiten.

**Maskiner:** hjemme `VPC-5CG3433WMH` (AMD64), kontor `VPC-8WD9VC4` (ARM64).
Begge ferdig satt opp. PS 5.1, ingen `pwsh`. CLI: `~\.local\bin\claude.exe`, ikke
alltid på PATH. Sjekk hostname først.

**Umålt, skal stå som umålt:** Mac (helt urørt), webapp-/dokumentasjons-/API-
typene, verifiseringspunkt 9 og 10, `pull_request`-triggeren i CI. **Punkt 5 er
droppet.**

## Neste — start her

1. **Kollegatest på et par personer.** Pakken er testbar nå: README dekker begge
   de målte oppstartsfellene (installer i terminalen, ikke i utvidelsen;
   `gh auth login` + org-medlemskap). Ikke bygg mer før dette er gjort — det er
   testen som avgjør «helhetsvurdering»-spørsmålet i `plan.md`.
2. **Actions:** BK snakker med utviklerne før bryteren slås på. Målt:
   `actions/permissions` → `enabled: false`, så workflowen er inert. Org-nivået er
   **uavklart** (403 med to mulige forklaringer). Spørsmålene ligger i `TODO.md`.
3. **Tre `faseflyt`-oppføringer** i `claude plugin list` — uforklart, se loggen.

## Arbeidsmåte neste økt

- **[grønn-sjekk-er-ikke-grønn-port]** Er leveransen en mekanisme, mål at den er
  *koblet til* før du bygger på den — den billige målingen først. Belegg: 276
  linjer renhetsport skrevet, testet og pushet før jeg oppdaget at Actions er
  avslått. Ett `gh api`-kall ville avdekket det på minutt én.
- **[mvp-drift]** Sjekk STATUS-rangeringen mot brukerens nærmeste mål før du
  bygger. Belegg: CI-porten sto som punkt 1 og ble bygget; BK bestemte samme økt at
  den holdes internt, og måtte selv si at prosjektet hadde vokst forbi MVP.
- **[hent-bare-det-du-trenger]** *(omformulert fra `[explore-delegering]`, som var
  bundet til et verktøy som ikke alltid finnes)* Les linjeintervaller, tell før du
  leser innhold, hent én seksjon framfor hele fila. Explore når den er tilgjengelig.

## Det en ny økt må vite

- **Målinger er datert, også de som står i `plan.md` og STATUS.** En måling er et
  faktum om et tidspunkt, ikke om nå — mål om før du bygger på den. *(Fulgt i tre
  påfølgende faseslutt; foreslått promotert til en `CLAUDE.md` som ikke finnes ennå
  — se chatten ved faseslutt 19.08 kveld.)*
- **Hardening er AV, review droppet fram til 1.0** (BK 19.08, målt `[]` samme dag).
  Pakkeendring går da rett på `main`; branch + PR gjelder når hardening er på.
- **Porten er `bash .github/renhet/sjekk.sh` + `claude plugin validate .`** — kjør
  sjekken ETTER `git add`. Ingen `package.json`, men ikke meld «ingen sjekk finnes».
- **Klarspråk-regelen er en tabell** i `nytt-prosjekt/SKILL.md` — pakken leses av
  folk som ikke koder. Ikke «kvalitetsport», «røyktest», «probe», «harness», ikke
  «scaffolde». Bruker du et fagord som ikke står i tabellen, forklar det i samme
  setning. Pakken brøt denne regelen selv; les den før du skriver brukerrettet tekst.
- **Renhetsregler:** personnavn, maskinnavn og private repo-referanser er tillatt i
  `kunnskap/`. Søk brukerstier **generisk**. `fint` = null treff i
  `plugins/faseflyt/` (unntaksliste for deklarasjonslogikk), tillatt i
  `plugins/fint-graphql/`.
- **Versjonsetiketter lyver, ordlyd gjør det ikke** — mål på innhold. Plugin-cachen
  kan være foreldet mot repoet; repoet er kanonisk.
- **Maskinlokale tillatelser i `.claude/settings.local.json`** (gitignorert).
- `/plugin` og `/permissions` finnes ikke i VS Code-chatten; bruk terminalen.
- Flerlinjede commit-meldinger: skriv meldingsfil og bruk `git commit -F`.
