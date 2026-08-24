# Regler for økter i dette repoet

Dette repoet er distribusjonskanal: `/plugin marketplace add` er en `git clone`,
så alt tracket innhold havner hos hver kollega som installerer pakken — og alt
som pushes til `main` blir arbeidsinstrukser i deres økter.

## Beskrevet omfang er avtalt omfang

Pakke-, mal- og dokumentfiler endres aldri uten ordlyd-forslag først og
eksplisitt klarsignal. Å beskrive en endring er ikke å avtale den — «litt
ekstra» er ikke en full omskriving. Nye ideer underveis går til forslag eller
`TODO.md`, ikke rett i filene.

## Porten før hver push

ETTER `git add`, fra Bash-verktøyet: `bash .github/renhet/sjekk.sh` og
`claude plugin validate .`. Er `claude` ikke på PATH — en økt som startet før
PATH ble satt, eller en maskin der binæren ikke er lagt inn — bruk
`~/.local/bin/claude.exe plugin validate .` i stedet.
Brytes en unntakslistet linje om, oppdateres unntakslisten i `.github/renhet/`
i samme redigering. Alltid én positiv kontroll i samme runde.

## Pakkeendringer

Rett på `main` — hardening er AV til 1.0, så diffen din er eneste port: les
den. Bump BEGGE manifestene (`plugins/<navn>/.claude-plugin/plugin.json` og
`.claude-plugin/marketplace.json`) og før endringen i `CHANGELOG.md`.

## Målinger og språk

- Målinger dateres og navngir maskinen — en måling eldes, også i
  `plan.md`/`TODO.md`. Funn føres som observert kun når kallet faktisk ble
  kjørt og utfallet sett; ellers som hypotese.
- Alt brukervendt materiale skrevet i dette repoet følger språkreglene i
  `plugins/faseflyt/skills/nytt-prosjekt/SKILL.md` («Snakk norsk til
  brukeren») — de gjelder her selv om skillen aldri lastes.

## Lokale filer

`kunnskap/lokalt/` og Office-filer er gitignorert med vilje. Flerlinjede
commit-meldinger: meldingsfil + `git commit -F`.
