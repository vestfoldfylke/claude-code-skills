# Changelog

Semver per plugin. Endringer som brekker eksisterende `kunnskap/`-struktur i
scaffoldede prosjekter markeres **BRYTENDE** med migreringsnotat — `fase-start`
skal ellers alltid tåle eldre struktur.

## 0.2.0 — 2026-08-18

`faseflyt` 0.2.0. Rettinger fra testplanens test 1–3 — flere av dem gjør malteksten
mindre lovende enn før, fordi det er den som var feil.

- **Deny-settet: `Bash(...)`-matchere er verktøy-scopet.** Målt: `curl` i Bash
  blokkert, `Invoke-RestMethod` i PowerShell-verktøyet kjørte — samme URL, samme
  økt. `Bash(Invoke-WebRequest:*)`/`Bash(Invoke-RestMethod:*)` fjernet fra malen
  (dødvekt), og «Deny-settets grenser» lagt til: verktøy-scoping, uvirksom
  `PowerShell(...)`-form, alias- og omveisflaten, stiform i `Read(...)`.
  Personvern-avsnittet sier nå at CLAUDE.md-regelen er hovedvernet.
- **«Deny-settets grenser» skrevet om til målte funn**, delt i det som virker og
  det som ikke gjør det. Nytt og målt: bar tool-navn-oppføring (`"PowerShell"`)
  slår ut hele verktøyet — det ene deklarative grepet på Windows, men
  alt-eller-ingenting; `Read(...)`-deny dekker også Write og Bash-kommandoer som
  nevner stien; deny-sjekk går foran eksistenssjekk; `ask`-nøkkel forkaster ikke
  blokken. Og den viktigste grensen: Bash-dekningen er **tekstmatching**, ikke
  filsystemvern — `ls -la` på katalogen kjørte og eksponerte navn og størrelser,
  mens `ls -la <dekket fil>` ble avvist.
- **Stiformen i `Read(...)` er målt:** bar filnavn-form virker, og er IKKE ankret
  til `settings.json`s katalog — en bar regel blokkerte fila i både prosjektroten
  og `.claude/`, målt på to ulike filnavn med kontroll for
  konfigurasjonsstabilitet. `Read(.env)` er dermed ikke dødvekt. En tidligere
  hypotese om det motsatte er **avkreftet og trukket**; den hvilte på én
  observasjon som ikke lot seg reprodusere, gjort under en konfigurasjon som
  aldri ble verifisert ordrett. Umålt: dekning av vilkårlige undermapper —
  derfor står glob-formen (`Read(**/.env)`) fortsatt ved siden av.
- **`Bash(npx tsx scripts/*)` merket som utestet mønsterform** i deny-eksempelet.
  Den bruker sti med `/*` der de målte reglene bruker kolon-prefiks
  (`Bash(curl:*)`), og lånte troverdighet fra målingene rundt seg.
- **Integritetsprobe påkrevd** ved endring av `permissions`: en uverifisert nøkkel
  kan gjøre hele blokken stille inaktiv. Ukonfundert oppskrift i `maler.md`;
  `nytt-prosjekt` steg 6 skal levere den i samme endring som deny-settet.
- **Nettverksdeny differensieres per prosjekttype** — bredt for script/dokumentasjon,
  målbasert for webapp/API, som ellers mister evnen til å verifisere eget endepunkt.
- **Fase-slutt-vakten:** «foreslå … med én gang» ble lest som en ordre om å utføre
  (fase-slutt kjørte og committet uten klarsignal — reprodusert to ganger).
  Omformulert, og porten er gjort eksplisitt **både** i `fase-slutt/SKILL.md` og i
  CLAUDE.md-avsnittet — sistnevnte fordi en skill bare lastes når den kalles, så en
  port som bare står der fanger ikke det å utføre rutinen for hånd. Porten har nå
  en observerbar test (finn meldingen der brukeren ba om det) framfor skjønn, og
  dekker eksplisitt begge veier: kalle skillen og gjøre stegene selv.
  **Verifisert:** en frisk økts første verifiseringsbekreftelse, med reelt arbeid
  og en commit innen rekkevidde, ga et forslag og ingen utført rutine — målt på
  CLAUDE.md-laget alene, uten skill-porten installert.
- **`.ps1`-kildekode med æøå må lagres MED BOM** i Windows PowerShell 5.1 —
  motsatt regel av BOM-forbudet i output-filer; de to står nå sammen i `windows.md`.
- **Beslutningsmønsteret:** `Beslutning (<navn>)` → `Beslutning
  (<beslutningstaker>, <tema>)` alle seks steder, med konkret eksempel.
  Plassholderen ble lest som tema, og sporbarheten «hvem bestemte?» falt ut.
- **Belegg-krav i logg-malen** (observert kontra hypotese) og testdisiplin i
  `fallgruver.md`: «én observasjon, ett utfall, én forklaring».
- **Plattformskjevhet rettet i `prosjekttyper.md`** — Windows-regler var ubetinget
  for script-typen; plattform er en egen akse.
- **Installasjon skjer i terminal-CLI-en:** `/plugin` finnes ikke i
  VS Code-utvidelsen, og `/permissions` ligger under «Customize». Dokumentert som
  generelt mønster i README + installasjonsdokumentet.

Ikke brytende: eksisterende `kunnskap/`-struktur er uendret. Prosjekter scaffoldet
med 0.1.0 kan hente de nye reglene ved behov — særlig deny-avsnittene, hvis
prosjektet behandler persondata på Windows.

## 0.1.0 — 2026-08-08

Første versjon.

- `faseflyt` 0.1.0: `nytt-prosjekt` (prosjekttyper, læringssløyfe, rytmevakter,
  deklarerte skills, deny-sett for persondata), `fase-start`/`fase-slutt`
  (selvvurdering til fil, kvalitetsport, sikkerhetsrøyktest), `grill-me`
  (beslutninger inn i planens «Avklarte beslutninger»).
- `web-prototype` 0.1.0: uendret innhold fra org-skillen; repoet er nå master.
- `fint-graphql` 0.1.0: renset for prosjektspesifikke antakelser
  (fakturaregel for sperret adresse generalisert til personvernregel).
