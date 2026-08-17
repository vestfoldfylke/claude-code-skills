# Changelog

Semver per plugin. Endringer som brekker eksisterende `kunnskap/`-struktur i
scaffoldede prosjekter markeres **BRYTENDE** med migreringsnotat — `fase-start`
skal ellers alltid tåle eldre struktur.

## 0.2.0 — 2026-08-17

`faseflyt` 0.2.0. Rettinger fra testplanens test 1–3 — flere av dem gjør malteksten
mindre lovende enn før, fordi det er den som var feil.

- **Deny-settet: `Bash(...)`-matchere er verktøy-scopet.** Målt: `curl` i Bash
  blokkert, `Invoke-RestMethod` i PowerShell-verktøyet kjørte — samme URL, samme
  økt. `Bash(Invoke-WebRequest:*)`/`Bash(Invoke-RestMethod:*)` fjernet fra malen
  (dødvekt), og «Deny-settets grenser» lagt til: verktøy-scoping, uavklart
  `PowerShell(...)`-form, alias- og omveisflaten, uavklart stiform i `Read(...)`.
  Personvern-avsnittet sier nå at CLAUDE.md-regelen er hovedvernet.
- **Integritetsprobe påkrevd** ved endring av `permissions`: en uverifisert nøkkel
  kan gjøre hele blokken stille inaktiv. Ukonfundert oppskrift i `maler.md`;
  `nytt-prosjekt` steg 6 skal levere den i samme endring som deny-settet.
- **Nettverksdeny differensieres per prosjekttype** — bredt for script/dokumentasjon,
  målbasert for webapp/API, som ellers mister evnen til å verifisere eget endepunkt.
- **Fase-slutt-vakten:** «foreslå … med én gang» ble lest som en ordre om å utføre
  (fase-slutt kjørte og committet uten klarsignal). Omformulert, og `fase-slutt`
  har fått en eksplisitt port: skillen kjøres bare når brukeren har bedt om den.
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
