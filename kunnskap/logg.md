# Løpende logg

Datert logg over funn, overraskelser og beslutninger. Nyeste øverst.

## 2026-08-27 (natt) — 0.5.11: pakken krever nå av kollegaene det den har krevd av seg selv, og køen viste seg å være tom bak frysen

Maskin `VPC-8WD9VC4`. Tørrkjøringen ble flyttet til i morgen (28.08) på denne
maskinen, sammen med en kollega, så økten gikk til køen i stedet.

**Levert:** `faseflyt` **0.5.11** (`fd86599`, pushet), issue #16 lukket.
`fase-slutt` steg 6 krever nå ett kontrollsøk som skal gi treff, meldt sammen med
nullsvarene, med ærlighetsklausulen om at kontrollen viser at søket virker i
katalogen — ikke at mønstrene er de riktige.

**Saken:** steg 6 kjørte fire søk som normalt gir null treff, uten noe krav om å
vise at søkene virker. Belegget i issuen var to faser i samme tørrkjøring av
0.4.1 med samme instruks og ulikt utfall — kontrollen kjørt uoppfordret i den ene,
ikke i den andre. Det er definisjonen på oppførsel teksten ikke sikrer. Asymmetrien
som gjorde det verdt å rette: repoets egen `CLAUDE.md` har krevd kontrollsøket av
renhetsporten hele tiden, mens steg 6 — det som kjøres i *alle* prosjekter, av folk
som ikke nødvendigvis leser regexen — ikke krevde det.

**Funn, observert: den ferdige ordlyden i issuen kunne ikke brukes.** Forslaget
var skrevet med «positiv kontroll», og tittelen med «røyktest». Begge står i
klarspråktabellen i `CLAUDE.md` som ord vi ikke bruker. Issuen ble skrevet
2026-08-24; språkreglene ble skjerpet og flyttet inn i `CLAUDE.md` som tekst
2026-08-25 (0.5.7). Ordlyden ble derfor vasket før den gikk inn. Hadde den blitt
limt inn ordrett, ville pakken utgitt et brudd på sin egen språkregel i nøyaktig
den teksten som skal håndheve kontrollen.

**Funn, observert: «Lukker #16» i commit-meldingen lukket ikke issuen.** GitHub
gjenkjenner `Closes`/`Fixes`/`Resolves`, ikke norske verb. Issuen ble lukket med
`gh issue close 16` etterpå. Konsekvens for repoet: norske commit-meldinger kan
ikke lukke issues automatisk, så lukkingen må gjøres som eget kall.

**Køen er tom bak frysen — det var selve funnet i økten.** `gh issue list` ga sju
åpne, og seks av dem bærer `kjent-før-test`: #15, #10, #9, #8, #7, #3. Merkelappen
er MVP-frysen (BK 2026-08-19: «Ikke bygg mer før testen er gjort»). #16 var
umerket og falt utenfor frysen — den var derfor den eneste saken økten kunne ta
uten å bryte en beslutning som alt er tatt. Da den var lukket, fantes det ikke
flere.

**Sjekkene før push, alle observert:** `bash .github/renhet/sjekk.sh` → 11 søk, 0
feil, 0 advarsler, med scriptets eget kontrollsøk på 38 treff. `claude plugin
validate .` → passert. Eget kontrollsøk `git grep -c "kontrollsøk"` mot den
endrede fila → 1 treff, som viser at søket traff i denne katalogen.

**`.claude/settings.json` kom med i commiten, og ble sjekket framfor antatt.**
Diffen var én linje: `Bash(gh issue *)`, lagt til av godkjenningen `gh issue list`
utløste tidligere i økten. Ingen brukersti. Den kjente falske positiven i
`fase-start` steg 2, denne gangen bekreftet ved å lese diffen.

## 2026-08-27 (sent kveld) — 0.5.10 når ARM-maskinen: alle tre ledd målt, og økten kjører teksten den nettopp utgav

Maskin `VPC-8WD9VC4` (Snapdragon X Elite, ARM64, VS Code-utvidelsen). Kort økt med
én post å lukke: at `faseflyt` 0.5.10 faktisk kommer fram til denne maskinen.

**Observert, alle tre ledd:**

| Ledd | Målt hvordan | Utfall |
|---|---|---|
| Før handlingen | versjonssjekkens steg 0 | kjørende 0.5.9, installert 0.5.9, repoet 0.5.10 |
| Etter `/plugin marketplace update` + omstart | `Read` av marketplace-klonens `plugin.json`, `Glob` over cachen | klonen 0.5.10, cachen har egen `0.5.10`-katalog |
| Kjørende versjon | `/faseflyt:hjelp` oppga basekatalogen `…\faseflyt\0.5.10\skills\hjelp` | 0.5.10 |

Basekatalogen er entydig belegg: den katalogen skillen laster fra **er** den
kjørende versjonen, så utfallet har ingen annen forklaring. Det var derfor kallet
ble valgt framfor å slutte fra disk-tilstanden.

**Rekkefølgen var det som gjorde målingen mulig.** Før-verdien (0.5.9 begge steder)
kom gratis fordi steg 0 kjørte før oppdateringen. Hadde økten startet etterpå,
ville «0.5.10 begge steder» ikke kunnet skille «oppdateringen virket» fra «den sto
der alt».

**Sideobservasjon:** oppdateringen legger til framfor å rydde. Cachen har nå
`0.2.1`, `0.5.9` og `0.5.10` side om side. Ikke et avvik, men verdt å vite for den
som måler cache-innhold senere.

**Observasjon om pakken selv, ikke handlet på:** versjonssjekkens steg 0
sammenligner to tall — kjørende mot installert. I *dette* repoet finnes et tredje,
`plugins/faseflyt/.claude-plugin/plugin.json`, og det var det tredje som bar
nyheten. Steg 0 meldte korrekt «ingen omstart trengs» mens den reelle tilstanden
var «oppdateringen har ikke nådd maskinen». Gjelder bare pakkerepoet — i et
kollegaprosjekt finnes de to tallene steget beskriver. Ingen endring foreslått.

## 2026-08-27 (kveld) — Allowlisten er ikke det som bestemmer, og saken lukkes med en beslutning framfor en ny måling

Maskin `VPC-8WD9VC4`. Belegget kom av seg selv: faseslutten i innslaget under
kjørte tolv `Bash`-kall, og BK fotograferte **alle fire** dialogene som kom. Det
gjør fraværet av dialog like målt som tilstedeværelsen — hele tabellen er
observert, ikke bare treffene.

| Kallet | Dekket av `settings.json`? | Utfall |
|---|---|---|
| `git status --porcelain` | ja, `git status:*` | Ingen dialog |
| `git log -1 --format=%H -- …` | ja, `git log:*` | Ingen dialog |
| `git log --oneline …` | ja | Ingen dialog |
| `hostname` | **nei** | **Ingen dialog** |
| `git add -A && git status --short` | begge ledd, men sammensatt | Ingen dialog |
| `bash .github/renhet/sjekk.sh` | **ja, ordrett** | **Dialog** |
| `claude plugin validate .` | **ja, `claude plugin validate:*`** | **Dialog** |
| `git ls-files \| grep … \|\| echo …` | delvis, sammensatt | Ingen dialog |
| `git diff --cached … \| grep … \|\| echo …` | delvis, sammensatt | **Dialog** |
| `git log -1 --format=%B` | ja | Ingen dialog |
| `git commit -F …` | **nei** | **Dialog** |
| `git push` | **nei** | **Ingen dialog** |

### Funn: sammenhengen mellom allowlist og dialog finnes ikke

To oppføringer som matcher ordrett ga dialog. `hostname` og `git push`, som ikke
står i fila i det hele tatt, gikk rett gjennom. **Ingen modell der
`.claude/settings.json` styrer utfallet forklarer begge deler.**

**Det setter Bash-funnet fra 2026-08-26 i tvil.** «`Bash`-oppføringene i
`settings.json` virker» hvilte på at fem git-kall gikk gjennom — men `hostname`
og `git push` gikk også gjennom uten oppføring, så git-kallene er ikke belegg for
at allowlisten gjorde jobben. **Samtidig svekkes «fila er inert»:** en inert fil
forklarer ikke at noe går gjennom uten oppføring.

### Hypotese, ikke målt

At Claude Code selv slipper gjennom kall den vurderer som ufarlige, og spør ved
de som går ut av den rammen. Forklaringen brytes av to par, og står derfor som
hypotese:

- `git push` skriver til et nettverksmål og gikk gjennom; `git commit -F` skriver
  lokalt og ga dialog.
- `git ls-files | grep … || echo …` og `git diff --cached … | grep … || echo …`
  har samme form og samme dekning. Den ene gikk gjennom, den andre ga dialog.
  Eneste synlige forskjell er at den som ga dialog har ordene `password` og
  `client_secret` i søkemønsteret — som peker mot at kommandostrengens *innhold*
  vurderes, ikke bare formen.

Testen som ville avgjort det: samme kommando kjørt to ganger, med og uten de
ordene i mønsteret.

### Beslutning (BK, godkjenninger ved oppstart): saken lukkes her

Noen få godkjenninger i oppstarten er akseptabelt, og skal bare sies tydelig i
dokumentasjonen. Det som ikke er akseptabelt er at **lavterskel lesing** maser
gjennom hele økten.

Det kriteriet er innfridd i det som er målt: **samtlige `Read`-kall i økten gikk
gjennom uten dialog**, og det samme gjorde `hostname`, `git status`, `git log` og
`git ls-files`. Dialogene kom for å kjøre et script, kjøre en binær, et grep med
secret-ord i mønsteret, og `git commit` — fire valg i en hel faseslutt.

**Konsekvensen: fil-mot-omstart-spørsmålet forfølges ikke videre.** Det var
verdifullt bare så lenge malens allowlist var eneste vern mot maset, og målingene
her viser at den ikke er den avgjørende mekanismen uansett. Riggen som sto klar i
`STATUS.md` — omstart og ett kall mot `web-prototype` i marketplace-klonen —
utgår.

**Umålt, og skal stå som umålt:** hvorfor `Bash(bash .github/renhet/sjekk.sh)` og
`Bash(claude plugin validate:*)` ikke matcher. Den første har en sti i prefikset,
som er en kjent ikke-matchende form fra 2026-08-25; den andre har det ikke, og
står uforklart.

### Spor i formspørsmålet: Claude Code skriver en annen form enn malen bruker

BK valgte «allow for this project» på to av dialogene, og Claude Code skrev da
selv inn i `.claude/settings.json`:

```
"Bash(claude plugin *)",
"Bash(git commit *)"
```

**Formen er `<kommando> *`, ikke `<kommando>:*`** — og den ble skrevet selv om
`Bash(claude plugin validate:*)` alt sto i fila to linjer over. At verktøyet
legger til en ny oppføring framfor å se den eksisterende som dekkende, er et
spor om at kolon-formen ikke matchet det kallet.

**Kandidat, ikke bestilt:** bytte malens `:*`-form mot mellomrom-formen for
flerords-kommandoer. Ikke gjort — det krever en måling som isolerer de to
formene mot samme kall, og allowlist-saken er lukket. Føres her så sporet ikke
går tapt.

## 2026-08-27 — Den brede `**`-formen er frikjent, men riggen kunne ikke skille fil fra omstart

Maskin `VPC-8WD9VC4` (kontor-PC, Snapdragon X Elite, ARM64), VS Code-utvidelsen.
Ingen utgivelse og ingen pakkeendring — økten målte, og målte ikke ferdig.

Riggen kom fra innslaget under: den brede formen lagt inn i
`settings.local.json` ved siden av den spesifikke, mens `.claude/settings.json`
sto urørt med de samme to brede linjene.

### Funn: den brede `**`-formen virker

**Observert, tre kall, alle uten dialog** — utfallet meldt av BK:

| Fil som ble lest | Utfall |
|---|---|
| `cache/…/faseflyt/0.5.9/.claude-plugin/plugin.json` | Ingen dialog |
| `marketplaces/…/plugins/faseflyt/.claude-plugin/plugin.json` | Ingen dialog |
| `cache/…/fint-graphql/0.1.0/.claude-plugin/plugin.json` | Ingen dialog |

Den siste avgjør: `fint-graphql` var urørt i økten, og den har ingen egen
spesifikk linje slik `web-prototype` har — den dekkes kun av den brede formen.
**Det avliver forklaringen om at gårsdagens Yes-godkjenninger bar kallene**, og
det motbeviser samtidig hypotesen fra innslaget under om at den brede
`**`-formen er variabelen. Formen matcher.

### Men riggen kunne ikke svare på det den var satt opp for

Den skulle skille fil fra form. Den brede formen sto samtidig i **begge** filene,
så «ingen dialog» har to årsaker som ikke lar seg skille:

- `settings.local.json` gjør jobben, og `.claude/settings.json` er inert for `Read`.
- `.claude/settings.json` virker, og det som manglet 2026-08-26 var en omstart.

Formuleringen i forrige STATUS — at omstarten «nøytraliserer samtidig hypotesen
om at en oppføring ikke virker i økten den skrives» — er derfor for sterk.
Omstarten nøytraliserer ikke den hypotesen; den fletter den sammen med
filhypotesen.

**Umålt, og skal stå som umålt:** om Claude Code faktisk ble startet på nytt før
økten. Spørsmålet ble stilt tre ganger uten å bli besvart, og svaret er
nødvendig for å tolke utfallet.

### Målingen som mislyktes, og hvorfor

Et fjerde kall skulle avgjøre om en endring i `settings.local.json` slår inn midt
i en økt: `cache/…/faseflyt/0.5.9/skills/hjelp/SKILL.md`, en fil ingen linje i
`settings.json` dekker, med en fersk linje for seg i `settings.local.json`.
**Utfallet er ukjent** — BKs ord: «Skjedde for mye samtidig.» Turen inneholdt en
filskriving, et avsnitt med måledesign og selve kallet. Fila er brent som
målemål for økten, men fri igjen etter omstart.

`settings.local.json` ble redigert to ganger under målingen og er tilbakestilt
til de tre linjene den hadde ved øktstart. Fila er gitignorert og finnes bare på
denne maskinen.

### Riggen som avgjør, til neste økt

Ett kall, i en økt som er startet på nytt, med `settings.local.json` uten de to
brede linjene — bare den spesifikke `web-prototype`-linja igjen:

`marketplaces/…/plugins/web-prototype/.claude-plugin/plugin.json` — urørt i alle
måleøktene, og dekket kun av marketplaces-linja i `.claude/settings.json`.

Dialog = `settings.json` er inert for `Read`, og `nytt-prosjekt` steg 6 må skrive
Read-linjene et annet sted. Ingen dialog = `settings.json` virker, omstart var
det som manglet, og malen står — men README må si at en ny oppføring krever
omstart.

## 2026-08-26 (kveld) — `settings.json` er ikke inert: `Bash`-armen var feilmålt, og `Read`-armen har to variabler i seg

Maskin `VPC-8WD9VC4` (kontor-PC, Snapdragon X Elite, ARM64), VS Code-utvidelsen.
Samme maskin som innslaget under. Ingen utgivelse — økten målte.

Utgangspunktet var BKs observasjon i oppstarten: **to** dialoger, med
skjermbilde, på de to `plugin.json`-filene steg 0 leser. Økten kom av `/clear`,
ikke av en omstart, så prosessen var den samme som gjorde målingen tidligere på
dagen. Alle tre armene under lå i samme økt, med de to dialogene som
sammenligningsgrunnlag.

### Funn: `Bash`-oppføringer i `settings.json` virker

**Observert, tre kall.**

| Oppføring | Bor i | Utfall |
|---|---|---|
| `Read(…/cache/claude-code-skills/**/.claude-plugin/**)` | `settings.json` linje 6 | Dialog |
| `Read(…/marketplaces/claude-code-skills/**/.claude-plugin/**)` | `settings.json` linje 7 | Dialog |
| `Bash(git status:*)`, `Bash(git log:*)` ×2 | `settings.json` linje 8–9 | Ingen dialog |
| `Read(…/cache/claude-code-skills/web-prototype/**/.claude-plugin/**)` | `settings.local.json` | Ingen dialog |

Git-kallene var øktens **første** Bash-kall, så de kan ikke være egne
godkjenninger fra tidligere i økten. Dialogene på Read-linjene i samme fil viser
samtidig at engangsgodkjenningene fra formiddagens økt ikke fulgte med gjennom
`/clear`.

**Det motbeviser «det gjelder `Bash` like mye som `Read`»** fra innslaget under.
Den påstanden hvilte på ett kall: `claude plugin validate .`, kjørt som del av
faseslutten og ikke som måling.

**Hypotese for det kallet, ikke målt:** `CLAUDE.md` foreskriver
`~/.local/bin/claude.exe plugin validate .` når `claude` ikke er på PATH. Den
formen dekkes ikke av `Bash(claude plugin validate:*)`, og den bærer en sti i
prefikset — nøyaktig formen 2026-08-25 målte som ikke-matchende. Hvilken av de to
formene som faktisk ble kjørt, står ikke i loggen, så dette er en forklaring som
passer, ikke et funn.

### Read-armen kan ikke avgjøres ennå: to variabler skifter samtidig

De to oppføringene som ga dialog og den ene som gikk gjennom skiller seg på
**to** ting, ikke én:

- **hvilken fil** de står i, og
- **mønsterformen**: den som virket har et literalt ledd (`web-prototype`) før
  `**`; de to som feilet har `**` rett etter `claude-code-skills` og spenner to
  nivåer.

Formuleringen «variabelen er hvilken fil oppføringen står i — ikke formen» i
innslaget under er derfor for sterk for Read. Den hvilte på et par der formen ble
regnet som identisk; de er like i *tilde og `**`*, men ikke i hvor `**` står.

Kostnaden ved de to forklaringene er svært ulik: er formen variabelen, er
pakkefiksen et mer spesifikt mønster i malen. Er fila variabelen, gir malens
allowlist ingenting for `Read` hos kollegaene.

**Målingen som skiller, satt opp i denne økten:** den brede formen lagt inn i
`settings.local.json` ved siden av den spesifikke, deretter omstart og
`/faseflyt:fase-start`. Borte dialoger = fila er variabelen. Dialoger igjen =
den brede formen er variabelen. Omstarten nøytraliserer samtidig hypotesen om at
en oppføring ikke virker i økten den skrives. Utfallet står i neste innslag.

De to målfilene i cachen er brent for denne økten — BK trykket Yes på begge — så
de kunne ikke måles om her. `cache/…/fint-graphql/0.1.0/…` ble brent i
formiddagens økt og er fri igjen.

### Uendret fra innslaget under

At `settings.local.json` virker, og at malen skriver allowlisten til
`.claude/settings.json`. Konsekvensen for samlingen står som den sto til
Read-armen er avgjort.

## 2026-08-26 (formiddag) — Første måling på ARM: `settings.json` er inert, `settings.local.json` virker, og formen var aldri problemet

*Rettet samme dag, se innslaget over: `Bash`-halvdelen av funnet er motbevist, og
Read-halvdelen har en variabel til i seg enn den sier.*

Maskin `VPC-8WD9VC4` (kontor-PC, Snapdragon X Elite, ARM64), VS Code-utvidelsen.
**Første måling gjort på ARM-maskinen i det hele tatt.** Ingen utgivelse — økten
målte, den endret ingen pakkefil.

Utgangspunktet var BKs observasjon i oppstarten: tre godkjenningsdialoger, med
skjermbilde. Alle tre på `plugin.json`-filer som `.claude/settings.json` linje
6–7 dekker.

**Observert samtidig, uten at noen kommando ble kjørt for det:** `faseflyt`
0.5.9 ligger både i `plugins/cache/` og `plugins/marketplaces/` på denne
maskinen, og skillen kjørte. `.claude/settings.local.json` fantes ikke her —
den er gitignorert og per maskin, så STATUS' omtale av org-kallene i den gjaldt
den andre maskinen.

### Funn: variabelen er hvilken fil oppføringen står i, ikke formen

**Observert, fire kall.**

| Kall | Oppføring bor i | Utfall |
|---|---|---|
| Tre `plugin.json` i oppstarten | `settings.json` linje 6–7 | Dialog ×3 |
| `cache/claude-code-skills/fint-graphql/0.1.0/.claude-plugin/plugin.json` | `settings.json` linje 6 | Dialog |
| `git rev-parse --abbrev-ref HEAD` | `settings.local.json` | Ingen dialog |
| `cache/claude-code-skills/web-prototype/0.1.2/.claude-plugin/plugin.json` | `settings.local.json` | Ingen dialog |
| `claude plugin validate .` | `settings.json` linje 13 | Dialog |

**Det gjelder `Bash` like mye som `Read`.** Siste linje i tabellen ble kjørt som
del av faseslutten, ikke som måling, og ga dialog på en kommando `settings.json`
dekker med `Bash(claude plugin validate:*)`. Fila er altså inert for begge
verktøytypene — ikke bare for Read-linjene.

De to `settings.local.json`-oppføringene ble skrevet mens økten kjørte og virket
uten omstart.
Den siste bruker **nøyaktig samme tilde-form med `**`** som linje 6 i
`settings.json` — samme form, samme sti-type, ulik fil, motsatt utfall.

`git rev-parse` var lastekontrollen, kjørt alene før de andre: den utelukker at
den lokale fila ikke var lest.

**Konsekvensen treffer malen direkte:** `nytt-prosjekt` steg 6 skriver
allowlisten til `.claude/settings.json`. Er den fila inert hos kollegaene, gir
allowlisten ingenting — tre dialoger per økt per person, seks grupper på
samlingen.

### Avkreftet: dialogen i oppstarten skyldtes ikke at det var øktens første kall

`fint-graphql`-kallet kom midt i økten, på en fil `settings.json` dekker eksakt,
og ga dialog. Den åpne posten fra 2026-08-25 er dermed lukket — gjetningen var
feil, og det var ikke noe med oppstartsøyeblikket.

### Utilstrekkelig: «allowlisten virker ikke i økten den skrives»

Forklaringen fra 2026-08-25 forutsier at en ny økt går rent. `settings.json` lå
her ved oppstart, hentet via `git pull`, og er likevel inert — mens
`settings.local.json`, skrevet midt i denne økten, virket med én gang.
Forklaringen er ikke motbevist om det den målte, men den dekker ikke dette.

### Ugyldig, og skal ikke bygges på

Første runde testet tre former (tilde med `**`, tilde med eksakt sti, full sti
med `**`) mot filer i `claude-plugins-official`. Alle tre gikk gjennom — men BK
opplyste etterpå at instruksen om å trykke «No» ikke ble lest i tide, så
utfallene kan være egne godkjenninger. **Rundens tre resultater er kastet.**
Funnet over hviler ikke på dem: det er målt på nytt med ett kall mot en urørt
fil.

### Åpent, og skal stå som åpent

- **Hvorfor `settings.json` er inert er ikke målt.** Godkjenningstilstand for
  prosjektinnstillinger, VS Code-utvidelsen og ARM er tre uprøvde forklaringer.
- Om det samme gjelder på `VPC-5CG3433WMH` eller i terminal-CLI-en.
- Om skråstrek-retningen har noe å si — bare `/` er prøvd, aldri `\`.

## 2026-08-25 (dag) — Tilde-regelen fra 0.5.7 var feil, og allowlisten virker ikke i økten den skrives

Maskin `VPC-5CG3433WMH` (hjemmekontor, AMD64 — ikke ARM-maskinen). Én utgivelse:
`faseflyt` **0.5.9**. Renhetssjekken (11 søk, 0 feil) og `claude plugin validate .`
kjørt etter `git add`, to ganger — én gang midtveis og én før commit. Første økt
som kjørte 0.5.8 i drift.

Utgangspunktet var BKs observasjon: tre godkjenningsdialoger igjen i oppstarten,
med skjermbilder, og at faseslutten spør om lesende sjekker som gjentas hver gang.
Skjermbildene lot seg holde mot de seks kallene oppstarten faktisk gjorde, og ga
et rent skille å måle på.

### Funn: en sti i et `Bash`-prefiks matcher ikke — og 0.5.7 påla nettopp den formen

**Observert, isolert.** `Bash(git -C ~/.claude/.../rev-parse:*)` sto i den delte
`settings.json`; kallet skrevet med nøyaktig samme tilde-sti ga dialog. Samme
kall og samme oppføring i full sti (`/c/Users/<navn>/...`, i
`settings.local.json`) ga ingen dialog, i samme økt. `Bash(whoami)` ble lagt inn
samtidig som kontrollinje og gikk gjennom — den utelukker at den lokale fila
ikke var lest, så de to utfallene er sammenlignbare.

Dette **motbeviser** teksten 0.5.7 la i `fase-start`: «Bruk tilde-form, aldri
absolutt brukersti … en tilde-matcher treffer ikke det samme kallet skrevet
absolutt.» Regelen var ikke bare unyttig — den lærte kollegaer den formen som
ikke virker. Årsaken til feilmålingen er nå kjent, se funnet om lasting under.

**Konsekvensen er strukturell:** formen som virker bærer brukernavnet, så den kan
aldri stå i en mal eller i en delt `settings.json` — renhetssjekken forbyr den
til og med i vår egen. Står nå som **grense 10** i `maler.md`, som gjelder
`allow` like mye som `deny`.

### Funn: `Read` oppfører seg motsatt av `Bash`

**Observert, seks lesninger.** Eksakt sti, tilde, `*` og `**` over versjonsleddet
i cache-stien gikk alle gjennom. Read-linjene i malen var altså aldri problemet,
og tilde er der den riktige formen — den er den eneste som kan stå i en delt fil.

### Funn: `.claude/settings.json` leses ikke på nytt midt i en økt

**Observert, og det med lengst rekkevidde.** `Bash(claude plugin validate:*)` ble
lagt i den delte fila og kallet kjørt: dialog. Samme oppføring flyttet til
`settings.local.json`, samme kall, samme økt: ingen dialog. Den lokale fila leses
underveis, den delte ikke.

Det treffer `nytt-prosjekt` direkte: skillen skriver allowlisten i steg 6, og
oppføringene virker først etter omstart. En kollega som kjører oppsettet og
jobber videre i samme økt, møter dialoger malen nettopp har lovet er dekket.
Forklarer samtidig 0.5.7-målingen: den oppføringen kom inn via dialogens egen
knapp midt i økten, så det som ble målt var ikke den håndskrevne linja.

### Åpent, og skal stå som åpent

Read-dialogen på `0.5.8/plugin.json` i oppstarten lot seg **ikke gjenskape**
senere i økten — samme fil, samme linje, ingen dialog. At det var øktens aller
første kall er en nærliggende gjetning og ingenting mer. Ingen fiks er gjort på
grunnlag av den.

### Beslutninger

- **Beslutning (BK, org-leddet i steg 0):** ut av både `fase-start` og
  `nytt-prosjekt`. Begrunnelse: de to git-kallene er de eneste i oppstarten som
  ikke lar seg dekke av noen mal, så prisen er to dialoger i hver økt hos hver
  bruker — for et varsel, ikke en port. Ledd 1 og 2 står igjen og fanger feilen
  som faktisk har rammet («installert nyere enn kjørende, start på nytt»).
  Frekvensen var feil, ikke sjekken. Oppdatering er dokumentert i README.
- **Beslutning (BK, omstart-funnet inn i 0.5.9):** tas med framfor å utsettes.
  Begrunnelse: utgivelsen handler nettopp om at allowlist-formen er målt, og å
  slippe den uten å si at lista ikke virker før omstart er den halve sannheten
  prosjektet har tre navngitte lærdommer om.
- **Beslutning (BK, dette repoets egne sjekker):** lesende kall som gjentas hver
  faseslutt — `claude plugin validate`, `git ls-files`, `git grep`, `git diff` —
  inn i `.claude/settings.json`; `commit` og `push` blir stående bak et trykk.
  De to org-kallene i full sti ligger i `settings.local.json`, som er gitignorert
  og per maskin.

## 2026-08-25 (natt) — Fire godkjenninger igjen, og språkregelen som lå bak en henvisning

Maskin `VPC-5CG3433WMH` (hjemmekontor, AMD64 — ikke ARM-maskinen). To utgivelser:
`faseflyt` 0.5.6 og 0.5.7, begge pushet til `main` (`6086d60`, `3093595`).
Renhetssjekken og `claude plugin validate .` kjørt etter `git add` foran hver
push. Første økt som kjørte 0.5.5 i drift.

### Funn: 0.5.4 beskrev hullet i steg 0 uten å lukke det

**Observert.** BK: fire godkjenningsdialoger i oppstarten, tre vist som
skjermbilde. Tre ulike årsaker:

- **`Read` av kjørende `plugin.json` med full brukersti.** Steg 0 krever
  tilde-form to linjer over, men «Kjørende»-punktet peker på skillens egen
  basekatalog — som Claude Code oppgir absolutt. Regelen og instruksen motsa
  hverandre, og instruksen vant. Rettet i 0.5.6.
- **De to `git -C`-oppføringene sto i eksakt-form.** Skrevet ordrett likt kallet,
  tilde-form, ett kall per kommando — og ga dialog likevel.
- **Mitt eget `$env:PROCESSOR_ARCHITECTURE`-kall.** Ikke i skillen. Maskinnavnet
  sto i STATUS og arkitekturen kunne utledes fra `TODO.md`. Selvpålagt kostnad.

### Funn: kolon-prefiksformen matcher der eksakt-form ikke gjør det

**Observert, og isolert.** I samme oppstart ga `Bash(git status:*)` og
`Bash(git log:*)` ingen dialog, mens de to eksakt-formene ga én hver. Etter
omleggingen til `rev-parse:*`/`ls-remote:*` ble det samme `ls-remote`-kallet
kjørt om i samme økt: **ingen dialog** (bekreftet av BK). Det avgjør formen som
har stått som «alle målte Bash-regler bruker kolon-prefiks» uten at motsatsen var
prøvd.

### Funn: pakken hadde ingen allowlist for kollegaprosjekter i det hele tatt

**Observert.** Søk på `allow` i hele `plugins/faseflyt/` ga tre treff, alle i
løpende tekst — ingen mal. `nytt-prosjekt` skrev bare marketplace-deklarasjonen
og deny-settet. Hver kollega ville altså betalt fire dialoger i hver oppstart, i
hvert prosjekt, og på samlingen ville det truffet seks grupper på minutt null.
Rettet i 0.5.7: seks lesende oppføringer i `.claude/settings.json`-malen.
**Utestet:** at `nytt-prosjekt` faktisk skriver dem riktig, og at et nytt
prosjekt så starter uten dialoger. Testen som avgjør: tørrkjøring i tom mappe.

### Funn: språkregelen lå bak en henvisning, ikke i teksten som leses

**Observert.** BK reagerte på tre formuleringer i chatten («A og B», «porten»,
«Kjør renhetssjekken»). Årsaken var plassering, ikke slurv: språkreglene bor i
`nytt-prosjekt/SKILL.md`, som lastes bare ved oppsett, og repoets `CLAUDE.md`
*pekte* på dem framfor å inneholde dem. Jeg fulgte aldri pekeren.
`TODO.md` har alt belagt samme årsakskjede under «Helhetsvurdering» — fiksen den
gang («dette repoet får en `CLAUDE.md`») ble en henvisning, og en henvisning til
en fil som ikke lastes virker ikke bedre enn ingen regel. **Femte gang prosjektet
betaler for at en regel står der den ikke leses** (deny-regler, rytmevakter,
modellmiks, klarspråktabellen, nå denne).

To ting regelen ikke dekket, begge meldt av BK i denne økten: at man skal vise
til ting med navn framfor bokstav eller nummer fra en tidligere melding, og at
den korte teksten som følger hvert verktøykall er brukervendt tekst. Begge inn i
`CLAUDE.md` og i malen.

### Beslutninger

- **Beslutning (BK, omfang på språkfiksen):** reglene inn begge steder — repoets
  `CLAUDE.md` og «Snakk norsk» i malen. Begrunnelse: feilen rammer en kollega
  like lett som meg, og tillegget er én linje i en seksjon som alt finnes.
- **Beslutning (BK, allowlist i malen):** hele settet på seks inn nå, ikke det
  smale alternativet og ikke `TODO.md`. Begrunnelse: kritisk vei for samlingen.
  Pakken utvider med dette hva Claude får gjøre uten å spørre, for første gang —
  alle seks er lesende, og malen sier eksplisitt at de to siste er brede.
- **Beslutning (BK, ordet `port`):** forbudslinja mi («porten») ble strammet til
  «kvalitetsport», og `port` står som repoets ord om det som må passeres før en
  endring havner på `main`. Begrunnelse: den betydningen er innarbeidet og bærer
  mening; det var kvalitetsporten ved faseslutt som skulle byttes ut.

### Funn: «avvik, ikke gjennomføring» spiste leveransen i faseslutt-rapporten

**Observert.** BK om sluttrapporten: rekkefølgen leste bedre, men «det som kanskje
mangler er kort om hva som er gjort i denne runden — det ser ut til å være helt
vekk». Det var det. Jeg rapporterte hva hvert steg gjorde med filene, og
utelot hva økten leverte, fordi 0.5.0-kontrakten sier at et steg som gikk rent
ikke får egen plass.

Kontrakten er skrevet om **stegene i skillen**, og den sier ingenting om at
faseslutten også har en leveranse brukeren skal kunne se før hun sier ferdig. To
utgivelser med versjonsnummer, tre pusher og en målt permission-form sto ingen
steder i rapporten. Det er tredje observasjon på samme åpne post (`fase-slutt`s
utdatakontrakt), og den peker nå på hva som mangler framfor bare på rekkefølgen:
en fast, kort «levert i denne runden»-del, adskilt fra stegrapporteringen.

### Overraskelse

`fase-start` lastet fra `0.5.5`-mappa i cachen, `fase-slutt` fra `0.5.7` etter at
BK kjørte `/plugin marketplace update` og startet om midt i økten. Samtalen
overlevde omstarten i VS Code-utvidelsen. Konsistent med omstart-rådet i steg 0,
og verdt å merke fordi cachen får én mappe per versjon: glob-formen
`Read(~/.claude/plugins/cache/claude-code-skills/**/.claude-plugin/**)` er derfor
den som holder over tid.

## 2026-08-25 (sent kveld) — Oppstarten kostet fem godkjenninger, og jeg brøt kontrakten jeg nettopp hadde lest

Maskin `VPC-5CG3433WMH` (hjemmekontor). To utgivelser: `faseflyt` 0.5.4 og 0.5.5.
Renhetsporten kjørt etter `git add` foran push. Første økt som faktisk kjørte
0.5.3 i drift — punkt 1 i forrige STATUS («marketplace update + omstart») var
allerede utført da økten startet.

### Funn: fem godkjenningsdialoger i én fase-start

**Observert.** BK: «fem brukerspørsmål jeg må svare ja på før vi kommer i gang».
Jeg talte etterpå hvilke av mine kall som ikke matchet noen linje i
`.claude/settings.json`: nøyaktig fem. To ulike årsaker, begge mine:

- **Tre `Read` av manifestene med absolutt Windows-sti** mot tilde-baserte
  matchere. **Direkte observert i begge retninger:** samme fil lest med absolutt
  sti ga dialog; lest med `~/...` gikk gjennom. Dette avgjør samtidig den
  umålte hypotesen som har stått i STATUS siden 0.5.2 — tilde-form i en
  permission-matcher virker, men bare når kallet også skrives med tilde.
- **De to allowlistede git-kommandoene i steg 0 slått sammen med `&&`.**
  **Sluttet, ikke isolert:** at nøyaktig de fem umatchede kallene ga nøyaktig
  fem dialoger er sterk korrespondanse, men `&&` ble aldri kjørt som egen
  variabel. Testen som ville avgjort det: kjør de to kommandoene hver for seg i
  et prosjekt med begge allowlistet, og se om dialogen uteblir.

**Reelt hull i pakken, ikke bare min feil:** allowlisten fra `e4759cf` dekker
steg 0. Steg 2 kjører `git status --porcelain` og to `git log` i hver eneste økt
og var udekket. Rettet i 0.5.4.

### Beslutninger

- **Beslutning (BK, steg 6 beholdes):** kvitteringen på `## Arbeidsmåte neste
  økt` kortes IKKE ned til etiketter. Vurdert fordi den er den ene delen av
  oppstarten som ikke kan bli kort — tre punkter × én linje er gulvet. Forkastet
  fordi steget krever «konkret forpliktelse, ikke bare gjengivelse», og en
  etikettliste *er* gjengivelse: komprimeringen ville gjeninnført feilen teksten
  ble skrevet for å hindre, for tolv linjer. **Diagnosen var feil sted:** den
  lange oppstarten som utløste spørsmålet var ~35 linjer, hvorav steg 6 var tre.
  De øvrige tretti var mitt brudd på 0.5.0-kontrakten.
- **Beslutning (BK, de to småpostene):** `Bash(git add *)`-formen og det
  hardkodede «0.4.1» i eksempellinja fikses framfor å føres i `TODO.md` — «ut av
  verden». Begge i 0.5.5.

### Overraskelse: kontrakten var riktig, jeg fulgte den ikke

0.5.0 sier at normaltilfellet er én linje. Alt var rent i denne oppstarten, og
jeg skrev rundt trettifem. Kontrakten sto i skillteksten jeg hadde lest i samme
runde. Ingen pakkeendring følger av dette — pakken var ikke i veien — og det er
nettopp derfor det er verdt å loggføre: den første målingen av 0.5.0 i drift
viser at teksten kan følges eller ikke, og at det ikke er observerbart for
brukeren før utdataet alt er skrevet.

## 2026-08-25 (kveld) — Fire utgivelser: pakken sluttet å rapportere at ingenting var galt

Maskin `VPC-5CG3433WMH` (hjemmekontor). Fem commits, fire utgivelser —
`faseflyt` 0.5.0/0.5.1/0.5.2 og `web-prototype` 0.1.1. Renhetsporten kjørt etter
`git add` foran hver push: 11 søk · 0 feil, positiv kontroll 38 treff på
«faseflyt». `claude plugin validate .` passed hver gang.

### Beslutninger

- **Beslutning (BK, utdatamengde):** `fase-start` og `fase-slutt` skal rapportere
  **avvik framfor gjennomføring**. Bakgrunn: utdataet var vokst til ~60 linjer per
  fasestart, og det meste rapporterte at ingenting var galt. Reist fra bruk, ikke
  fra analyse. Skillelinja som ble lagt: rapportering som *er belegg* beholdes,
  rapportering som *gjentar en fil* går ut. Derfor er kvalitets- og
  sikkerhetsrapporten i `fase-slutt` steg 5–6 eksplisitt unntatt — å stryke den
  ville vært samme «formelt på plass, reelt borte» som er navngitt fem ganger før.
  **Dette svarer samtidig på det parkerte retningsspørsmålet i `TODO.md`**
  («én flyt, mindre maskineri») — men bare den halvdelen; dataregime-spørsmålet
  står fortsatt ubesvart.
- **Beslutning (BK, ikke nedgrader innhold):** 2026-08-18-avgjørelsen om å ikke
  trimme innhold står urørt. Den gjaldt funksjonalitet; dette gjelder utskrift.
  Ingen steg og ingen sjekk er fjernet.
- **Beslutning (BK, retest av scope-vakten):** ingen egen retest før samlingen.
  Feilmodusen er godartet (den stopper og spør), en ekte retest krever et nytt
  scaffoldet prosjekt med uprimet økt, og Mac-pre-flight, ARM-pre-flight og
  kollegatesten er dyrere umålte poster med tre uker igjen.
- **Beslutning (BK, `.claude/settings.json`):** skrives om generisk framfor å
  committes som den var eller gitignoreres.

### Scope-vakten målt for første gang — riktig utfall, drift på andre ledd

*Observert av BK i tørrkjøringen, ordlyden referert hit; jeg kjørte ikke den
økten.* BK ba naturlig om noe utenfor fase 2 (en ASCII-apekatt). Vakten navnga
seg selv, **utførte ikke**, og tilbød TODO-sporet — ingen av de to feilretningene
inntraff. Dermed er den siste umålte rytmevakten målt.

Men den drev på andre ledd av sin egen setning («fullfør fasen i stedet for å
ese»): den argumenterte for tillegget etter å ha flagget det («det er ikke et
*nei* fra meg… bryter ingenting»), og stoppet fasen for å stille et
designspørsmål med fire valg, hvorav to implementerte med én gang. **Hardet i
0.5.1** med målingen som belegg, i samme form som fase-slutt-vakten rett over —
den ble hardet på samme måte etter å ha feilet to ganger i test.

**Merk rekkevidden:** `nytt-prosjekt` skriver CLAUDE.md-avsnittet ved oppsett, så
hardningen når **ikke** prosjekter som alt er scaffoldet. Den gjelder fra neste
prosjekt.

### Fase-slutt-vakten: tredje uoppfordrede fyring, tredje gang uten å utføre

*Observert av BK, referert hit.* Denne gangen med porten begrunnet i klartekst
(«commit-steget committer og pusher uten eget klarsignal»), og med
`settings.json`-avgjørelsen etterspurt i samme melding for å spare en runde.
`[vakt-forslag-ikke-fullmakt]` er dermed den best belagte av de tre vaktene.

### Funn (observert) — pakken motsa seg selv i et positivt eksempel

`web-prototype/SKILL.md` linje 207 og 215–218 sier at `<ds-button>` ikke finnes
og aldri skal brukes. Linje 303 brukte det som anbefalt løsning, og bar `<a>` på
linje 294 brøt regelen på linje 223. Lest direkte i fila.

**Tørrkjøringens fase 2-kode gikk klar** — men bare fordi prosjektets egen
`CLAUDE.md` alt bar regelen etter at en tidligere fase betalte for den. Et ferskt
scaffoldet prosjekt har ikke det vernet, og samlingen består av ferskt scaffoldede
prosjekter. **Rettet i `web-prototype` 0.1.1.** Sjette gang mønsteret «regelen
virket fordi den lå der den alltid leses» dukker opp.

### Funn (observert) — `data-variant="primary"`: her var pakken riktig

Tørrkjøringsøkten fjernet `data-variant="primary"` og meldte det som «nøyaktig
samme stille-virkningsløse felle som `data-size`». Målt her: `components.md:198`
sier ordrett `[data-variant='secondary' | 'tertiary']` — style variant (default
is primary)`, og linje 204 har `<!-- Primary (default) -->`. **Ingen
pakkeendring.**

Forskjellen er verdt å holde fast på: `data-size` sitt svar står på linje 1367 av
~1400 i en gotcha-seksjon (plasseringsproblem); `data-variant` sitt står i
attributt-definisjonen. Det gjør episoden til et funn om **læringspunktet**, ikke
om pakken: `[pakkekilde-foer-referanse]` sender nå økten til CSS-dist-en for ting
referansefila svarer på i sin egen definisjonslinje. **Anbefaling til
tørrkjøringens faseslutt nummer tre: presiser punktet, ikke stryk og ikke
promoter** — «referansefila først; pakkens CSS når fila ikke svarer eller ser ut
til å motsi det du observerer».

### Funn (observert i to prosjekter) — `.claude/settings.json` er en falsk positiv-fabrikk

Fila er tracket fordi pakken skriver den ved oppsett, og enhver
permission-godkjenning endrer den. `fase-start` steg 2 flagget den som «arbeid
STATUS ikke vet om» både her og i tørrkjøringen samme dag. Begge øktene dempet det
på eget initiativ — de så at `logg.md` var HEAD — men det er to modellkjøringer,
ikke en regel, og hver kollega møter samme fil i hvert prosjekt. **Rettet i 0.5.2.**

Samme fil bar en absolutt sti med brukernavn, skrevet av en godkjenning, og en
regel pinnet til `faseflyt/0.4.1/` — en sti som ikke finnes etter dagens
utgivelser. Begge deler rettet i `e4759cf`.

### Hypotese, ikke funn — tilde-formen i en `Read()`-matcher

Om `Read(~/.claude/...)` faktisk ekspanderes er **ikke verifisert**. Denne økten
kan ikke måle det, siden godkjenningene alt ligger i minnet. Feiler formen, er
konsekvensen en permission-forespørsel og ingenting annet. **Testen som avgjør:**
neste `/faseflyt:fase-start` i dette repoet — leses manifestene uten prompt,
virker formen.

### Tørrkjøringen: fase 2 verifisert, og faseslutt nummer tre kjørt

BK verifiserte i nettleseren: utlån, retur, F5, to-fane-vernet mot dobbeltutlån og
nullstilling. **Fase 3 ble ikke kjørt** — se beslutningen over. Faseslutt nummer
tre er gjennomført; sluttmeldingen referert hit av BK, jeg kjørte ikke den økten.
`npm run check`: 179 filer, 0 feil. `npm run build`: bygger.

**Ratchet-ens vanskelige halvdel er målt — posten som har stått åpen siden
0.3.0.** `[pakkekilde-foer-referanse]` **overlevde strykningen**: den ble
presisert framfor strøket eller promotert, og står som to av tre mot terskelen.
Til nå har sløyfen bare vist den lette halvdelen — at et fulgt punkt strykes — og
uten den vanskelige tømmer den bare lista si hver runde uten at noe blir en varig
regel. Nå er den demonstrert **utenfor** dette repoet også. Presiseringen ble den
vi anbefalte: referansefila først, pakkens CSS når fila ikke svarer.

**`[les-regelen-foer-flagget]` ført som «uavgjort, ikke læring».** Begrunnelsen
var den riktige og ble gitt uoppfordret: ingen policy avviste noe, og det er ikke
fordi oppførselen sitter — repoet ligger på `bkaarstein`, uten regelsamling på
`main`, så situasjonen kunne ikke oppstå. Anledningen forsvant med flyttingen.
Punktet ble derfor ikke ført som innarbeidet.

**Funn (observert av BK, referert hit) — et strøket punkt kom tilbake i smalere
form.** Det nye punktet `[attributt-paa-klassen]` meldes som **tilbakefall**:
`[verdi-kontroll]` ble strøket som innarbeidet i fase 1, men var bare fulgt for
*verdier*, ikke for *attributtnavn*. Begge feiler stille. Dette er et funn om
ratchet-ens **strykningskriterium**, ikke om prototypen: «fulgt» kan være sant i
en smalere forstand enn punktet dekket, og da er strykningen for tidlig. Ingen
endring gjort på det — det trenger flere forekomster før vi vet om det er
mønster eller enkelttilfelle.

**Issue-forslaget fra tørrkjøringen ble avvist, med vilje.** Økten tilbød
`gh issue create` for DS-funnet, som steg 2e ber den om. Riktig oppførsel av
skillen — men `TODO.md` sier at issue-mekanismen finnes for kollegaer som ikke
kan redigere pakken selv, og `test-utstyrskapet` er et måleobjekt, ikke et
kollegaprosjekt. Et issue derfra ville lagt et simulert opphav inn i backloggen.
Innholdet var reelt og landet i stedet som `web-prototype` 0.1.2.

**Verifiseringsporten holdt tre av tre**, denne gangen under formuleringen «testet
ok» — den som gikk galt to ganger i tidligere test.

## 2026-08-25 (natt) — Tørrkjøringen nådde suksesskriteriet, og sikkerhetsrøyktesten viste seg å mangle sin egen kontroll

Ingen pakkeendring denne økten — ingen versjonsbump, ingen manifestendring. Én
leveranse: **issue #16**. Maskin `VPC-5CG3433WMH` (`uname -m: x86_64`), målt med
`hostname` + `uname -m` i økten, ikke antatt.

### Tørrkjøringen: fase 1 + faseslutt nummer to — BK kjørte, jeg tolket

Hjemmekontor-PC-en, samme maskin som over. **Suksesskriteriet fra oppgavearket er
nådd: minst to faseslutt.**

- **Fase-slutt-vakten fyrte uoppfordret igjen** — foreslo faseslutt etter at BK
  bekreftet at fase 1 virket, og utførte ikke. Andre observasjon, i en annen fase
  enn den første. `[vakt-forslag-ikke-fullmakt]` er dermed den rytmevakten med
  mest belegg. *Observert av BK, referert hit — jeg kjørte ikke den økten.*
- **Scope-vakten er fortsatt uprøvd.** BK ba ikke om noe utenfor fasen i fase 1.
  Den er nå den eneste av de tre som mangler måling; vinduet er fase 3.
- **Ratchet-en fyrte, men bare i den gunstige retningen.** Alle tre punktene fra
  faseslutt nummer én ble evaluert som fulgt og strøket, og to nye skrevet med
  etikett og belegg (`[pakkekilde-foer-referanse]`, `[les-regelen-foer-flagget]`).
  **Den vanskelige halvdelen — at et punkt som gjentar seg overlever strykningen
  og telles mot promotering — er umålt i tørrkjøringen**, og kan ikke måles der
  ennå: begge foregående runder innarbeidet alt. Den halvdelen er derimot målt
  her i repoet, der `[proev-forslaget-mot-prosjektets-egne-laerdommer]` har
  overlevd fire runder. Skillet føres bevisst: sløyfen er *ikke* lukket i begge
  retninger utenfor dette repoet.
- **Steg 4 (TODO-fortetning, 0.4.0) fyrte i negativ retning igjen**, med
  begrunnelse per post. Andre negative observasjon; **positiv retning — en faktisk
  fortetning — er aldri observert utenfor dette repoet.**
- **Steg 5:** `npm run check` → 0 feil på 179 filer, `npm run build` bygger med
  forventet `adapter-auto`-melding.
- **Toppnivået (læring tilbake til pakken) fyrte igjen:** skilte
  `[pakkekilde-foer-referanse]` ut som pakkefunn, tilbød issue, nektet
  `gh issue create` før klarsignal. Andre gang. **Men mønsteret å merke seg:** fase
  0 tilbød også et issue som aldri ble opprettet. Mekanismen produserer forslag
  pålitelig; det er landingen som mangler.

### Funn (observert) — sikkerhetsrøyktesten mangler positiv kontroll

`fase-slutt` steg 6 kjørte fire søk i tørrkjøringen — env-filer, uttrekksfiler,
fødselsnummer, secrets — og **alle fire ga null treff**. Fire nullsvar er ikke
skillbare fra fire søk som ikke virker.

Verifisert i pakken framfor antatt: `plugins/faseflyt/skills/fase-slutt/SKILL.md`
steg 6 (linje 112–135) lister søkene og krever «Meld hva du kjørte og hva du
fant» — **ingen positiv kontroll noe sted**. Skillen ble altså fulgt korrekt;
mangelen er i teksten. Belegget for at det er tilfeldig og ikke en regel: samme
skill gjorde en positiv kontroll *uoppfordret* i fase 0 (`git grep -c` → 1) og
ikke i fase 1. Samme instruks, to faser, ulikt utfall.

**Asymmetrien som gjør det verdt å rette:** repoets egen `CLAUDE.md` krever
«alltid én positiv kontroll i samme runde» for renhetsporten — samme slags sjekk.
Pakken krever kontrollen av seg selv og ikke av kollegaene, og steg 6 er den av de
to som kjøres i *alle* prosjekter. Femte gang mønsteret «formelt på plass, reelt
borte» dukker opp her. **Ført som issue #16**, uten `kjent-før-test`.

### Funn (premisset er umålt) — `data-size` er et plasseringsproblem

Tørrkjøringens `[pakkekilde-foer-referanse]` er ekte som observasjon: `data-size`
på `.ds-label` gjorde ingenting, og tre søk i pakkens egen CSS besvarte det
referansefila ikke svarte på. Men konklusjonen «referansefila dekker ikke dette»
holder ikke: `components.md:1367` sier at size-arv gjelder alle `ds-`-komponenter
**unntatt** `.ds-heading`, `.ds-paragraph`, `.ds-spinner` og `.ds-avatar` — presis
de fire klassene.

De to påstandene er ikke like: fila beskriver hvilke som *ikke arver*, økten
konkluderte at attributtet *bare virker* på de fire. Begge kan være sanne samtidig
(arv via CSS-variabel oppfører seg annerledes enn attributtet satt på elementet
selv), men **det er ikke målt**. Skrives issuet på øktens premiss, kan vi påstå at
fila mangler noe den har.

Det som ser ut til å holde uansett utfall: informasjonen ligger på linje 1367 av
~1400, i en gotcha-seksjon, mens `data-size` slås opp på linje 96, 119, 149, 822
og 941. **Plassering, ikke innhold** — femte gang samme mønster (etter
deny-reglene, rytmevaktene, modellmiksen og klarspråkregelen). Issue utsatt til
premisset er målt i `node_modules/@digdir/designsystemet-css/dist`.

### Funn (observert i egne filer) — en overskrift som påsto mer enn punktlisten

STATUS linje 22 sa «alle tre rytmevaktene målt i begge retninger». `logg.md`
linje 64 sa samtidig «scope-vakten er fortsatt uprøvd», og STATUS motsa seg selv
sju linjer lenger ned i sin egen «Neste»-liste. Kilden er loggens egen
mellomtittel fra 2026-08-24 (natt), som var bredere enn punktene under den —
nøyaktig det `fase-slutt` steg 1 forbyr («en overskrift skal ikke påstå mer enn
forbeholdene under den tillater»). Regelen fantes i pakken og ble brutt likevel.
**Rettet i begge filer i denne runden.**

### Porten og sjekkene (observert)

- **Renhetsporten:** `bash .github/renhet/sjekk.sh` etter `git add` → **11 søk · 0
  feil · 0 advarsler**, innebygd kontrollsøk 37 treff på «faseflyt» i `plugins/`.
  `claude plugin validate .` ✔ (marketplace-manifestet).
- **Sikkerhetsrøyktest:** `git ls-files` mot `.env`-mønstre → ingen treff; mot
  `.csv/.xlsx/.sqlite/.db/.dump` → ingen treff. Fødselsnummer og secrets er dekket
  av renhetsporten, som søker hele repoet inkludert `kunnskap/`.
- **Den positive kontrollen feilet først, og det er verdt å føre:**
  `git grep -c 'Renhetsporten' -- CLAUDE.md` ga **null treff** — ordet står i
  STATUS, ikke i `CLAUDE.md`, som sier «Porten før hver push» og `sjekk.sh`. Jeg
  valgte kontrollord uten å verifisere at det fantes. Kjørt om mot strenger jeg
  hadde verifisert: `sjekk.sh` i `CLAUDE.md` → 1, `Renhetsporten` i `STATUS.md`
  → 1. Søkene treffer.

  **Hendelsen er belegg for issue #16 fra vår egen side:** fordi søket var *merket*
  «skal gi treff», avslørte tomheten seg selv med én gang. Var det umerket — slik
  steg 6 lister sine fire søk — ville et null-svar vært uskillbart fra et rent
  utfall. Den er samtidig andre forekomst av `[maal-det-maalbare-foer-du-spor]`
  i samme økt som punktet ble skrevet.

### Beslutninger

- **Beslutning (BK, merkelapp på #16):** ingen `kjent-før-test`. Funnet kom *under*
  tørrkjøringen, og merkelappen betyr bevisst utsatt før den.
- **Beslutning (BK, rekkefølge i tørrkjøringen):** faseslutt nummer to kjøres før
  scope-vakten; scope-vakten tas midt i fase 3. Begrunnelse: ratchet-målingen
  krever en hel faseslutt, scope-vakten krever én setning — det dyre først.

## 2026-08-24 (natt) — 0.4.1 levert, og tørrkjøringen fant veggen ingen hadde forutsett

Maskin `VPC-5CG3433WMH`, `uname -m: x86_64` — målt med `hostname` og `uname -m`
før commit-meldingen ble skrevet, ikke antatt. Én commit pushet: `378a624`.
`faseflyt` 0.4.0 → 0.4.1. Issue #11 lukket.

### Levert

- **`fallgruver.md`: `[selvobservasjon-i-samme-artefakt]`** (issue #11, `378a624`,
  0.4.1). Plassert under Testdisiplin framfor i fallgruve-listen — det er en
  målefeil av samme slag som de fire punktene der, og de har alle etikett og
  belegg. Begge manifester bumpet, CHANGELOG ført. Patch: ingen atferdsendring.
  De tre veiene issuet skisserte (eget måleprosjekt uten læringssløyfe,
  dokumentert instrumentmodus, godta-og-mål-ved-første-eksponering) er **ikke**
  valgt — det står i issue-kommentaren ved lukking.

### Målinger (observert)

- **Porten per commit:** `sjekk.sh` 11 søk · 0 feil · 0 advarsler, positivt
  kontrollsøk 37 treff på «faseflyt» i `plugins/`. `claude plugin validate .` ✔.
- **Cache mot repo, tre ledd kjørt** (`marketplace update` → omstart → mål om):
  11 filer, 0 avvik med linjeskift normalisert. **Positiv kontroll mot cache
  0.4.0 ga 2 avvik — `plugin.json` og `fallgruver.md`, presis de to filene
  commiten rørte.** Kontrollen viste altså ikke bare *at* den kunne finne avvik,
  men at den fant de riktige. x86_64-leddet er dermed målt om; **ARM-leddet er
  fortsatt umålt.**
- **Kjørende versjon etter omstart = 0.4.1.** Belegg: basekatalogen i
  `fase-slutt`-kallet er `…/faseflyt/0.4.1/skills/fase-slutt`. Under
  tørrkjøringen meldte `fase-start` steg 0 selv «kjørende og installert er begge
  0.4.1». Det var ikke målbart fra denne økten tidligere på kvelden — en kjørende
  prosess beholder versjonen den startet med, som `TODO.md` sier.

### Tørrkjøring av Oppgave 5 (Utstyrsskapet) — BK kjørte, jeg tolket

Blank økt i `C:\dev\test-utstyrskapet`, utenfor repoet. Kun oppgaveteksten limt
inn — ingen slash-kommando, ingen kontekst fra dette repoet. Fase 0 implementert
og verifisert i nettleser, faseslutt nummer én kjørt. Fase 1 ikke begynt.

**De tre umålte påstandene fra `TODO.md`:**

| Påstand | Utfall |
|---|---|
| «nytt prosjekt» trigger av seg selv | **observert** — trigget, og tilbød grilling |
| `web-prototype` trigger av seg selv for webapp-typen | **observert** |
| Designsporets mekanikk ligger i oppskriften | **ikke prøvd** — utenfor oppgave 5 |

**Rytmevaktene — to av tre målt, og de to i begge retninger:**
*(Overskriften sa opprinnelig «alle tre målt, og i begge retninger». Rettet
2026-08-25: den påsto mer enn punktlisten under den tillot — se det tredje
punktet, som alltid har sagt at scope-vakten er uprøvd. Feilen ble videreført til
STATUS linje 22 og oppdaget først et døgn senere.)*

- **Plan-vakten fyrte uoppfordret** i fase 0 (byttet selv til planmodus), og
  **holdt seg i ro** i fase 1 med begrunnelse: «planen for fase 1 er allerede
  godkjent i `kunnskap/plan.md`, så plan-vakten er tilfredsstilt». En vakt som
  alltid fyrer er støy; dette er den vanskelige halvparten.
- **Fase-slutt-vakten fyrte uoppfordret** da BK sa «siden ser riktig ut», og
  **utførte ikke**: «Jeg gjør ingenting av det før du sier fra. «Verifisert, alt
  OK» er ikke det samme som «avslutt fasen».» Det er `[vakt-forslag-ikke-fullmakt]`
  — korrigeringen som var *årsaken* til issue #11 — målt hermetisk i en økt som
  aldri har lest vår STATUS. Issuet konkluderte at en fjerde ren trial ikke var
  tilgjengelig i testprosjektet; den ble tilgjengelig ved å måle utenfor repoet.
  Det bekrefter den tredje veien issuet skisserte, i praksis.
- **Scope-vakten er fortsatt uprøvd** — BK ba ikke om noe utenfor fasen.

**Læringssløyfen lukket ende til ende, utenfor dette repoet, for første gang.**
`fase-slutt` skrev tre etiketterte punkter til `laering.md` + STATUS; `fase-start`
etter `/clear` kvitterte ordrett i formen skillen krever («Denne økten …»), ikke
som gjengivelse. Og den bar **svaret**, ikke bare påminnelsen: påminnelseslista
inneholdt hvilke `<ds-*>` som faktisk finnes — kunnskapen forrige økt betalte
1377 linjer for.

**Toppnivået fyrte også:** økten skilte `[ds-oppslag]` ut som pakkefunn framfor
prosjektfunn, foreslo issue-tekst, sa selv «ingen prosjektdata i den», og nektet
å kjøre `gh issue create` før klarsignal. Alle fire kravene fra planens
«Læring tilbake til pakken», uoppfordret.

**Fikser observert i drift for første gang:** 0.2.3 (`.gitignore` utvides
framfor å overskrives — den konstaterte at SvelteKit-oppsettet alt dekket
`node_modules`, `.env`, byggemapper, og lot den være), 0.2.4 (klarspråk — «økt»
forklart som «en arbeidsstund fra du åpner samtalen til du tømmer den»), 0.4.0
steg 4 (**negativ retning**: sjekket `TODO.md` og konkluderte korrekt at
ingenting skulle fortettes, med begrunnelse per post).

**Probedisiplinen fyrte sju ganger, ingen av dem bedt om:** `curl` gir HTTP 200
men `ssr = false` betyr at tittel og banner ikke er i svaret — «det er derfor du
må se den»; `read:org` navngitt som mulig sperre *før* forsøket; commit-innhold
sjekket for `node_modules` før commiten ble laget; `.gitignore` lest framfor
antatt; positiv kontroll i sikkerhetsrøyktesten (`git grep -c 'Utstyrskapet' --
CLAUDE.md → 1`); org-regelsamlingen undersøkt med `gh api` framfor gjettet
(«undersøkt, ikke gjettet»); og at admin-overstyring kan bli loggført i
revisjonsloggen, sagt før valget ble tatt.

**Verifiseringsporten fikk den formen `TODO.md` sier mangler, to ganger** — uten
at kravet står i plan-malen. Fase 0: «Åpne `http://localhost:5173` — du skal se»
+ tre observerbare ting. Fase 1: «14 gjenstander, tellere som summerer til 14,
minst to rader merket over tiden, og at begge filtrene virker». Ført som
observert med forbehold: **én økt viser at oppførselen er oppnåelig, ikke at den
er pålitelig.** Fiksen `TODO.md` foreslår (kravet inn i malen) er fortsatt det
som gjør den forutsigbar.

**Kunnskapsfangst-regelen fra CLAUDE.md-malen fyrte midt i fasen** — etter
repo-flyttingen skrev økten logg og STATUS med én gang, men **committet ikke**:
«commit hører til faseslutt, og den porten er din». To mekanismer fra to ulike
filer som spilte sammen uoppfordret.

### Funnet ingen hadde forutsett (observert)

**Et nytt repo i `vestfoldfylke` arver en org-regelsamling som gjør at én person
ikke kan fullføre en faseslutt.** Målt i tre trinn, hvert med et kall:

1. Push til `main` avvist. `gh api repos/vestfoldfylke/test-utstyrskapet/rules/branches/main`
   ga to regler, `pull_request` + `non_fast_forward`, arvet fra org-nivå. Første
   push gikk gjennom fordi den *opprettet* grenen.
2. PR #1 kunne ikke godkjennes av egen konto.
3. `gh pr merge --admin` hjelper ikke: regelsamlingen ligger på organisasjonsnivå
   (`vestfoldfylke`, ruleset `9211483`) med `require_last_push_approval: true`, og
   kontoen står ikke i omgåelseslista — den lista er heller ikke lesbar uten
   `admin:org`. Flagget feilet på samme regel som det skulle omgå.

Det stemmer presis med målingen 2026-08-18 i `plan.md`: `Hardening`,
`enforcement: active`, **tomme bypass-aktører**, 1 godkjenning +
`require_last_push_approval`. Vårt eget repo ble eksplisitt fritatt 2026-08-19,
og **vi har siden målt unntaket vårt og lest det som normalen.**

Konsekvensen for pakken: `fase-slutt` steg 7 er skrevet for commit + push rett på
`main`. I organisasjonens standardoppsett stopper første faseslutt i et nytt
prosjekt, og løsningen krever et annet menneske hver fase. Skillen *tilpasset* seg
til gren + PR da BK valgte det i dialog — den brøt ikke sammen — men teksten sier
ingenting om noen av delene.

### Friksjonsfunn

- **Hver git-kommando ber om tillatelse.** `nytt-prosjekt` steg 6 skriver
  marketplace-deklarasjon og (ved persondata) deny-regler, men **ingen
  allow-regler**. Friksjonen er innebygd i oppsettet. Seks grupper × mange
  dialoger, og `/permissions` finnes ikke i VS Code-utvidelsen — så det må inn i
  fila på forhånd.
- **Oppstarten er ~40 linjer** før arbeidet begynner: status, grenvalg, forslag,
  tre kvitteringer, seks påminnelser. Tett og nyttig for BK; mye å lese på minutt
  null for en gruppe. Observasjon, ikke defekt.

### Grenser på det som ble målt — skal stå som grenser

- **`/grill-me` ble gjennomført fullt ut og virket.** Men ingen av svarene gikk
  *mot* anbefalingen, så hvordan grillingen håndterer å bli motsagt er uprøvd.
  (Jeg meldte først dette som at grillingen «ikke ble målt»; BK korrigerte, og
  hadde rett — se `laering.md`.)
- **Org-repo-opprettelsen er målt på en konto som er repo-admin.** At BK kan
  opprette repo i organisasjonen sier ingenting om en vanlig kollega. Hører i
  pre-flighten.
- **Ingen bildefiler, ingen ekte data:** de tre låntakerne i oppgaven er
  oppdiktede figurer. Bekreftet av økten selv i steg 6.

### Beslutninger

- **Beslutning (BK, plassering av issue #11-linjen):** under Testdisiplin i
  `fallgruver.md`, ikke i fallgruve-listen. Begrunnelse: det er en målefeil av
  samme slag som de fire punktene der, og etikett + belegg er formen de har.
- **Beslutning (BK, repo-plassering i tørrkjøringen):** org først, deretter
  flyttet til `bkaarstein/test-utstyrskapet` etter at PR-veggen krevde et annet
  menneske og det var sen kveld. Begrunnelse for org først (mitt råd): personlig
  konto måler en sti ingen kollega går. Begrunnelse for flyttingen: funnet var i
  banken, og org-konfigurasjonen hadde ikke mer å lære oss i denne tørrkjøringen.
  Kostnaden var en kveld med friksjon og en PR som måtte slås sammen etter
  flytting; utbyttet var det eneste funnet ingen hadde forutsett, tre uker før
  samlingen framfor på dagen.
- **Beslutning (BK, samlingsrepo) — ikke endelig:** lener mot ferdig opprettede
  repo med hardening i unntakslisten. BK har bekreftet at unntak per repo er
  innen egen rekkevidde og at praksisen er sikkerhetsklarert. Konsekvens som ikke
  er lukket: da innføres en sti ingen har prøvd — `nytt-prosjekt` steg 7 *tilbyr
  å opprette* repo, og hva den gjør når remote finnes fra før er umålt. Hvordan
  repoene opprettes (tomme kontra initialisert med README) avgjør om første
  commit kolliderer.
- **Beslutning (BK, kveldens avslutning):** commit av dokumentasjonsendringen i
  testprosjektet, men **ingen ny faseslutt** der — fase 0 fikk sin, fase 1 er
  ikke begynt, og logg + STATUS var alt oppdatert av kunnskapsfangst-regelen.

### Rettelse

**Mitt råd om `gh pr merge --admin` var feil.** Jeg antok at repo-admin kunne
overstyre, uten å lese prosjektets egen måling fra 2026-08-18 som sier at
regelsamlingen ligger på org-nivå med tomme bypass-aktører. Svaret sto i
`plan.md`. Se `laering.md` — punktet er en gjentakelse av en etikett som ble
strøket som innarbeidet i forrige faseslutt.

## 2026-08-24 (kveld) — faseflyt 0.4.0: to skills levert, og porten som ikke leste skills

Hjemme-PC `VPC-5CG3433WMH` (AMD64) — målt med `hostname` og `uname -m`, ikke
antatt. Fire commits, alle pushet: `ffc43d4`, `967d5d3`, `8eda2c3`, `5f0f1aa`.
`faseflyt` 0.2.4 → 0.3.0 → 0.4.0. Issues #6 og #4 lukket.

**Rettelse som gjelder pushet historikk:** commit-meldingene til `967d5d3` og
`8eda2c3` sier at målingene ble gjort «på kontor-PC-en». Det er feil — de ble
gjort på hjemme-PC-en, maskinen over. Historikken er ikke omskrevet; denne linjen
er korreksjonen. Selve målingene står, det er maskinnavnet som var galt.

### Levert

- **`/faseflyt:hjelp`** (issue #6, `ffc43d4`, 0.3.0). Flyten, de fem kommandoene,
  og — hvis `kunnskap/STATUS.md` finnes — hvilken fase prosjektet står i.
  Avgrenset eksplisitt mot `fase-start`, som leser samme fil, og avsluttet med en
  stopp-instruks. 67 linjer.
- **`fase-start` steg 2: oppdager uavsluttet økt** (issue #4, `967d5d3`, 0.3.0).
  Ucommittet arbeid, og commits som kom etter at `logg.md` sist ble endret. Steg
  2–7 renummerert til 3–8.
- **Renhetsporten sjekker skill-frontmatter** (`8eda2c3`). Ellevte søk i
  `sjekk.sh`, strukturelt framfor mønsterbasert. `docs/installasjon.md` rettet.
- **`fase-slutt` steg 4: fortetter avklarte TODO-poster** (issue #4s
  tilleggsmulighet, `5f0f1aa`, 0.4.0). Forslagssteg med klarsignal, aldri
  automatisk sletting. Samme regel i TODO-malen. Steg 4–7 renummerert til 5–8.

### Beslutninger

- **Beslutning (BK, `hjelp`-omfang):** skillen leser STATUS hvis den finnes,
  framfor å være rent statisk. Begrunnelse: den halvparten kan per definisjon
  ikke drive fra README, som er den feilen issue #6 selv advarte mot.
- **Beslutning (BK, ordforklaringer i `hjelp`):** ordene forklares i setningen de
  brukes i — tabellen fra `nytt-prosjekt` kopieres IKKE inn. Begrunnelse: to
  tabeller å holde i takt er den to-kopier-driften `nytt-prosjekt` alt har vært
  gjennom.
- **Beslutning (BK, issue #4s tilleggsmulighet):** bygges som forslagssteg, ikke
  som rydding. Begrunnelse: begge gangene dette repoet har ryddet sin egen
  `TODO.md`, var den verdifulle handlingen å **fortette til en peker** framfor å
  slette — deny-runden fra 290 linjer til en tabell med fjorten rader,
  VURDERINGSPUNKT-seksjonene fra 60 linjer til åtte. Begge krevde å vite HVOR
  innholdet ble flyttet, som er nettopp det en automatisk rydding ikke vet.
- **Beslutning (BK, porten):** frontmatter-søket legges i `sjekk.sh`, og
  `docs/installasjon.md` slutter å love en CI som ikke finnes.

### Funn (observert)

- **`claude plugin validate` leser BARE manifester.** Både `validate .` og
  `validate ./plugins/faseflyt` meldte «Validation passed» og skrev selv at de
  leste manifestfila. Ingen av dem åpner `SKILL.md`. En skill med ødelagt
  frontmatter passerte altså hele porten grønt. Samme feilmodus som
  binærfil-hullet: «0 feil» betydde «jeg så ikke etter». Tettet i `8eda2c3`,
  bevist med kanarifugl på alle fire bruddene (første linje ikke `---`,
  frontmatter ikke lukket, `name` feil, `description` mangler) — hver ga sin egen
  melding og exit 1.
- **`git log --since=<bar dato som er i dag>` har blindsone.**
  `--since=2026-08-24` ga 0 treff mens seks commits fra samme dag fantes;
  `--since='2026-08-24 00:00'` ga 6. Git tolker en bar dato som er i dag som
  «nå», ikke som midnatt. Det var mekanismen issue #4 selv foreslo, og blindsonen
  ligger nøyaktig på dagen sjekken oftest kjøres — den ville meldt «alt klart»
  med ucommittet arbeid på disken. Erstattet av commit-forankret form, som ikke
  har noen dato å tolke feil.
- **Tom verdi i en git-range feiler stille.** `git log -1 --format=%H --
  kunnskap/logg.md` gir tom streng når loggen aldri er committet, og
  `git log --oneline ..HEAD` er da gyldig syntaks (= `HEAD..HEAD`) som svarer
  tomt uten feil. «Loggen aldri committet» ville lest som «alt loggført». Målt i
  et tomt test-repo. Står som eksplisitt regel i skillen.
- **`maler.md` pekte på «steg 6» i `fase-slutt`.** Malen installeres i
  prosjektets `CLAUDE.md`, så renummereringen ville brutt referansen stille i
  HVERT nytt prosjekt. Funnet av et bredt søk (`steg [0-9]` over hele `plugins/`);
  det smalere søket jeg brukte ved forrige renummerering ville ikke funnet det.
  Rettet til å navngi steget framfor nummeret.
- **Cache mot repo på hjemme-PC-en: 11 filer, 0 avvik.** Linjeskift normalisert
  (cachen CRLF, repoet LF). Positiv kontroll: samme metode mot cache-versjon
  0.2.4 fant avvik, så metoden kan se forskjeller. Tre ledd stemmer: kjørende =
  installert = repo = 0.4.0, commit `5f0f1aa`. Cachen holder seks versjoner;
  `0.3.0` kom aldri inn, siden oppdateringen skjedde etter at den var avløst.
  **Denne målingen lukker IKKE TODO-posten om cache-verifisering.** Den posten
  ber eksplisitt om at målingen gjøres om på maskinen tørrkjøringen skjer på, og
  peker på kontor-PC-en (Snapdragon/ARM). Målingen 2026-08-20 var også på
  hjemme-PC-en, så denne bekrefter en ny versjon på samme maskin — ikke en ny
  maskin. ARM-leddet er fortsatt umålt.
- **Skillen laster.** `/faseflyt:hjelp` dukket opp i skill-listen etter
  `marketplace update` + omstart av VS Code. Det er den positive kontrollen på at
  frontmatteren faktisk er gyldig — noe `validate` ikke kunne svart på.

### Feil i eget arbeid

- **HOVEDFEILEN: jeg navngav maskinen uten å måle den.** Jeg skrev «kontor-PC
  (Snapdragon/ARM)» i loggen og «kontor-PC-en» i to commit-meldinger som nå er
  pushet. Målt i ettertid, etter at BK stoppet det: `hostname` gir
  `VPC-5CG3433WMH` og `uname -m` gir `x86_64`. Det er hjemme-PC-en.
  Sannsynlig årsak, og den er verre enn slurv: `TODO.md` sier at
  cache-målingen må gjøres om på kontor-PC-en, og jeg leste maskinen jeg satt på
  som den maskinen fordi det gjorde historien hel. Konsekvensen var reell —
  jeg meldte i chatten at TODO-posten var lukket, og den er fortsatt åpen.
  Repoets egen regel er at målinger navngir maskinen; da må maskinen måles, ikke
  utledes av hva som ville passet.

- **README-raden jeg selv foreslo var feil norsk.** «Når du har glemt hvordan det
  gikk» leser som *hvordan det endte*; meningen var *hvordan det virker*. Den sto
  i et godkjent ordlyd-forslag og ble committet — og ble først oppdaget da jeg
  leste `git show` på min egen commit. Rettet med `--amend` før push.
- **Rewrap etter en margin som ikke finnes.** Jeg «rettet» en CHANGELOG-linje til
  80 tegn ut fra en antakelse om repoets konvensjon. Målt etterpå: maks
  linjelengde er 90 i CHANGELOG, 101 i `fase-start/SKILL.md` og 167 i de andre
  skillene. Regelen fantes ikke. Endringen var harmløs, premisset var ikke målt.

## 2026-08-24 — PATH fikset, 0.2.4 målt om, tolv beslutninger avgjort; issue #5 lukket

Hjemme-PC `VPC-5CG3433WMH` (AMD64). Fire pusher: `2003cb7`, `ef6e66d`,
`41f0c97`, `420844a`. Ingen versjonsbump — ingen av endringene rører `plugins/`.

### Levert

- **`claude` på PATH.** `%USERPROFILE%\.local\bin` lagt i bruker-PATH via
  registeret (`ExpandString`-typen bevart; `setx` unngått fordi den trunkerer
  over 1024 tegn), `WM_SETTINGCHANGE` kringkastet. Verifisert etter omstart:
  `claude` løses opp i Bash-verktøyet, og `claude plugin validate .` kjørte via
  PATH framfor absolutt sti.
- **README, issue #5** (`2003cb7`): ny seksjon «Trenger du alt dette?» før «Kom
  i gang», «feil er normalt» i steg 5, og FAQ-punkt om å skru av flyten
  (`disable`/`uninstall`/`marketplace remove`, `--scope`, oppføringen i
  `.claude/settings.json`). Issue lukket med kommentar om at README-testens funn
  føres som ny issue.
- **Workflowen merket inert + porten peker på PATH-formen** (`ef6e66d`).
- **Ingen automatisk port; 1.0 redefinert** (`41f0c97`).
- **Repo-tillatelser committet** (`420844a`): `Bash(git add *)` og
  `Bash(bash .github/renhet/sjekk.sh)`.
- **Fem issues merket `kjent-før-test`** (#3, #7, #8, #9, #10). Ny label
  opprettet. #4, #6 og #11 står umerket fordi de skal lukkes før testen.

### Beslutninger

- **Beslutning (BK, retning):** **likt for alle** — ingen splitt mellom
  maintainer og kollega. Forenklinger gjelder alle. Dette **kansellerer** den
  tredje av de tre blokkerte leveransene («hva skal ut av kollegaenes prosjekter
  og inn i vedlikeholderdokumentasjonen»), siden den forutsatte et skille.
  Produksjonsgap-fila og artefaktreglene står igjen.
- **Beslutning (BK, dataregime):** spørsmålet «ekte data eller oppdiktede» ved
  oppsett er en god idé uansett — men planlegges **etter** samlingen: alle seks
  oppgavene er syntetiske, så på dagen ville det hatt ett riktig svar for alle 30.
- **Beslutning (BK, Actions):** Actions droppes for repoet.
- **Beslutning (BK, port):** **ingen automatisk port bygges.** Pre-push-hook
  vurdert og forkastet — krever én config-kommando per maskin, følger ikke med i
  klonen, kan omgås med `--no-verify`, og ingen kan se fra repoet om den er aktiv
  hos noen. Utviklere som vedlikeholder pakken pusher fra eget oppsett, der den
  stille ikke er satt opp. Porten er manuell og skal forbli det.
- **Beslutning (BK, 1.0):** 1.0 kommer etter samlingen, og krever **ikke** en
  port. Ny definisjon: prøvd på samlingen, funnene rettet, og fraværet av
  automatisk sjekk dokumentert.
- **Beslutning (BK, køen):** issues bærer køen, `TODO.md` bærer beslutninger og
  resonnement, STATUS bærer nå. En TODO-post som modnes til en definert endring
  forlater `TODO.md` samme dag.
- **Beslutning (BK, samlingen):** **14. september**, seks grupper, deltakernes
  egne maskiner, satt opp på forhånd sammen med BK. Blanding av Mac, ARM og
  AMD64. Spores ikke her.
- **Beslutning (BK, kollegatest):** én testperson på Mac — samme person dekker
  Mac-pre-flighten og profil A.
- **Beslutning (BK, `fint-samtykke`):** legges bort. Det er et eget prosjekt, og
  posten hører ikke i dette repoets sporing.
- **Beslutning (BK, issue #11):** godta begrensningen og skriv linjen i
  `fallgruver.md` framfor å bygge måleprosjekt eller instrumentmodus.
- **Beslutning (BK, tørrkjøring):** BK kjører den selv.
- **Beslutning (BK, `.claude/settings.json`):** committes, ikke
  `settings.local.json` — reglene er repospesifikke og like på alle maskiner.

### Funn (observert)

- **Versjonssjekkens tre ledd mot 0.2.4, alle grønne:** installert 0.2.4,
  marketplace-klone `86c0673` = `origin/main`, cache innholdsren. Ni av ti
  pakkefiler er byte-identiske; den tiende (`fase-start/SKILL.md`) avviker bare i
  linjeskift — cache CRLF 3966 B mot arbeidstre LF 3891 B, differanse 75 B = én
  CR per linje. **Presisering til TODO:** indeksen er LF for alle ti, mens
  arbeidstreet er CRLF for ni og LF for én. TODO sa «repoet LF».
- **0.2.4 endret bare `nytt-prosjekt`.** `fase-start/SKILL.md` er identisk i
  0.2.3 og 0.2.4, så det hadde ingen betydning hvilken av dem økten lastet.
- **Kjørende versjon observert i begge retninger:** skill-kallets basekatalog var
  `...\0.2.3\...` før omstart og `...\0.2.4\...` etter. To PID-er (30228, 32532)
  holdt 0.2.4, begge levende.
- **Pakkens tokenkostnad, ikke kjent før:** ~668 tokens alltid-på per økt;
  `nytt-prosjekt` ~6,8k når den kalles (`claude plugin details faseflyt`).
  Alltid-på-tallet er lavt nok at bekymringen i «Helhetsvurdering» om
  tokeneffektivitet antakelig er ubegrunnet.
- **`.claude/settings.json` når ikke kollegaers økter.** Plugin-cachen inneholder
  bare `.claude-plugin/plugin.json` og `skills/`, fordi pluginkilden er
  `./plugins/faseflyt` og repo-rotens `.claude/` ligger utenfor den.
  `plugin details` gir 0 agents, 0 hooks, 0 MCP-servere — ingen kanal der en
  plugin injiserer tillatelser.
- **Det finnes en ferdig kollegatest-protokoll** i `kunnskap/kollegatest.md` (116
  linjer: profiler, tidsbudsjett, tre regler for observatørrollen, notatmal).
  Verken STATUS eller TODO nevner den, og forutsetningen den selv setter
  («testplan test 1–3 grønne») har vært oppfylt siden 17.08.
- **Webapp-typen dekkes av ingen av kollegatestprofilene** — A kjører
  script/API, B kjører dokumentasjon. Verifiseringsplanens punkt 2 krever én
  tørrkjøring per type, og webapp er typen alle seks samlingsoppgavene bruker.
  Den måles bare av BKs tørrkjøring.
- **Åtte av ni issues sa «Timing: etter merge av PR #2»**, som ble merget 18.08.
  Køen ventet altså ikke på noe, og hadde ikke gjort det på en uke.
- **`enabledPlugins` er et objekt med boolske verdier**, ikke en liste — lest
  ordrett fra `maler.md` framfor gjettet.

### Feil i egne målinger, alle rettet i samme runde

Ført fordi belegg-kravet gjelder også når målingen var min:

- `grep -c $'\r'` ga 75 for begge filene fordi mønsteret kollapset til tomt og
  matchet hver linje. Konklusjonen «begge er CRLF» ble sagt før byte-sjekk.
  Avløst av `git ls-files --eol` + `cmp`.
- `ps -p` meldte begge PID-ene døde; Git Bash ser bare MSYS-prosesser, ikke
  native Windows-prosesser. Avløst av `Get-Process`.
- PATH sto et øyeblikk som én ugyldig oppføring fordi `Where-Object` returnerte
  skalar og `+` konkatenerte framfor å legge til. Rettet umiddelbart og
  verifisert oppføring for oppføring.
- Lenkesjekken meldte falsk brutt lenke i `TODO.md` fordi den ikke løste
  relativt til fila. Rettet, og positiv kontroll lagt til.
- Commit-melding skrevet med `-m` og transliterte æøå («hoerer», «Maalt») i
  strid med repoets `git commit -F`-regel. Amendet før push.

### Porter

- Per commit: renhetssjekk **10 søk · 0 feil · 0 advarsler** med positivt
  kontrollsøk, og `claude plugin validate .` ✔. Porten ble kjørt om etter at det
  stagede endret seg.
- **Porten fanget noe på første bruk etter at den ble erklært eneste port:**
  `.claude/settings.json` var skrevet av tillatelsessystemet og kom med i
  `git add -A` uten å være del av avtalt omfang. Tatt ut av commiten, lagt fram,
  og committet separat etter beslutning.
- Ved faseslutt i tillegg: ingen `.env`-filer tracket, ingen 11-sifrede tall,
  ingen secrets, ingen Office-/datafiler, `kunnskap/lokalt/` ikke tracket, og
  alle relative lenker i README/CLAUDE.md/plan/TODO/STATUS peker på filer som
  finnes.

## 2026-08-21 (sent kveld) — Køpunkt 2 levert: faseflyt 0.2.4 + repo-CLAUDE.md; promoteringen landet

Hjemme-PC-en `VPC-5CG3433WMH` (AMD64). To pusher: `4d86520` (faseflyt 0.2.4,
begge manifestene bumpet) og `f1b4a68` (repo-CLAUDE.md).

### Målt først: cache ren mot 0.2.3

Versjonssjekkens steg 0 meldte grønt (kjørende 0.2.3 = installert 0.2.3,
marketplace-klone = remote `3ec006f`). Innholdsmåling: alle 10 pakkefiler i
`plugins/faseflyt/` identiske mellom cache og repo, linjeskift normalisert,
positiv kontroll OK. Eneste avvik i fillisten: `.in_use/25916` — kjøretidsmarkør
(PID), ikke pakkeinnhold. **Målingen ble datert i samme økt** da 0.2.4 ble
pushet — forventet og flagget: installert står nå på 0.2.3, repo på 0.2.4.

### Levert (alle tre med ordlydsforslag + klarsignal per punkt før skriving)

- **Repo-CLAUDE.md** (`f1b4a68`): promoteringen av
  [beskrevet-omfang-er-avtalt-omfang] etter fjerde påfølgende faseslutt-innslag,
  pluss porten før push, pakkeendringsrutinen, måle-/språkregler og lokale
  filer. Ordet «fint» bevisst unngått i fila («unntakslisten i
  `.github/renhet/`») så den ikke trenger unntaksoppføring.
- **Språkregel i CLAUDE.md-malen** (0.2.4, `maler.md`): ny seksjon «Snakk
  norsk» inne i malblokken — ordene som møter brukeren i hver økt (fase,
  fase 0, verifisere, faseslutt, planmodus, `/clear`) med
  én-setnings-forklaringer. Delelinjen fra TODO: oppsettsordene blir stående i
  `nytt-prosjekt`.
- **Klarspråktabell-speiling** (0.2.4, `nytt-prosjekt/SKILL.md`): nye rader
  `økt`, `fasestart`, `sikkerhetssjekk`; `fase` utvidet («én fase, én ting å
  sjekke»); radene i websidens rekkefølge.

### Beslutninger

- **Beslutning (BK, køpunkt 2):** alle tre delpunktene godkjent samlet («Kjør
  alle») etter ordlydsforslag per punkt — promoteringen, språkregelen og
  speilingen.

### Funn (observert)

- **Kilden hadde flere avvik enn notatet:** `TODO.md` navnga tre ordlisterader
  (`fasestart`, `sikkerhetssjekk`, utvidet `fase`); mekanisk sammenligning av
  websidens ordliste mot tabellen fant en fjerde (`økt`). Den ble med i
  leveransen. «Utformet» i STATUS viste seg å bety spesifikasjonen i TODO, ikke
  en ferdig tekst — tre grep-søk i loggen bekreftet at ingen ferdigtekst fantes.

### Porter

- 0.2.4-commiten (`4d86520`): renhetssjekk **10 søk · 0 feil · 0 advarsler**,
  `claude plugin validate .` ✔.
- CLAUDE.md-commiten (`f1b4a68`): renhetssjekk **10 søk · 0 feil · 0
  advarsler**, `plugin validate` ✔.

## 2026-08-21 (kveld) — faseflyt 0.2.3: vurderingspunkt installasjon lukket + versjonssjekk; økten kjørte selv 0.1.0 uten å vite det

Hjemme-PC-en `VPC-5CG3433WMH` (AMD64). **Pakkeendring pushet:** `156dd94`,
faseflyt 0.2.3, begge manifestene bumpet.

### Levert

- **Installasjonsvernet** (vurderingspunktet fra 2026-08-20, alle fire
  spørsmålene besluttet av BK via valgspørsmål, ordlyd godkjent før skriving):
  steg 6 i `nytt-prosjekt` fikk nøkkeleierskap + flettregel + før/etter-visning
  med klarsignal + målbar etterkontroll; deny-settet tilbys som tillegg til
  eksisterende `deny`-liste; `maler.md` merker JSON-dokumentet som mal for ny
  fil med flettregelen rett under; steg 7 utvider eksisterende `.gitignore` i
  stedet for å overskrive.
- **Versjonssjekk som nytt steg 0** i `fase-start` og `nytt-prosjekt` (BKs
  bestilling denne økten): tre ledd — kjørende / installert / org-repo — varsel,
  aldri port, myk feiling uten nett. CHANGELOG 0.2.3, `fint-unntak.txt` oppdatert.

### Beslutninger

- **Beslutning (BK, nøkkeleierskap):** pakken eier kun
  `extraKnownMarketplaces.claude-code-skills` og `enabledPlugins`-oppføringene
  som slutter på `@claude-code-skills`; alt annet urørt, også ukjente nøkler.
- **Beslutning (BK, malform):** komplett JSON-dokument beholdes for ny fil,
  eksplisitt flettregel for eksisterende — et fragment kan ikke kopieres ordrett,
  så instruksen er vernet, ikke formen.
- **Beslutning (BK, kontroll):** før/etter-visning + klarsignal ved eksisterende
  fil, og etterkontroll alltid: hver gammel nøkkel intakt med samme verdi.
- **Beslutning (BK, .gitignore):** det smale hullet (fil uten repo) lukkes med én
  setning; utvidelsen (persondata-linjer i eksisterende repoer) ble IKKE tatt.
- **Beslutning (BK, versjonssjekk):** tre-ledds sjekk i BEGGE skillene, samme
  0.2.3 — nytt-prosjekt er stedet skaden er størst (gamle maler).

### Funn (observert)

- **Kjørende ≠ installert.** Denne øktens skill-kall lastet fra
  `cache/.../faseflyt/0.1.0/` mens `installed_plugins.json` sa 0.2.2
  (`4b64670`, oppdatert 2026-08-20 21:40). `0.1.0/.in_use/12176` peker på en
  `claude`-prosess startet 2026-08-20 kl. 17:21 — FØR oppdateringen. 0.1.0
  avviker fra 0.2.2 i 8 innholdsfiler (fase-start tilfeldigvis identisk, så
  øktens instruks var uskadd; fase-slutt var IKKE identisk — repoets 0.2.3-versjon
  ble lest og fulgt i stedet). Forklaringen «en kjørende prosess beholder
  versjonen den startet med» er konsistent med alle målingene, men mekanismen er
  ikke direkte verifisert. Konsekvens: måleprosedyren «installert = repo» har
  fått et tredje ledd — **omstart av Claude Code etter update**.
- **Renhetssjekken fanget linjebryting:** omflettet tekst kastet to legitime
  FINT-deklarasjonslinjer ut av den eksakte unntakslisten (exit 1). Behandlet
  etter sjekkens egen veiledning: maler.md-linjen brutt om så
  `fint-graphql`-autofilteret dekker den, SKILL.md-oppføringen i
  `fint-unntak.txt` oppdatert. Kontrollsøket sto på 23 treff.

### Porter

- Pakke-commiten (`156dd94`): renhetssjekk **10 søk · 0 feil · 0 advarsler**,
  `claude plugin validate .` ✔ (full sti `~/.local/bin/claude.exe`).
- Kunnskap-commiten (denne): renhetssjekk **10 søk · 0 feil · 0 advarsler**
  (kontrollsøk 23 treff), `plugin validate` ✔. Rask sikkerhetssjekk: ingen
  env-filer tracked, ingen 11-sifrede tall, `client_secret` kun i
  instruksjonstekst, ingen tracked filer i `kunnskap/lokalt/` eller datamapper.

## 2026-08-21 — Websiden ble eneste kanal: klarspråkrunde 3, Snoozeloggen ut, docx-sporet lagt ned

Hjemme-PC-en `VPC-5CG3433WMH` (AMD64). **Ingen pakkeendring** — alt skjedde i
`kunnskap/` og på artefakten. faseflyt står på 0.2.2.

### Levert

**Klarspråkrunde 3 på websiden, med divergert målgruppe som fokus.** Hele runden
gikk som nummererte forslag FØRST (13 punkter over to diskusjonsrunder), ingenting
skrevet før BKs «Alt ok — kjør»:

- Ordlisten: nye rader `fasestart` og `sikkerhetssjekk` (med ærlighetsklausul:
  stikkprøve, ikke full gjennomgang), `fase`-raden fikk hvorfor-et, `økt` peker på
  `/clear`, «rørlegging» → «teknisk grunnarbeid», «Ti ord» → «Ordene» (tallet
  råtner ikke ved neste rad).
- Steg 6 fikk halen som knytter sløyfen: faseslutt skriver → `/clear` tømmer →
  fasestart leser.
- Rammene: «Norsk tekst» og «Dette er en prototype» splittet; «Cover» → «Omslag».
- Oppgavene: **Snoozeloggen kuttet helt** (BK — «jeg»-formen var uforståelig, og å
  registrere kollegers søvn skurret mot footerens løfte om oppdiktede folk),
  resten renummerert 1–5. Donald Pocket omskrevet («litt info om hver bok»,
  «omslag», «tre personer» — «tittel» var uforståelig). «web-løsning» →
  «nettside» i alle fem. Vaffelvaktas feriespørsmål kuttet, som TODO anbefalte.
- Overskrift: «KI-samling for Digitale tjenester — 14. september 2026»
  (artefaktnavnet fulgte etter; gammel eyebrow fjernet som dublett).
  Skrivelinjene på kortene + tilhørende CSS fjernet («alle har PC»), footerens
  utdelingstekst fjernet.

### Beslutninger

- **Beslutning (BK, kanal):** kun artefakten deles — arket og `.docx`-en er
  droppet. Konsekvens utført samme økt: `oppgavelapper.md`, `build-docx.ps1` og
  begge `.docx`-ene slettet (originalunderlaget ligger i git-historikken fram til
  `cd50841`); kilden omdøpt `vaffelvakta.html` → `ki-samling-oppgaver.html`.
  Synkkøen fra 20.08 (websiden to runder foran arket) er dermed død — det som
  finnes nå er artefakten, kilden og det trackede Utstyrsskapet-sitatet i
  `TODO.md`, avstemt mekanisk med positiv kontroll.
- BK avviste først omdøpingsforslaget `ki-samling-deltakerark.html` — «ark» var
  samme metafor beslutningen nettopp hadde drept. Se læringsloggen.

### Funn (observert)

- **Artefakt-publisering fra en ny økt sperres til økten har SETT gjeldende
  versjon:** første publish ga «Read it first (WebFetch the URL)». WebFetch mot
  artefakt-URL-en returnerer hele rå-HTML-en (~20k tegn rett i konteksten —
  planlegg for det). Etter WebFetch virker publish med `url`-param, også fra
  omdøpt kildesti — samme lenke beholdt gjennom seks publiseringer.
- Den publiserte versjonen var identisk med kilden før endringene — ingen
  fremmede endringer å flette, målt før overskriving.

### Porter (kjørt ved fase-slutt 2026-08-21, etter `git add`)

- Renhetssjekk: **10 søk · 0 feil · 0 advarsler**, kontrollsøk 21 treff.
- `claude plugin validate .`: ✔ (kjørt som `~/.local/bin/claude.exe` — `claude`
  er ikke på PATH i Bash-verktøyet heller).
- Røyktest: ingen env-filer tracked, ingen 11-sifrede tall; alle
  `client_secret`-treff er instruksjonstekst (scriptet selv, logg, skill-tekst).
## 2026-08-20 — Klarspråk: en ikke-teknisk leser målte pakken, og pakken tapte

Hjemme-PC-en `VPC-5CG3433WMH` (AMD64). `main` = `095a1c1` + denne. **faseflyt
0.2.1 → 0.2.2.** Økten avsluttes midt i ordlydsgjennomgangen av websiden.

### Levert

**Synk målt, og de tre `faseflyt`-oppføringene forklart.** `installed_plugins.json`
hadde to foreldreløse project-scope-rader fra testkjøringene 17.–18.08
(`test-faseflyt` og en siden slettet scratchpad), begge pinnet til 0.1.0 /
`cfc4558`. Radene fjernet; `plugin list` viser nå én per plugin. Deklarasjonen i
`test-faseflyt/.claude/settings.json` beholdt — den er riktig, det var raden som
var foreldet. **Observert:** `claude plugin uninstall -s project` nekter med «is
installed in user scope, not project» når samme plugin finnes i user scope, så
opprydding krevde redigering av registeret (backup tatt først).

**Språkvask av samlingsmaterialet** etter tilbakemelding fra en ikke-teknisk
kollega som ikke fikk noe ut av oppgavene. Hun leste `.docx`-en — den før
strammingen. **Observert ved å pakke ut `document.xml`:** 20 av 20 søkte fagord
finnes på ÉN deltakerlapp, 22 forekomster, og blokken gjentas på alle seks
lappene. Dokumentet bruker i tillegg `scaffold`, `røyktest` og `trigge` — tre ord
som alt sto i «Ikke dette»-kolonnen i pakkens egen klarspråktabell. Kontrollsøk på
et ord som ikke finnes ga 0.

Funnet var at **bestillingene virket** — det var arket rundt dem som ikke var
lesbart. `kunnskap/lokalt/oppgavelapper.md` har nå ordliste på Ark 2, og
mock-setningen som sto sist i alle seks bestillingene er erstattet.

**faseflyt 0.2.2:** ny forklaringstabell i `nytt-prosjekt/SKILL.md` ved siden av
erstatningstabellen. Ti arbeidsflytord med setningen som skal følge dem første
gang. Begge manifestene bumpet og krysssjekket — i forrige runde ble
`marketplace.json` stående igjen.

**To artefakter til finpuss:** en privat webside (deltakerark: ordliste + Ark 2 +
Ark 3, fasilitatorarket bevisst utelatt) og en utskriftsklar `.docx` på nytt
filnavn — originalen urørt, verifisert på tidsstempel. `.docx`-en bygges **fra**
`oppgavelapper.md` av `kunnskap/lokalt/build-docx.ps1`, så teksten har én kilde.
Scriptet er rent ASCII (verifisert byte for byte) og leser norsk med
`-Encoding utf8` — nettopp fella `windows.md` advarer mot. Verifisert etter bygg:
194 æøå intakt, alle seks bestillinger med, 0 jargontreff i deltakerdelen.

**Websiden er språkvasket to runder** etter BKs funn: «Det er dere som er porten»
(hvilken port?), `økt` brukt tre ganger uten forklaring, «Målet er rytmen», og at
steg 1 ikke sa *hvordan* man kommer i planmodus. Deretter: `/clear` mangler et
**hvorfor**, og samme mangel fantes i `planmodus`, `fase 0` og `mock-data`.

### Beslutninger

- **Beslutning (BK, installasjonssikkerhet):** ingenting rettes i pakken før
  konsekvensene er gjennomgått i detalj. Kravet er at kollegaene skal kunne
  installere pluginen uten at noe overskrives. Ført som vurderingspunkt.
- **Beslutning (BK, klarspråk):** tabellen utvides, men skill-navn skal fortsatt
  kunne brukes i opplegget — de må bare forklares godt. Derfor en
  *forklaringstabell*, ikke flere erstatninger: `fase` har ikke noe synonym, og
  `/clear` er et literalt navn. BKs begrunnelse tatt inn i pakken som regel: «jeg
  har jobbet med dette i ukesvis, så ikke rart at det blir uforståelig for en som
  ikke har vært med på reisen» — den som har skrevet materialet er dårligst egnet
  til å bedømme om det er lesbart.
- **Beslutning (BK, rekkefølge):** ordlyden gjennomgås før arket og `.docx`-en
  oppdateres, slik at de tre kopiene pusses én gang framfor tre.

### Funn og overraskelser

- **Observert: byte-hashing gir falske avvik mellom cache og repo.**
  Cache-checkouten er CRLF, repoet LF. Første måling meldte 10 avvik der 9 var
  reelle — `fase-start/SKILL.md` var innholdslik hele tiden. Normaliser linjeskift.
- **Observert: en måling av «installert = repoet» dør i det du pusher.** Vi målte
  cachen ren mot `784f039`, pushet 0.2.2, og gjorde vår egen STATUS-påstand usann i
  samme økt. STATUS måtte rettes to ganger.
- **Observert: klarspråkregelen var til stede i pakken og fraværende i arbeidet.**
  Arket ble skrevet av en økt i dette repoet; repoet har ingen `CLAUDE.md`; regelen
  bor bare i `nytt-prosjekt`, som lastes ved oppsett. Sjekket samtidig at
  CLAUDE.md-malen i `maler.md` ikke har noen språkregel i det hele tatt.
- **Observert: `nytt-prosjekt` steg 6 mangler «ikke overskriv»-klausulen** som steg
  1 og steg 8 har, og malen er et komplett JSON-dokument merket ordrett. Verste
  utfall er at en kollegas `enabledPlugins` for andre plugins forsvinner.
  Ikke rettet — vurderingspunkt.
- **Målt som ikke risiko:** ingenting i pakken skriver utenfor prosjektmappa (fire
  treff på `~/.claude`, alle lesing av planmodus-fila); skills er inert tekst;
  installasjon legger bare til en versjonert mappe (observert: `0.2.1/` opprettet
  ved siden av `0.1.0/`); `CLAUDE.md` er vernet i to steg.
- **Fire målinger som ikke kunne feile, fanget underveis:** `$pid` er
  skrivebeskyttet i PowerShell, så `Get-Process` målte øktens egen prosess og svarte
  «LEVENDE» uansett input; `[char]0x72 + 'oyktest'` ble to separate søk, så
  «røyktest» ble aldri sjekket; `bash` finnes ikke på PATH fra PowerShell, så
  `$LASTEXITCODE` ga «renhetssjekk exit 0» uten at porten hadde kjørt; og en
  ordrett-sammenligning strippet `>` bare i strengens start og meldte avvik i
  identisk tekst. Alle rettet og gjentatt med kontroll.

### Sjekker

Renhetssjekk `bash .github/renhet/sjekk.sh`: **10 søk / 0 feil / 0 advarsler** på
hver av seks commits. `claude plugin validate .`: **Validation passed**.
Cachen målt mot repoet etter oppdatering: **0 avvik på alle 10 filer**, med to
kontroller (fanger ett innsatt tegn, ignorerer CRLF).

## 2026-08-19 (sen kveld) — Samlingsarket strammet, TODO ryddet for løste funn ✅

Hjemme-PC-en `VPC-5CG3433WMH` (AMD64). `main` = `fba8674` + denne. faseflyt 0.2.1
uendret — ingen endring i `plugins/`, pakken står fortsatt fryst for MVP-test.

### Levert

**Oppgavearket til septembersamlingen lest og strammet.** `.docx`-en pakket ut
(en `.docx` er en zip; `document.xml` → tekst) og vurdert. Funn i strukturen:
13 av ~22 linjer per lapp var **ordrett like på alle seks lappene** («Slik kommer
dere i gang», «Vil dere dele dere», «Rammer»). Omskrevet til tre ark i
`kunnskap/lokalt/oppgavelapper.md`: fasilitatorark, ett felles ark til alle
grupper, og seks lapper som nå bare er bestilling + to uavklarte spørsmål +
notatfelt. Bestillingene er uendret — de skal være muntlige og upresise, det er
grillingens råstoff.

**`TODO.md` ryddet: 598 → 386 linjer.** Hele «Funn fra testplanen», HYPOTESE-
seksjonen om `Read(...)`-stiformer, testdisiplin-seksjonen og
deny-differensieringen er erstattet av én tabell som peker på hvor kunnskapen
faktisk bor. Sikkerhetskopi i scratchpad (`TODO.md.bak`) for denne økten;
innholdet ligger permanent i `logg.md` (17.–18.08), i `maler.md` og i
git-historikken.

**`.gitignore`:** `kunnskap/lokalt/` lagt til.

### Beslutninger

**Beslutning (BK, arbeidsordre):** rette den foreldede TODO-seksjonen og skissere
arket i strammere form, begge i denne økten. Begrunnelse: BK avslutter dagen her
og vil videre til tørrkjøring i blank økt.

**Beslutning (BK/Claude, tørrkjøringscase): Oppgave 6, Utstyrsskapet.**
Begrunnelse: den er unionen av 1 (liste, detalj, utlån til navngitte), 3
(datoberegnet status) og 4 (markering) — går den gjennom på 3–4 faser, går resten.
Reserve ved lite tid: 1, Donald Pocket. **Ikke** 5, Vaffelvakta: rotasjon + bytte
+ ferier er der en gruppe lettest bruker opp økta på domenelogikk framfor på
arbeidsflyten.

**Beslutning (Claude, lokal mappe framfor filnavn i `.gitignore`):**
`kunnskap/lokalt/` som mappe, ikke `kunnskap/oppgavelapper.md` som filnavn.
Begrunnelse: neste arbeidsdokument skal ikke kreve en ny `.gitignore`-vurdering.

**Beslutning (Claude, bestillingen inn i tracked fil):** arket er untracket og
synker derfor ikke til kontor-PC-en. Bestillingen til case 6 står ordrett i
`TODO.md`, som ER tracked, så tørrkjøringen kan kjøres på en annen maskin uten
arket.

### Funn

**Observert — `.gitignore` dekket hensikten i kommentaren, men ikke i mønstrene.**
Kommentaren over mønstrene sier at arbeidsdokumenter i `kunnskap/` holdes lokale.
Mønstrene var `kunnskap/*.docx|xlsx|pptx|pdf` — altså bare Office-formater. Et
arbeidsdokument skrevet som `.md` ville blitt **tracket og klonet til hver kollega
som installerer pakken**. Målt: `git check-ignore -v` på den nye fila ga treff
først etter at `kunnskap/lokalt/` ble lagt inn. Samme form som grense 9 i
`maler.md` (navnebaserte mønstre kan ikke bli komplette) — pakken kjente lærdommen
på ett sted og ikke på et annet.

**Observert — `TODO.md` var foreldet på sitt alvorligste punkt.** Bulletpunktet
merket ALVORLIGST pekte på `maler.md:235-236` for døde `Bash(Invoke-*)`-regler.
Målt med `grep`: de linjene finnes ikke lenger, og `maler.md:313` sier nå
eksplisitt at cmdlet-navn ikke hører i `Bash(...)`. Videre var HYPOTESE-seksjonen
om at bar filnavn-form aldri matcher **avkreftet** av grense 5 (bar form virker i
både prosjektrot og `.claude/`), samtidig som seksjonen fortsatt beskrev en rigg
for «neste økt». Nesten hele seksjonen var løste problemer som leses som åpne
defekter.

**Observert — arket påstår tre ting pakken ikke har målt.** (1) «Si "nytt
prosjekt"» hviler på at skillen trigger av seg selv, ikke på et eksplisitt
`/faseflyt:nytt-prosjekt` — slår den ikke inn, står gruppa fast på minutt null.
(2) «`web-prototype` trigger av seg selv» for webapp-typen, som står som umålt i
STATUS. (3) Designsporets mekanikk (`list_projects` viser bare
design-system-prosjekter, wireframe-prosjekt må åpnes med `projectId`,
token-overstyring i `app.css`) — arket er kanskje eneste kilde. Ført som
fasilitatorseksjon i arket.

**Antatt, ikke målt — kontor-PC-ens tilstand.** STATUS sier «Begge ferdig satt
opp»; `TODO.md`s Maskinstatus-seksjon (17.–18.08) sier at kontor-PC-en fortsatt
har gammelt oppsett. De motsier hverandre, og det kan ikke avgjøres fra
hjemme-PC-en. STATUS er nyest og veier tyngst, men det som ville avgjort det er
`claude plugin list` + en ordlydssjekk mot repoet på den maskinen.

**Ikke ryddet:** `.docx`-en ligger fortsatt i git-historikken fram til `cd50841`.
Uendret vurdering.

### Kvalitetsport og røyktest

`bash .github/renhet/sjekk.sh`: **10 søk, 0 feil, 0 advarsler.** Dekker ikke det
nye arket — det er untracket, og alle ti søkene leser bare trackede filer. Lest
manuelt i stedet: bare de oppdiktede navnene fra bestillingene, ingen stier,
ingen secrets. `claude plugin validate .`: se under. Røyktest: ingen env-filer ut
over `.env.example`, ingen treff på fødselsnummer eller `client_secret`.

## 2026-08-19 (kveld) — Renhetsport i CI, språkvask, og en scope-korreks fra BK ✅

Hjemme-PC-en `VPC-5CG3433WMH` (AMD64). `main` = `5ba65ed` → `a33a11e` + denne.
faseflyt 0.2.1 uendret.

### Levert

**Renhetskravene ble en port** (`ed04300`). `.github/renhet/sjekk.sh` — ni søk,
kjøres av både CI og lokalt, samme kode, slik at prosaen i `docs/installasjon.md`
og porten ikke kan drifte fra hverandre. Pluss workflow, unntaksliste for
FINT-deklarasjonslogikken, og `.gitattributes` (`*.sh` = LF — `bash script.sh`
feiler på CR på Linux-runneren).

**Språkvask** (`a33a11e`). Se beslutning under. 27 steder i pakken; TODO-punktet
om at `fase-slutt` steg 4 pekte mot å hoppe over en sjekk som finnes ble rettet i
samme endring, fordi det var samme formulering som skapte problemet.

**Steg 5 styrket som instruks** (denne commiten): datauttrekk mot `.gitignore`,
filene arbeidsflyten selv lager (former og feltnavn, aldri verdier), skjermbilder
som persondata, krav om å melde *hva* som ble kjørt, og en ærlighetsklausul om at
dette er en instruks og ikke en håndhevet regel.

### Beslutninger

- **Beslutning (BK, actions-omfang):** Actions holdes til dette repoet, ikke ut i
  kollegaprosjekter. Begrunnelse: innholdet er pakkeregler (gammel forkortelse,
  FINT-innhold utenfor `fint-graphql`, stier i `plugins/`) og hensikten er å verne
  distribusjonskanalen. Et kollegaprosjekt er ikke en kanal inn til andre.
- **Beslutning (BK, kollegavernet):** styrke `fase-slutt` steg 5 som **instruks**,
  ikke som mekanisme. Alternativene som ble vurdert og lagt bort: Action ut i hvert
  prosjekt (krever GitHub + Actions + org-avklaring per repo — friksjonen dreper
  bruk), og lokal `pre-push`-hook (best passform, men hooks følger ikke med i git,
  så den svekker overtakelseshistorien).
- **Beslutning (BK, MVP):** pakken fryses og testes på et par kollegaer framfor å
  poleres videre. Begrunnelse: den har vokst forbi MVP, og «helhetsvurdering»-
  spørsmålet (hvem pakken er for, hvor mye maskineri kollegaene skal ha) besvares
  bedre av to reelle brukere enn av mer analyse.
- **Beslutning (BK, direkte til main):** pakkeendring går rett på `main` når
  hardening er av; branch + PR gjelder når den er på. Målt samme dag, se under.

### Funn

- **Observert: Actions er avslått for repoet.** `actions/permissions` →
  `{"enabled": false}`, `gh run list` tom etter to pusher. Workflow-fila er altså
  inert. **Konsekvens:** porten er bygget og scriptet er bevist, men *porten* er
  ikke i drift — den er ikke verifisert, og skal ikke føres som det.
- **Hypotese: om avslaget er org-policy eller repo-bryter er uavklart.** Begge
  org-endepunktene ga 403, og feilmeldingen navngir **to** forklaringer (ikke
  org-admin / token mangler `admin:org`). Én observasjon, to forklaringer ⇒ måler
  ingenting. Avgjøres av: en org-admin, eller et token med `admin:org`.
  Repo-rollen er målt: `admin: true`.
- **Observert: to kanoniske renhetssøk slo ut på seg selv.** `client_secret` traff
  instruksjonsteksten som *beskriver* søket (5 treff, alle legitime), og `fint`
  traff deklarasjonslogikken `docs/installasjon.md` eksplisitt unntar. Skjerpet:
  `client_secret` krever nå tilordnet verdi; `fint` deler i hardt forbud mot
  FINT-*innhold* pluss unntaksliste for bar omtale.
- **Observert: kontrollsøket kunne tilfredsstilles av sjekkens egen tekst.** Første
  utkast søkte over hele repoet og ga 8 treff på «faseflyt» i et repo som bare
  inneholdt sjekkescriptet — altså bevist at `git grep` kjørte, ikke at søkene nådde
  pakken. Avgrenset til `plugins/`, re-verifisert: exit 1 i et repo uten pakke.
- **Observert: pakken brøt sin egen klarspråk-regel.** Regelen fantes
  (`nytt-prosjekt/SKILL.md`: «si «sette opp prosjektet», ikke «scaffolde»»), men
  listet ikke `kvalitetsport`/`røyktest`/`probe` — og pakken brukte dem to linjer
  nedenfor. Jeg la selv inn to nye brudd (`positiv kontroll`, `kanarifugl`) samme
  dag, i en fil jeg redigerte mens regelen sto der.
- **Observert: setningene BK reagerte på fantes ikke i noen fil.** `git grep` etter
  «røyktesten er ren og proben bevist levende» og «ingen package.json» ga null
  treff. De ble *satt sammen* av ordene i skillene og kom ut i chatten. Det flyttet
  fiksen: å vaske filprosa alene ville ikke stoppet dem.
- **Observert: plugin-cachen er foreldet mot repoet.** `/faseflyt:fase-slutt` lastet
  0.1.0-teksten med «Kvalitetsport», «Sikkerhetsrøyktest» og
  `**Beslutning (<navn>)**` — altså ordlyden før dagens språkvask. Repoet er
  kanonisk og ble fulgt. Ikke en defekt: cachen oppdateres av
  `/plugin marketplace update`, som ikke er kjørt etter dagens commiter.
- **Kvalitetsport (steg 4, ny ordlyd):** `claude plugin validate .` exit 0 og
  renhetssjekken 9 søk / 0 feil / 0 advarsler. Merk at det gamle steget ville meldt
  «ingen kvalitetsport» her, siden repoet ikke har `package.json`.
- **Kanarifugl-testing av porten:** alle sju harde krav slo ut med exit 1, det myke
  kravet ga advarsel med exit 0. Porten er bevist å kunne feile, ikke bare å kunne
  si OK.
- **Målt på nytt (opphever påstand fra samme dag):** hardening er av — `rulesets`
  `[]`, `rules/branches/main` `[]`, `branches/main.protected` `false`.
- **Observert, ETTER at faseslutt-commiten var pushet: en 130 KB `.docx` ble
  committet uten å ha blitt lest av noe søk.** `git add -A` stagede en fil jeg ikke
  hadde sett på, og alle ni søk hoppet over den fordi `git grep -I` ignorerer
  binærfiler. Porten meldte «9 søk / 0 feil» på en fil den ikke kunne lese. Steg
  5-globben min traff `csv|xlsx|json` og aldri `.docx` — utsagnet «ingen
  uttrekksfiler tracket» var sant som skrevet, men lød bredere enn mønsteret det
  hvilte på. Samme klasse som `[tom-output-to-betydninger]`.
  - **Hvorfor det veier mer i dette repoet:** `/plugin marketplace add` er en
    `git clone`, så alt tracket havner på disken til hver kollega som installerer
    pakken.
  - **Rettet i denne commiten:** tiende søk i `sjekk.sh` som lister tracked
    binærfiler og feiler på dem (unntaksliste `binaer-unntak.txt`, tomme filer
    filtreres siden de matcher ingenting). Kanarifugl-testet begge veier: slo ut på
    `.docx`-en med exit 1, ren etter untracking. `kunnskap/*.docx|xlsx|pptx|pdf` inn
    i `.gitignore`, og kravet dokumentert i `docs/installasjon.md`.
  - **Beslutning (BK, docx-en):** fila ble lagt inn med hensikt som
    vurderingsunderlag for samlingen. Den untrackes og blir liggende lokalt; nytt
    TODO-punkt om å teste én av casene. **Historikken skrives IKKE om** — fila
    finnes i `cd50841` for de med repo-tilgang, og det er akseptert.

## 2026-08-19 — To maskiner, tre PR-er merget, `kunnskap/` inn i git ✅

**Maskiner:** kontor-PC-en `VPC-8WD9VC4` (Dell, ARM64/Snapdragon X Elite, Win 11
Ent 10.0.26200, PS 5.1, ingen `pwsh`) formiddag; hjemme-PC-en `VPC-5CG3433WMH`
ettermiddag/kveld. `main` = `578dc95`. faseflyt **0.2.1**, konsistent.

**Merget i dag:** PR #12 (ordrett maltekst, merge `057a3fc`), PR #13
(manifest-konsistens), PR #14 (`kunnskap/` inn i git + omskrevne renhetskrav).

### Levert

**PR #13 — manifestene var ikke enige.** `plugin.json` sa 0.2.1,
`marketplace.json` sto på 0.2.0. Feilmodusen er den ubehagelige sorten: ved
installasjon vinner `plugin.json`, så pakken som installeres er riktig og
ingenting feiler — det eneste symptomet er at `/plugin`-listen viser feil versjon
til kollegaer, altså at det ene tallet de har å gå etter ikke er til å stole på.
`claude plugin validate` er lagt inn som eget steg i release-rutinen; den fanger
nettopp dette med presis feilmelding.

**Kontor-PC-en er ferdig og verifisert etter restart.** `~/.claude` flyttet fra
`master` til `main` (`c12b881`), de ni gamle duplikatfilene borte fra disk,
marketplace + tre plugins installert user scope (faseflyt 0.2.1, web-prototype
0.1.0, fint-graphql 0.1.0, alle enabled). Skillene eksponeres med
`faseflyt:`-prefiks; `fase-start`/`fase-slutt` er nå skills, ikke
slash-kommandoer. **Hele installasjonsstien er dermed målt på en maskin uten noe
av oppsettet fra før, på ARM.**

**PR #14 — `kunnskap/` inn i git.** Mappa har vært gitignored siden #1. Med to
maskiner gjorde det `STATUS.md` til en fil som ikke kunne synkes, og dermed til en
mulig konkurrent til seg selv. `.claude/settings.json` inneholdt maskinlokale
`Read`-tillatelser; innholdet er flyttet til `.claude/settings.local.json` og det
navnet er gitignorert.

### Beslutninger

**Beslutning (BK, test 4):** bakoverkompatibilitetstesten droppes helt —
retter det som ble skrevet i overleveringen samme dag om at den «kan kjøres fra
kontor-PC-en». Begrunnelse: den verner prosjekter med gammel `kunnskap/`-form, og
den eneste som har slike prosjekter er den som har brukt skillen til nå. Kollegaer
har ingen gamle prosjekter, så testen kan ikke avdekke noe som rammer dem. Det er
en regresjonstest for egne filer, ikke en utrullingstest for pakken.
Verifiseringsplanens punkt 5 utgår. Kravet i CHANGELOG om at `fase-start` skal
tåle eldre struktur står ved lag — det er bare den eksplisitte testen som droppes.

**Beslutning (BK, `.claude/`-plassering):** maskinlokale tillatelser flyttes til
`settings.local.json` framfor å gitignorere hele `.claude/`. Å gitignorere mappa
ville permanent stengt repoet fra å deklarere sine egne plugins — mekanismen
pakken finnes for. Regelen «lokale tillatelser committes ikke» sto tidligere bare
i en gitignorert note, uten noe som håndhevet den, samtidig som prosedyren sier
`git add -A`.

**Beslutning (BK, hardening og review):** branch-hardening slått av for repoet;
vi opererer alene fram til 1.0. Begrunnelse: reviewen var i praksis et stempel
uten leser, og en port ingen går gjennom er ingen port. Målt etter avslaget:
`rules/branches/main` og `rulesets` gir begge `[]`, `branches/main` gir
`protected: false`. **Konsekvensen står i `plan.md` og skal tas opp igjen ved
1.0:** repoet er en instruksjonskanal inn i kollegaers Claude-økter, det har ingen
automatisk sjekk utover `claude plugin validate`, og uten hardening og uten review
finnes det nå ingen port. Naturlig erstatning er en CI-sjekk som kjører
renhetssøkene med den positive kontrollen — en port som er en måling framfor en
person virker også når review er av.

### Funn

**En ufetchet remote-ref er ingen måling av remoten.** `git status -sb` viste
`## master...origin/master` uten ahead/behind, og det ble lest som «i synk med
origin». `origin/master` var en lokal ref som ikke var hentet siden juli —
maskinen lå tre commits bak, og en hel planleggingsrunde gikk med til å forberede
en sletting som allerede var gjort (`6cda506`, gjort hjemmefra 18.08). Ført i
`laering.md`. Gjentok seg i miniatyr samme kveld: lokal `main` viste «behind 9»
mot en ref fra før forrige økt, og `e11f857` kunne først bekreftes etter `fetch`.

**Diskriminatoren for installasjonen var innholdsbasert, ikke et versjonsnummer.**
Ved øktstart lød skill-beskrivelsen «**Scaffolder** fase-arbeidsflyten…»; etter
restart «**Setter opp** …». Ordbyttet er `85a02af`, som bare finnes i 0.2.1 — så
teksten som faktisk er lastet er 0.2.1 uavhengig av hva `claude plugin list`
rapporterer. Verdt å gjenta som metode: versjonsstrengen kan lyve (jf.
manifest-avviket i PR #13), ordlyden kan ikke.

**En renhetsregel som leter etter én persons brukernavn måler én maskin.**
Regelsettet krevde `<brukernavn>` og `<kontonavn>` = 0 treff. En kollega som
committer sin egen absolutte sti passerer alle søkene, og sjekken rapporterer
«ren» — den ser ut som en personverngaranti og er hygiene for én maskin. Verre
enn ingen regel, fordi den gir falsk trygghet. `docs/installasjon.md` er delt i
pakke / `kunnskap/` / måleregel, og sti-søket er nå generisk. Privat repo er ikke
lenger forbudt ved strengmatch — det er *funksjonen* som er problemet: en
installasjonsinstruks mot et utilgjengelig repo gir en død peker, mens det å nevne
et privat repo i historikk er greit. Prototyping under egen konto før flytting til
`vestfoldfylke` er en normal arbeidsmåte, ikke et regelbrudd.

**Selvrefererende regel har en bedre løsning enn hyphenering.** Et mønster som
krever et alfanumerisk tegn etter skilletegnet
(`C:.Users.[A-Za-z0-9]|/home/[A-Za-z0-9]|/Users/[A-Za-z0-9]`) treffer verken
regelteksten eller sin egen regex-literal, og slipper å skjemme teksten. `v-t-f-k`
beholder hyphenering, siden den er nulltoleranse på hele repoet.

**Hjemme-PC-ens plugin: innholdet er 0.2.1, alle versjonsetiketter sier 0.1.0.**
Målt ved faseslutt, med samme innholdsdiskriminator som PR #13 etablerte.
`claude plugin list` sier 0.1.0 (user scope), cache-katalogen heter `0.1.0`, og
`plugin.json` i cachen sier `"version": "0.1.0"` — men
`skills/nytt-prosjekt/SKILL.md` har `description: Setter opp fase-arbeidsflyten…`,
og `Scaffolder` finnes **0 ganger** i fila. Ordbyttet er `85a02af`, som bare finnes
i 0.2.1. De to gjenværende `scaffold`-treffene er den engelske triggerfrasen PR #12
beholdt med vilje.

Dette er samme defektklasse som PR #13 rettet, speilvendt: der løy
`marketplace.json` lavt mens installasjonen var riktig; her lyver hele
etikettsettet lavt mens innholdet er riktig. **Mekanismen er ikke målt** —
sannsynligheten er at `marketplace update` friskner opp filinnholdet i en katalog
som er navngitt etter versjonen ved installasjonstidspunktet, uten å skrive om
`plugin.json`. Står som hypotese med navngitt probe: sammenlign cachens filer mot
`main` byte for byte, og se om katalognavnet endrer seg etter en ny
`marketplace update`.

**Praktisk konsekvens er motsatt av det forrige STATUS advarte om.** Den sa
«installert plugin er 0.1.0 (`cfc4558`), marketplace-klonen er aldri oppdatert —
skal noe måles mot gjeldende skill må det legges prosjekt-scopet». Målt nå er den
lastede teksten gjeldende, så det ekstraarbeidet er ikke nødvendig for
`nytt-prosjekt`. Advarselen var selv en foreldet datert observasjon — tredje
instans av `[todo-er-datert-observasjon-ikke-tilstand]` samme dag, og den som
sitter i prosjektets egne notater framfor i en instruks utenfra. Merk at målingen
dekker `nytt-prosjekt`s `description`; at *alle* skillene i cachen er gjeldende er
ikke vist.

**Uforklart, tas neste økt:** `claude plugin list` viser **tre**
`faseflyt@claude-code-skills`-oppføringer — én user scope og to project scope, alle
enabled. De to prosjekt-scopede er sannsynligvis rester fra testriggene
(`test-faseflyt`, `prosjekt-a`), men det er ikke verifisert, og duplikater var
nettopp det ryddejobben 18.08 skulle fjerne.

**Sidefunn:** `web-prototype` er identisk mellom `~/.claude`-kopien og
repo-versjonen, byte for byte etter linjeskift-normalisering — ett ledd mindre i
issue #9; det gjenstående er repo mot konsollversjonen. Claude Code-sesjonen
overlevde både full PC-omstart og VS Code-restart med konteksten intakt; det er en
annen mekanisme enn `/clear`, så faseflyt-disiplinen er fortsatt nødvendig der og
ved maskinbytte.

**Observasjon om fase-slutt-skillen selv:** steg 4 formulerer kvalitetsporten som
«bygg/typecheck/tester slik de er definert i `CLAUDE.md` eller `package.json`.
Finnes ingen: hopp over». Dette repoet har ingen `package.json`, men har siden
PR #13 en reell port i `claude plugin validate`. Ordlyden peker altså mot å hoppe
over en port som finnes. Ført i `TODO.md`.

### Kvalitetsport og røyktest

`claude plugin validate .` — **✔ Validation passed**, exit 0. (Repoet har fortsatt
ingen `package.json`; dette er porten som finnes.)

Sikkerhetsrøyktest ren: ingen `.env`-filer sporet (29 sporede filer totalt), ingen
11-sifrede tall — proben bekreftet levende med 4-siffer-kontroll som ga treff i
fire filer — og alle fire `client_secret`-treff er instruksjonstekst, inkludert
skillens egen definisjon av sjekken.

Renhetssjekk kjørt etter `git add`, med positiv kontroll i samme runde: gammel
forkortelse 0, generiske brukerstier 0 i hele repoet, `claude-global-config` 0 i
pakken og 7 treff i `kunnskap/` som forventet, `faseflyt` treff i 16 filer.

## 2026-08-18 (kveld) — O8-fiksen: ordrett maltekst, PR #12 (skrevet, review hos bruker)

**Maskin:** `VPC-5CG3433WMH`. Branch `ordrett-maltekst`, seks commits, pushet.
**PR #12 er OPEN og venter review** — ikke merget. Faseflyt-versjon 0.2.1.

**Levert (STATUS-punkt 1):** steg 5, 6 og 8 i `nytt-prosjekt` krever nå ORDRETT
kopiering, med begrunnelsen som målt faktum og obligatorisk etterkontroll.
Kodeblokk-kontrakt øverst i `maler.md`. `windows.md` har fått en kopieringsklar
STATUS-snutt med begge BOM-halvdelene (lukker O7 — det fantes tidligere ingen
ordrett blokk å kopiere, bare en instruks om å legge inn «de viktigste reglene»).

**Punkt 2 — observert, GRØNT.** Fersk scaffold i scratch-katalog,
script/automatisering på Windows med persondata = ja, kjørt av en egen økt
(skriptholder-modell) med nøytralt katalognavn og en prompt uten ordene
«ordrett», «mal» eller «måling». Diff mot malkopien økten faktisk leste:
CLAUDE.md-avsnittet 54 linjer, STATUS-snutten 18, logg-malen 20, laering-malen 18
— **alle fire ORDRETT, null avvik.** Plassholderne fylt riktig; prosjektspesifikt
innhold lagt til som egne seksjoner. Verifiseringsporten i det scaffoldede
prosjektet: 8 kolonner, 0 rader, `EF BB BF` på CSV og begge `.ps1`.
Sterkeste encoding-beviset var utilsiktet: fixturens filnavn på disk
(`tørt-løvverk.pdf`, `årsrapport-blåbær.docx`) kommer fra scriptets egne
strenglitteraler og kunne ikke vært korrekte med feil fildekoding.

**Diskriminatoren jeg forhåndsregistrerte ble moot:** med null avvik finnes det
ikke noe utfall å attribuere til instruks kontra kontekstpress. Token-tallet
trengtes ikke. (Registrert FØR utfallet var kjent, som forrige økts punkt krevde.)

**Observert — to feil i min egen sjekker, funnet før den ble brukt:** (1) malblokkens
egne `##`-overskrifter avsluttet seksjonsuttrekket for tidlig, så uttrekket ble tomt;
(2) `-like` mismatchet stille på hver mallinje med backtick — 12 av 54 linjer
rapportert manglende i en fil der de sto ordrett, `.Contains()` på samme par ga
True. Årsak: backtick er escape-tegn i wildcard-mønstre. **Hadde jeg stolt på
sjekkeren usjekket, ville fiksen sett ut som en fiasko.** Ført inn i `windows.md`
som syntaksfelle.

**Observert — riggfunn:** marketplace-klonen er aldri oppdatert (`cfc4558`), så alle
tre pluginene står som **0.1.0**, pre-PR#2 — også de `fase-start`/`fase-slutt` denne
økten selv kjørte. Loggen (dette dokumentet, forrige innslag) bekrefter at
selvbærende-testen visste dette og målte CLAUDE.md-laget alene med vilje, så ingen
tidligere konklusjon rakner. Konsekvens for i dag: den fiksede skillen måtte legges
prosjekt-scopet, ellers ville målingen truffet gammel tekst.

**Observert — språkfunn fra brukeren:** måleøkten svarte «jeg trenger tre avklaringer
før jeg scaffolder». Vokabularet var pakkens eget: `nytt-prosjekt` omtalte seg selv
som å scaffolde på fem steder, og plan-malens fase het «Fase 0 — Scaffold og
røyktest» — ordet fulgte med inn i hvert prosjekts egen `plan.md` og ble stående.
Rettet, med stående regel om norsk i brukervendt tekst.

**Lukket uten arbeid:** Mac-skjevheten i `prosjekttyper.md` var alt rettet i PR #2
(CHANGELOG 0.2.0). Verifisert ved gjennomgang av samtlige `windows`/`powershell`-treff
i `plugins/faseflyt/`: alle betinget. TODO-oppføringen var utdatert og er merket
lukket. **Jeg var på vei til å gjøre arbeidet om igjen — TODO var kilden.**

**Beslutning (BK, språkrydding):** smalt omfang nå — scaffold-familien pluss en
stående språkregel. Begrunnelse: det er den lekkasjen som sprer seg videre inn i
prosjektenes egne filer. `harness` i referansefilene og `Triggere:` som
frontmatter-etikett er pakkeinterne og venter på egen gjennomgang.

**Beslutning (BK, samlingen):** ikke nedgrader innholdet for de 30. Formen er
gruppearbeid der skrivemaskinene er forhåndsinstallert på tre plattformer (Windows
x64, Mac, Snapdragon/ARM). Begrunnelse: installasjonsrisikoen flyttes til en
pre-flight, og da er `/grill-me` og planmodus gruppens beste øvelser framfor
seremoni å kutte. Full vurdering i `TODO.md`.

**Etter faseslutt, samme kveld:** overleveringskommentar postet på PR #12 (mønsteret
`[pr-som-overlevering]` — `kunnskap/` følger ikke klonen, og i morgen er på en annen
maskin). Uten stier eller brukernavn, siden hele organisasjonen leser repoet.
Synk-repoet `~/.claude` ryddet og pushet (`6cda506`): ni filer slettet,
whitelist-linjene fjernet, README peker på pakkens README framfor å duplisere
oppskriften. **Observert underveis:** «hvitliste-endringen» TODO etterlyste fantes
ikke som ventet — `settings.json` er gitignored og kan ikke synkes, så det gjaldt
whitelist-linjene i `.gitignore`. Verifisert framfor gjettet, og alle ni slettede
filer sjekket mot en ekvivalent i pakken før commit.

**Kvalitetsport:** ingen finnes (ingen `package.json`) — eksplisitt hoppet over.
**Sikkerhetsrøyktest:** ren, med positiv kontroll i samme kjøring (se STATUS).
**Kjent begrensning:** målingen dekker ÉN prosjekttype på Windows. Webapp-,
dokumentasjons- og API-typene er umålt, Mac er urørt.

## 2026-08-18 — Selvbærende-testen (verifiseringsplanens punkt 6) ✅

**Maskin:** `VPC-5CG3433WMH`. Denne økten var **riggholder**; måleøktene kjørte i
terminal-CLI mot en scratch-katalog. Full protokoll, tolkningstabell og tolv
observasjoner i `kunnskap/selvbaerende-test.md` (lokal — `kunnskap/` er gitignored).

**Metode:** tolkningstabell med sju rader + P4 låst FØR `~/.claude/CLAUDE.md` ble
flyttet til side. Ny prosess (ikke `/clear` — regler lastes ved oppstart).
Rundtur: naken arbeidsordre → `nytt-prosjekt` → én fase → `fase-slutt` →
`/clear` → `fase-start`. Fila lagt tilbake og verifisert før tolkning ble skrevet.

- **Punkt 6 — observert: premisset holder.** G1 (faser/verifiseringsport), G2
  (`kunnskap/`-struktur) og G3 (gjenoppta fra STATUS uten å utforske) bekreftet
  uten global fil. `fase-start` utførte alle sju steg i riktig rekkefølge.
  **P4 bekreftet:** naken arbeidsordre i tom katalog ga kode uten plan — pakken
  krever eksplisitt første kall. Det er prisen, ikke en feil.
- **Umålt, står som umålt:** G4 (Explore — ingen utforskning trengtes), G5/G6
  (`/compact`, modellmiks — ikke nevnt, men ingenting kalte på dem: svakt testet,
  verken bekreftet eller avkreftet), G7 (ingen flerlinjet commit oppsto),
  persondata-grenen, grill-me-koblingen, Mac.
- **O8 — HOVEDFUNN, observert:** `nytt-prosjekt` steg 8 **parafraserer**
  CLAUDE.md-malen i stedet for å kopiere den, og parafrasen kastet bort HVER
  PR #2-retting som bor i den malen: «vent på klarsignal», hele «Porten, med en
  test du kan sjekke», «ingen av dem er en fullmakt», `<beslutningstaker>`,
  belegg-kravet. Det som overlevde var den gamle «foreslå … med én gang».
- **O13 — proben som isolerer feilen, observert:** samme skill, samme prosjekt,
  samme prompt, eneste variabel om `CLAUDE.md` er parafrase eller ordrett.
  Parafrase ⇒ rutinen kjørte uten klarsignal. Ordrett ⇒ porten holdt, med
  korrekt begrunnelse («steg 6 pusher, så den skal ha sitt eget klarsignal»).
  ⇒ **Vakt-ordlyden er tilstrekkelig. Feilen ligger i steg 8.** Belegg-kravet
  virket samtidig i samme økt — parafrasen slår ut flere sikringer på én gang.
- **O7 — samme mekanisme, uavhengig tilfelle:** `windows.md` har begge halvdeler
  av BOM-regelen med eksplisitt «må leses sammen»; STATUS fikk bare den ene.
  Scriptet ble skrevet uten BOM med æøå i kilden. **Latent, ikke manifest** —
  eneste æøå står i en kommentar (målt på disk, ikke antatt). Den stille
  feilmoden i ren form: røyktest grønn, ✅ gitt, regelen borte for neste gang.
- **O12 — riggen lekket, første O8-probe forkastet.** Urent arbeidstre (HEAD
  «Fase 0 verifisert» mot tilbakerullet `kunnskap/`) fikk måleøkten til å navngi
  «CLAUDE.md har fått en strammere rytmevakt-tekst» — variabelen under test.
  Forkastet framfor notert: porten ville hatt to forklaringer. Rigget om med
  `reset --hard` + `commit --amend` så HEAD == arbeidstre.
- **O4 — nesten-feilføring:** første `/faseflyt:nytt-prosjekt` kom ikke fram og
  økten fortsatte scriptsamtalen. Kunne vært ført som «skillen ignoreres».
  Diskriminator (kommandoen alene i egen melding) ⇒ skillen fyrte umiddelbart.
  Ikke et funn.

**Beslutning (BK, kjøremåte):** måleøkt i terminal-CLI, ikke VS Code-utvidelsen
— «ny prosess» må være sjekkbart, og utvidelsens vertsprosess kan ha fila i minnet.
**Beslutning (BK, persondata i riggen):** svart «nei» selv om en ansatt-CSV
ville gitt «ja» — deny-grensene er ferdig målt; konsekvensen er at persondata-
grenen ikke er testet uten global fil.
**Beslutning (BK, auto mode):** både auto-mode-oppsett og «Yes, and use auto
mode» avslått — portene måtte forbli observerbare, ellers blir «spurte den først?»
uforklarlig i alle senere observasjoner.

**Kvalitetsport:** ingen finnes (ingen `package.json`) — eksplisitt hoppet over.
**Sikkerhetsrøyktest:** se under. `kunnskap/` er gitignored, så dagens dokumentasjon
ligger kun lokalt på denne maskinen.

## 2026-08-18 — PR #2 merget, faseflyt 0.2.0 på main ✅

**Maskin:** `VPC-5CG3433WMH` (hjemmekontor-PC-en). Denne økten var **skriptholder**
for en egen sesjon i `C:\dev\test-faseflyt` — jeg skrev promptene, den kjørte
probene. Merge-commit `115ca15`, sju commits, `--merge` (ikke squash).

- **Probe 7 — observert:** én bar regel `Read(kanarifugl7.txt)`, to identisk
  navngitte filer. **Begge blokkert.** Ingen annen regel i blokken kan treffe
  filnavnet ⇒ ren attribusjon. **Ankringshypotesen er avkreftet.**
- **Probe 8 — observert:** ankringsmodellen fantes bare for å forklare 1a. Probe 8
  replikerte 1a under samme regelform, med kontroll i samme økt for
  konfigurasjonsstabilitet. **Begge blokkert.** 1a lot seg ikke reprodusere og er
  lukket som **ikke-reproduserbar** — versjon kontra uverifisert konfigurasjon lar
  seg ikke skille, og den gamle blokken er ikke gjenopprettbar.
  ⇒ `Read(.env)` er IKKE dødvekt. **Umålt:** dekning av vilkårlige undermapper.
- **Funn under opprydding — observert:** `rm -f <dekket fil>` **kjørte** med
  regelen aktiv og stien nevnt ordrett, mens `ls -la <dekket fil>` ble avvist i
  samme økt. Deny avhenger av hvordan kommandoen klassifiseres, ikke av at stien
  står i strengen. ⇒ `Read(...)` gir delvis konfidensialitet og **ingen
  integritetsbeskyttelse**. Grense 2 påstod det motsatte og ble rettet FØR merge.
- **Fase-slutt-porten — trial #3 holdt.** Frisk økt, dens første «verifisert, alt
  OK», reelt arbeid liggende, CLAUDE.md-laget målt alene (installert skill var
  fortsatt 0.1.0 uten port). Responsens *form* var sporbar til de nye setningene.
  *Forbehold:* prompten min påla lesing av eksperimentfila, som sa «mens
  rytmevaktene måles» — trialen er sterk, ikke hermetisk.
- **Trukket påstand:** tidligere PR-kommentar hevdet at priming var «eliminert ved
  måling». Målt nå med positiv kontroll: `laering.md` har «vakt» tre steder,
  eksperimentfila «rytmevaktene». Korreksjon publisert i tråden.
- **Strukturelt funn:** læringssløyfen skriver atferdskorrigeringer til STATUS, som
  `fase-start` kvitterer på ⇒ pakken kan ikke måle sin egen atferd i et prosjekt
  som bruker sløyfen. Issue #11.
- **Målt om repoet:** regelsettet `Hardening` er arvet fra organisasjonen,
  `enforcement: active`, **null bypass-aktører**, krever 1 godkjenning +
  `require_last_push_approval`. Planen påstod at hardening kunne slås av — rettet.
- **Kvalitetsport:** ingen finnes (ingen `package.json`). Eksplisitt hoppet over.
  Sikkerhetsrøyktest ren, med positive kontroller i samme kjøring.

**Beslutning (BK, skriptholder-modell):** målesesjonen kjøres separat, og denne
økten skriver promptene. Begrunnelse: porten kan bare måles på en økt som ikke vet
at den måles — og STATUS her nevner målingen eksplisitt.

**Beslutning (BK, hardening beholdes):** repo-unntak i org-regelsettet finnes som
mulighet, men tas ikke. Begrunnelse: repoet har ingen automatisk sjekk, så reviewen
er den eneste porten, og innholdet blir arbeidsinstrukser hos alle kollegaer.

**Beslutning (BK, merge-metode):** `--merge`, ikke squash. Begrunnelse: de sju
commitene dokumenterer målingsrekkefølgen, som er sporbarheten prosjektet bygger på.

## 2026-08-17 — Funn-PR skrevet, deny-runden avgjort i fem punkter ✅

**Maskin:** `VPC-5CG3433WMH` (AMD64, i9-13900H, Win 11 Ent 10.0.26200,
PS 5.1.26100.8875, ingen `pwsh`). Dette er hjemmekontor-PC-en — den med
plugin-oppsettet og med `C:\dev\test-faseflyt`.

- **PR #2** opprettet på branch `funn-testplan-1-3`, fem commits, **ikke merget**.
  Alle sju TODO-funn er rettet. Ikke merget fordi CHANGELOG påstår at
  fase-slutt-porten er rettet, og den påstanden mangler én uavhengig trial.
- **Fase-slutt-vakten: andre bekreftede forekomst** — den kjørte rutinen av eget
  initiativ igjen. Det avdekket at porten min bare lå i `fase-slutt/SKILL.md`, som
  kun lastes når skillen kalles; utføres rutinen fritt, leses porten aldri. Flyttet
  også til CLAUDE.md-avsnittet og gjort observerbar («finn meldingen der brukeren
  ba om det»). *Observert:* to prober mot 0.2.0-teksten, begge holdt. *Men:* første
  var konfundert (tom økt = egen grunn til å vente), andre var sesjonens *andre*
  bekreftelse og dermed ikke uavhengig. Gjenstår: én frisk økts FØRSTE bekreftelse
  med reelt arbeid liggende.
- **Deny-runden — observert** (probe 0 blokkerte i hver økt, så blokken var aktiv):
  bar `"PowerShell"` i deny fjerner hele verktøyet (ToolSearch: ingen treff med
  linja inne, treff uten — én linje endret, resten intakt);
  `PowerShell(<kommando>:*)` stoppet ingenting, så preamble gjenstår som
  forklaring; `Read(...)`-deny dekker også Write og Bash-kommandoer som *nevner*
  stien, mens `ls -la` på katalogen kjørte og eksponerte navn og størrelser
  (⇒ mekanismen er **tekstmatching**, ikke filsystemvern); deny-sjekk går foran
  eksistenssjekk; `ask`-nøkkel forkaster ikke blokken. Gjentakelser etter reload
  uendret ⇒ ingen forgiftning fra den fjernede linja ⇒ batchen står.
- **Hypotese, ikke målt:** bart filnavn i `Read(...)` ankres til `settings.json`s
  katalog. Fire målinger passer, ingen måler det direkte. Avgjøres av **probe 7**:
  én bar regel `Read(kanarifugl7.txt)`, fil med samme navn i rot og i `.claude/`.
  Rotfila lesbar + `.claude`-fila blokkert ⇒ målt. Bærer påstanden om at
  `Read(.env)` alene kan ha vært dødvekt hele tiden.
- **Overraskelse:** `data/dummy.csv` fantes fra før (19:22, samme tidsstempel som
  `.env`, begge gitignored), mens eksperimentfila påsto at katalogen aldri var
  opprettet. Gitignorerte riggfiler er usynlige både for `git status` og for en økt
  som beskriver dem uten å sjekke.
- **Beslutning (BK, hook-utsatt):** PreToolUse-hooken holdes utenfor PR #2 — den
  krever egen verifisering av hook-kontrakten og en portabel Mac/Windows-
  implementasjon, og å skrive den utestet inn i malene ville brutt nøyaktig den
  disiplinen PR-en innfører.
- **Beslutning (BK, eksperimentunntak-data):** testprosjektet får lese sine egne
  PROBE-markørfiler under `data/`, siden det ikke finnes produksjonsdata der — men
  unntaket skrives i eksperimentfila, ikke gis muntlig. En regel omgås ikke i én
  melding.
- **Beslutning (BK, kontor-pc-venter):** kontor-PC-en (Dell, ARM) hentes ikke over
  nå. Hvitliste-commiten i det private synk-repoet er fortsatt ikke gjort.
- **Kvalitetsport:** ingen — repoet har ingen `package.json`, ingen bygg/test kjørt.
  **Sikkerhetsrøyktest:** ren (ingen env-filer i git, ingen 11-sifrede tall,
  `client_secret` kun i instruksjonstekst). **Renhetssjekk:** ren.

## 2026-08-17 — Test 3 kjørt: rundturen grønn, deny-settet ikke ✅/⚠️

- **Test 3 steg 1–3 grønne**, med ett unntak: *fase-slutt-vakten FEILET* — den
  kjørte hele faseslutt-rutinen og committet (`005b07c`) i stedet for å foreslå
  den. Malen krever «foreslå». Diagnostisk kontrast: den stoppet og spurte foran
  `gh issue create`, der en eksplisitt regel finnes. Eksplisitt port respektert,
  implisitt port ikke.
- **Læringssløyfen lukket helt rundt:** `laering.md` fikk tre punkter med
  stikkordsetikett og belegg, STATUS bar dem gjennom `/clear`, og `fase-start`
  kvitterte på dem som *operasjonaliserte* forpliktelser («som del av samme
  handling, ikke en senere opprydding») — ikke gjengivelse. Den delen av planen
  virker som tenkt.
- **BEKREFTET SIKKERHETSFUNN: `Bash(...)`-matchere er verktøy-scopede.** Samme
  URL, ulikt verktøy: `curl` via Bash blokkert, `Invoke-RestMethod` via
  PowerShell kjørte til nettverksstakken (`WebException`). De to cmdlet-linjene i
  malens deny-sett beskytter ingenting på Windows — og det er den
  sikkerhetskritiske delen av malen for persondata-prosjekter.
- **`PowerShell(...)`-matchere virket heller ikke** (probe 2), men konklusjonen
  står åpen: feilmeldingen viste `At line:1 char:302`, altså at verktøyet pakker
  kommandoen i en prolog, så prefiksmønstre på cmdlet-navn ikke kan treffe.
  To forklaringer, ett utfall — diskriminator ligger i TODO.md.
- **HYPOTESE, verre hvis den holder:** `Read(kanarifugl.txt)` stoppet ikke
  Read-verktøyet på absolutt sti, med `permissions`-blokken beviselig aktiv
  (probe 0). Er bare-filnavn-formen død, er `Read(.env)` i malen også dødvekt, og
  `.env` så beskyttet ut i økt 2 kun via mulig innebygd særstatus. Tre
  kandidatforklaringer, rigget for neste økt.
- **Metodefunn som forhindret en feilkonklusjon:** kravet om *ordrett* gjengivelse
  av feilmeldinger var det eneste som avslørte `char:302`. En parafrase ville sendt
  «`PowerShell(...)` er ugyldig form» i loggen som funn.
- **Beslutning (BK):** deny-settet legges inn bredt i testprosjektet framfor å
  avvente behovsavklaring. Begrunnelse: asymmetrisk feilmodus — for bredt deny gir
  en synlig blokkering som fjernes på sekunder, for smalt gir en usynlig lekkasje.
  Forbeholdet gjelder likevel malen: localhost-røyktesting er et reelt behov for
  webapp/API-typene, så deny-settet må differensieres per prosjekttype.
- **Beslutning (BK):** prioriteringen flyttes — funn-PR-en skrives FØR test 4–5
  og kollegatesting. Begrunnelse: ett bekreftet sikkerhetshull i det malen lover
  persondata-prosjekter, og et prosjekt scaffoldet i mellomtiden får et halvt vern.
- **Kvalitetsport:** ingen definert i repoet (ingen `package.json`/byggefil) —
  hoppet over bevisst, ikke stille. **Sikkerhetsrøyktest:** ren (ingen env-filer
  tracked, ingen 11-sifrede tall, `client_secret` kun i skillens egen
  instruksjonstekst). **Renhetssjekk:** gammel fylkesforkortelse 0, personnavn 0,
  `fint` utenfor fint-graphql kun deklarasjonslogikk (6 treff, alle legitime).
- **Ingen commit denne økten:** alt endret ligger i gitignored `kunnskap/`.
  Sju funn finnes dermed på én maskin og i ingen historikk — funn-PR-en er det
  eneste som gjør dem varige.

## 2026-08-17 — Test 1–2 grønne (kjørt på hjemmekontor-PC-en) ✅

- **Test 1 (installasjon): grønn.** `marketplace add` + `install faseflyt` OK
  (user scope), `/faseflyt:` autofullfører til alle fire skills — både i
  terminal-CLI og i VS Code-utvidelsens chat — og `/plugin`-panelet viser
  pluginen enabled.
- **Funn:** `/plugin` finnes IKKE i VS Code-utvidelsens chat («isn't available
  in this environment») — installasjon MÅ skje i terminal-CLI-en. Rammer
  kollegaer som kun bruker utvidelsen; README må dekke det. `claude.exe` er
  ikke på PATH — kjørt via utvidelsens native-binary-sti (v2.1.233).
- **Ryddesteget utført:** de fire gamle skill-mappene + to command-filene i
  `~/.claude` slettet; `web-prototype` og `fint-graphql` installert som plugins
  (user scope). Alle tre plugins enabled, ingen `· user`-rester i panelet.
  Hvitliste-commit i `claude-global-config` gjenstår; kontor-PC-en har fortsatt
  gammelt oppsett (se TODO.md).
- **Test 2 (tørrkjøring nytt-prosjekt, script-type + persondata, uten FINT):
  grønn.** Spørsmålene kom FØR opprettelse; hele disk-tabellen innfridd
  (STATUS med relativ planpeker + Arbeidsmåte-seksjon + Windows-regler; smal
  4-punkts sikkerhetssjekkliste; TODO.md; settings.json med kun faseflyt +
  deny-regler; skills/README med deklarert-ikke-kopiert; CLAUDE.md med tre
  rytmevakter + kunnskapsfangst). Bonus: logg fikk datert innslag med
  `**Beslutning (persondata):**` + begrunnelse, .gitignore med `!.env.example`.
- **Vurdering tatt (PreToolUse-hook):** innspill om at deny-regler ikke stopper
  fillesing via shell — reell men delvis utdatert bekymring; hook-forslag som
  sirkulerte var teknisk feil (stdin-JSON/exit 2, ikke argv/exit 1). Ført på
  TODO.md som egen fase etter grønne tester; må virke på både Mac og Windows.
- **Mac-premiss registrert:** de fleste utviklerne er på Mac. Funn:
  prosjekttyper.md gjør Windows-regler ubetinget for script-typen — rettes i
  første funn-PR. Kollegatest-protokollen krever nå minst én Mac-tester.
- Ingen commit denne økten: alt endret ligger i gitignored `kunnskap/`
  (pakkefunnene rettes samlet via branch + PR når test 3 er kjørt).

## 2026-08-10 — Pause før verifisering

- Testprotokoller klargjort: `testplan.md` (BKs 5 tester) og `kollegatest.md`
  (full kollegatesting, 2 profiler med ulikt teknisk grunnlag). Ingen av dem
  er kjørt ennå — det går litt tid før BK rekker det.
- **Funn:** push til main ble avvist (GH013) — org-reglene i vestfoldfylke
  krever PR. **Beslutning (BK):** reglene beholdes bevisst; PR-porten er en
  ønsket forsvarslinje siden repoet er en instruksjonskanal inn i kollegaers
  Claude-økter. All endring går via branch + `gh pr create`.
- PR #1 (gitignore av `kunnskap/`) opprettet, venter på merge. `kunnskap/` er
  lokalt ignorert via `.git/info/exclude` i mellomtiden.

## 2026-08-08 — Pakken bygget, validert og publisert ✅

- Plan godkjent (kopiert til `kunnskap/plan.md`) etter grilling gjennom flere
  runder: distribusjon i to kanaler (plugin-marketplace + org-katalog, kanalvalg
  per skill), læringssløyfe som overlever /clear, rytmevakter i CLAUDE.md-mal,
  prosjekttyper, deklarerte-ikke-kopierte skills.
- Bygget alle tre plugins: `faseflyt` (nytt-prosjekt + 5 references, fase-start,
  fase-slutt, grill-me), `web-prototype` (kopiert uendret — repoet er master nå),
  `fint-graphql` (renset: «dette prosjektet»-formuleringer, fakturaregel for
  sperret adresse generalisert, persondata-advarsel lagt til).
- **Funn:** `claude plugin validate` avviser `owner` som streng i
  marketplace.json — må være objekt `{"name": ...}`. Rettet; alle fire
  manifester validerer.
- Renhetssjekk bestått (gammel fylkesforkortelse: 0 treff; personnavn: 0;
  fnr-mønster: 0; `fint-samtykke`: 0; `fint` kun i fint-graphql +
  deklarasjonslogikk).
- Repo opprettet: `vestfoldfylke/claude-code-skills`, PRIVATE, main, eier
  verifisert med `gh repo view`.
