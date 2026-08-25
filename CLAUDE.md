# Regler for økter i dette repoet

Dette repoet er distribusjonskanal: `/plugin marketplace add` er en `git clone`,
så alt tracket innhold havner hos hver kollega som installerer pakken — og alt
som pushes til `main` blir arbeidsinstrukser i deres økter.

## Beskrevet omfang er avtalt omfang

Pakke-, mal- og dokumentfiler endres aldri uten ordlyd-forslag først og
eksplisitt klarsignal. Å beskrive en endring er ikke å avtale den — «litt
ekstra» er ikke en full omskriving. Nye ideer underveis går til forslag eller
`TODO.md`, ikke rett i filene.

## Sjekkene før hver push

ETTER `git add`, fra Bash-verktøyet: `bash .github/renhet/sjekk.sh` og
`claude plugin validate .`. Er `claude` ikke på PATH — en økt som startet før
PATH ble satt, eller en maskin der binæren ikke er lagt inn — bruk
`~/.local/bin/claude.exe plugin validate .` i stedet.
Brytes en unntakslistet linje om, oppdateres unntakslisten i `.github/renhet/`
i samme redigering. Alltid ett kontrollsøk som skal gi treff, i samme runde.

## Pakkeendringer

Rett på `main` — det finnes **ingen** automatisk port: Actions er droppet
(BK 2026-08-24), hardening er av, og review er droppet. Diffen din er eneste
port, også etter 1.0 — les den. Bump BEGGE manifestene
(`plugins/<navn>/.claude-plugin/plugin.json` og
`.claude-plugin/marketplace.json`) og før endringen i `CHANGELOG.md`.

## Målinger

Målinger dateres og navngir maskinen — en måling eldes, også i
`plan.md`/`TODO.md`. Funn føres som observert kun når kallet faktisk ble kjørt
og utfallet sett; ellers som hypotese.

## Språket i alt som skrives her

Gjelder chatten like mye som filene. Vedlikeholdsordene er de som lekker ut:

| Si dette | Ikke dette |
|---|---|
| sjekk at prosjektet virker | kvalitetsport |
| kontrollsøk som skal gi treff | positiv kontroll |
| rask sjekk / rask sikkerhetssjekk | røyktest, smoke test |
| test / kontrollkall | probe |
| sette opp prosjektet | scaffolde |
| Claude Code selv | harness-en |
| slår inn / utløser | trigge |

`port` står som repoets ord om det som må passeres før en endring havner på
`main` — det er noe annet enn kvalitetsporten ved faseslutt.

Vis til ting med navn, aldri med bokstav eller nummer fra en tidligere melding
(«A og B», «punkt 3») — leseren skal ikke måtte bla opp for å se hva svaret
gjelder.

Den korte teksten som følger hvert verktøykall er brukervendt tekst — brukeren
leser den mens du jobber. «Kjør renhetssjekken» og «Stage alle endringer» bryter
regelen like fullt; skriv «Sjekk at ingen persondata eller brukerstier er med»
og «Legg endringene til commiten».

Literale navn står som de er: `deny`, `commit`, filnavn, kommandoer. Møter du et
fagord som ikke står i tabellen, gjelder regelen bak den: bruk det bare hvis du
forklarer det i samme setning. Full tabell, inkludert ordene arbeidsflyten består
av: `plugins/faseflyt/skills/nytt-prosjekt/SKILL.md`.

## Lokale filer

`kunnskap/lokalt/` og Office-filer er gitignorert med vilje. Flerlinjede
commit-meldinger: meldingsfil + `git commit -F`.
