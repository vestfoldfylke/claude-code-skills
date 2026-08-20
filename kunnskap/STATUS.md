# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`

**Fase:** pakken er **fryst for MVP-test** (beslutning BK). Neste jobb er ikke
kode, men å tørrkjøre én case i en blank økt. faseflyt 0.2.1 uendret siden
`a33a11e` — de to siste commitene rører bare `kunnskap/` og `.gitignore`.
Renhetssjekken 10 søk / 0 feil, `claude plugin validate .` ✔. Ingen kjente åpne
defekter i pakken. Pakken er **ikke** lenger fryst: `faseflyt` står på **0.2.2**
(klarspråkrunden, se CHANGELOG).

**Installert pakke = repoet (målt 2026-08-20 kveld, hjemme-PC-en):** user scope
0.2.2, `gitCommitSha 4b64670` = HEAD, **0 avvik på alle 10 filer**, én oppføring
per plugin, `~/.claude/skills|commands` tomme. Forutsetningen for tørrkjøringen er
oppfylt *på denne maskinen* — kontor-PC-en må måles for seg.

**Slik måler du det riktig, to ganger lært samme dag:** *(1)* normaliser linjeskift
— cachen er CRLF, repoet LF, så byte-hashing gir falske avvik (meldte 10 der 9 var
reelle). *(2)* Målingen dør i det du pusher: vi målte cachen ren, pushet 0.2.2, og
gjorde vår egen måling usann i samme økt. Endrer du pakken, kjør
`/plugin marketplace update claude-code-skills` og mål om.
*Restene `0.1.0/` og `0.2.1/` ligger fortsatt i cachen — ingen peker på dem, og
Claude Codes egen `in_use`-sweep rydder dem når prosessene som holder dem avsluttes.*

**Maskiner:** hjemme `VPC-5CG3433WMH` (AMD64), kontor `VPC-8WD9VC4` (ARM64).
PS 5.1, ingen `pwsh`. CLI: `~\.local\bin\claude.exe`, ikke alltid på PATH. Sjekk
hostname først. **Uavklart:** STATUS har sagt «begge ferdig satt opp», mens
`TODO.md`s Maskinstatus-seksjon (17.–18.08) sier kontor-PC-en har gammelt oppsett.
Det kan bare avgjøres PÅ den maskinen — `claude plugin list` + ordlydssjekk mot
repoet.

**Umålt, skal stå som umålt:** Mac (helt urørt), webapp-/dokumentasjons-/API-
typene, verifiseringspunkt 9 og 10, `pull_request`-triggeren i CI. **Punkt 5 er
droppet.**

## Neste — start her

0. **To VURDERINGSPUNKTER øverst i `TODO.md` skal gjennomgås i detalj med BK — ikke
   rettes på eget initiativ.** (a) `nytt-prosjekt` steg 6 mangler «ikke
   overskriv»-klausulen som steg 1 og 8 har, så en kollegas eksisterende
   `.claude/settings.json` kan bli overskrevet — kravet er at installasjon aldri
   overskriver noe. (b) Ordlyden i websiden og oppgavelappene trenger finpuss. To
   utformede pakkefikser ligger i kø bak (a).

1. **Tørrkjør Oppgave 6, Utstyrsskapet** — blank økt, tom mappe utenfor dette
   repoet. Bestillingen står ordrett i `TODO.md` (arket selv er untracket og
   synker ikke mellom maskiner). Kjøres den på kontor-PC-en, er den samtidig
   **ARM-pre-flighten** for samlingen. Forutsetningen «installert pakke = repoet»
   er oppfylt på hjemme-PC-en (se Fase over) — **men målingen gjelder én maskin.**
   Skjer tørrkjøringen på kontor-PC-en, må den gjøres om der: gammel cache eller
   gamle kopier i `~/.claude/skills/` måler feil versjon.
   Tre påstander å se etter står i arkets fasilitatorseksjon;
   den viktigste er om «nytt prosjekt» trigger av seg selv.
2. **Actions:** BK snakker med utviklerne før bryteren slås på. Målt:
   `actions/permissions` → `enabled: false`, så workflowen er inert. Org-nivået er
   uavklart (403 med to mulige forklaringer). Spørsmålene ligger i `TODO.md`.

## Arbeidsmåte neste økt

- **[beskrevet-omfang-er-avtalt-omfang]** Sier tilbudet «seksjonen» og målingen
  sier «fire seksjoner», er neste handling en setning til brukeren — ikke en større
  Edit. Belegg: jeg tilbød å rette én foreldet TODO-seksjon og fjernet fire, 293
  linjer, med diffstat vist etterpå framfor omfang beskrevet først.
- **[mønsteret-koder-eksempelet-ikke-hensikten]** Prøv alltid en filter-, deny-
  eller ignore-regel mot et tilfelle den ikke ble skrevet for. Belegg:
  `.gitignore`-kommentaren sa «arbeidsdokumenter holdes lokale», mønstrene dekket
  bare `.docx/xlsx/pptx/pdf` — en `.md` ville gått rett i git og videre til hver
  kollega som installerer pakken.
- **[ingen-lukker-todo]** Retter du noe i pakken, søk på filnavnet i `TODO.md` i
  samme økt og lukk posten. Belegg: 293 av 598 linjer var rettede funn, og det
  alvorligste pekte på maltekst som ikke finnes lenger.

## Det en ny økt må vite

- **Målinger er datert, også de i `plan.md`, `TODO.md` og STATUS.** En måling er et
  faktum om et tidspunkt, ikke om nå. *(Fulgt i fire påfølgende faseslutt;
  foreslått promotert til en `CLAUDE.md` som ikke finnes ennå.)*
- **Hardening er AV, review droppet fram til 1.0** (BK 19.08). Pakkeendring går
  rett på `main`; branch + PR gjelder når hardening er på.
- **Porten er `bash .github/renhet/sjekk.sh` + `claude plugin validate .`** — kjør
  sjekken ETTER `git add`. Ingen `package.json`, men ikke meld «ingen sjekk finnes».
  Ti søk, og de leser **bare trackede filer** — untracket innhold må leses manuelt.
  Det tiende søket dekker tracked binærfiler, som ellers passerer usett.
- **Arbeidsdokumenter holdes lokale:** `kunnskap/lokalt/` og
  `kunnskap/*.docx|xlsx|pptx|pdf` er gitignorert. `/plugin marketplace add` er en
  `git clone`, så alt tracket havner hos hver kollega.
- **Klarspråk-regelen er en tabell** i `nytt-prosjekt/SKILL.md` — pakken leses av
  folk som ikke koder. Bruker du et fagord som ikke står der, forklar det i samme
  setning.
- **Renhetsregler:** personnavn, maskinnavn og private repo-referanser er tillatt i
  `kunnskap/`. Søk brukerstier **generisk**. `fint` = null treff i
  `plugins/faseflyt/`, tillatt i `plugins/fint-graphql/`.
- **Deny-runden er lukket** — grense-listen 1–9 i `maler.md` er kanonisk. Eneste
  åpne punkt er PreToolUse-hooken, som ikke er på kritisk vei for samlingen
  (persondata = nei på alle seks oppgavene).
- **Versjonsetiketter lyver, ordlyd gjør det ikke** — mål på innhold. Plugin-cachen
  kan være foreldet mot repoet; repoet er kanonisk. **Normaliser linjeskift når du
  måler:** cache-checkouten er CRLF, repoet LF, så byte-hashing gir falske avvik.
- **De tre `faseflyt`-oppføringene er forklart (målt 2026-08-20), ikke et mysterium:**
  to foreldreløse project-scope-rader i
  `~/.claude/plugins/installed_plugins.json` fra testkjøringene 17.–18.08
  (`test-faseflyt` og en slettet scratchpad), begge pinnet til 0.1.0 / `cfc4558`.
  Radene er fjernet; `plugin list` viser nå én. Deklarasjonen i
  `test-faseflyt/.claude/settings.json` er *riktig* og ble beholdt — det var raden
  som var foreldet. **Gotcha:** `claude plugin uninstall -s project` nekter når
  samme plugin finnes i user scope, så opprydding krever redigering av registeret.
- **Maskinlokale tillatelser i `.claude/settings.local.json`** (gitignorert).
  `/plugin` og `/permissions` finnes ikke i VS Code-chatten; bruk terminalen.
  Flerlinjede commit-meldinger: skriv meldingsfil og bruk `git commit -F`.
