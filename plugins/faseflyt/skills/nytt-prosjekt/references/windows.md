# Windows- og PowerShell-feller

Gjelder ALLE prosjekter som utvikles på Windows. Snutten under legges inn i
prosjektets `CLAUDE.md`, rett etter hele CLAUDE.md-blokken fra `maler.md` og
under overskriften snutten selv har, FØR første filskript skrives — ikke etter
første mojibake-hendelse, og ikke i STATUS:
STATUS overskrives ved hver faseslutt, og snutten forsvant slik 2026-09-04
(flyttet hit i 0.6.1). Prosjekter på Mac eller Linux får kortformen i seksjonen
«Utenfor Windows». Resten av fila er referanse for den som setter opp
prosjektet, og kopieres ikke.

## CLAUDE.md-snutt — kopieres ORDRETT og i sin helhet

Begge kulepunktene i encoding-regelen må følge med. Den ene lest alene leses som
en motsigelse av den andre, og et script som mangler den andre halvdelen mojibaker
ved første kjøring:

```markdown
## Windows og PowerShell

- **Encoding på Windows PowerShell 5.1 — to halvdeler som hører sammen:** BOM er
  uønsket i filer scriptet PRODUSERER, og påkrevd i `.ps1`-KILDEKODE som
  inneholder æøå.
  - *Output:* alle `Get-Content`/`Set-Content`/`Add-Content` skal ha eksplisitt
    `-Encoding utf8`. Uten den leses/skrives ANSI og æøå mojibakes stille
    (`æ` → `Ã¦`). `Out-File` og `>`/`>>` skriver ofte UTF-8 MED BOM, som knekker
    shebang-linjer og JSON-parsere — sjekk output-filer for BOM når andre verktøy
    skal lese dem.
  - *Kildekode:* 5.1 tolker en `.ps1` UTEN BOM som ANSI, så strenglitteraler med
    æøå mojibakes i utskriften selv om fila er korrekt UTF-8 på disk.
    Write-verktøyet lagrer uten BOM, så HVERT nytt script med norske tegn må
    lagres på nytt med `Set-Content -Encoding utf8` (skriver BOM i 5.1).
    Symptomet som identifiserer feilen: et kommandolinje-argument kommer ut
    riktig i samme kjøring der litteraler i fila er korrupte ⇒ det er
    fildekodingen, ikke konsollet.
- **Flerlinjede commit-meldinger:** skriv meldingen til fil og bruk
  `git commit -F <fil>` — here-strings avvises i enkelte oppsett av Claude Code.
- **PowerShell 5.1 mangler `&&`/`||` (bruk `A; if ($?) { B }`), ternary/`??`/`?.`,
  og Unix-kommandoene `head`/`tail`/`touch`/`which`/`wc`.**
```

## Utenfor Windows — to linjer, ORDRETT

Et Mac- eller Linux-prosjekt klones av en Windows-kollega, og fellene over slår
inn hos dem. Snutten over skrives ikke; disse to linjene skrives i stedet, på
samme sted i `CLAUDE.md` og under samme overskrift:

```markdown
## Windows og PowerShell

- **Jobber du på Windows:** bruk Read/Write/Edit for filinnhold, ikke PowerShell.
  Må du bruke PowerShell 5.1, legg `-Encoding utf8` på `Get-Content`/`Set-Content`.
```

## Encoding-fella (den som alltid biter)

Windows PowerShell 5.1 leser og skriver ANSI som standard, ikke UTF-8. Det gir to
regler som ser ut som motsetninger og derfor må leses sammen: **BOM er uønsket i
filer scriptet produserer, og påkrevd i `.ps1`-kildekode som inneholder æøå.**

### Filer scriptet leser og skriver — BOM uønsket

- `Get-Content <fil>` uten `-Encoding utf8` leser UTF-8-filer som ANSI og
  **mojibaker æøå** (`æ` → `Ã¦`). Skjer stille — feilen oppdages først når
  innholdet er skrevet et annet sted.
- `Set-Content`/`Add-Content` uten `-Encoding utf8` skriver ANSI — filer andre
  verktøy (node, git, VS Code) leser som UTF-8 blir korrupte.
- `Out-File` og `>`/`>>` skriver ofte UTF-8 **med BOM** — BOM-en knekker
  shebang-linjer, JSON-parsere og enkelte linters.

**Regel:** alle `Get-Content`/`Set-Content`/`Add-Content` i prosjektet har
eksplisitt `-Encoding utf8`. Sjekk output-filer for BOM når andre verktøy skal
lese dem.

### `.ps1`-kildekoden selv — BOM påkrevd når fila inneholder æøå

Windows PowerShell 5.1 tolker en `.ps1`-fil **uten** BOM som ANSI. Strenglitteraler
med æøå mojibakes da i utskriften, selv om fila er korrekt UTF-8 på disk:

```
Write-Output "blåbær på tørt løvverk"   →   blÃ¥bÃ¦r pÃ¥ tÃ¸rt lÃ¸vverk
```

- **Treffer hvert script Claude skriver:** Write-verktøyet lagrer UTF-8 **uten**
  BOM, så ethvert nytt `.ps1` med norske tegn må lagres på nytt for å virke.
- **Fiks:** `Set-Content -Path <fil> -Value $innhold -Encoding utf8` — i 5.1
  skriver den UTF-8 med BOM (`EF BB BF`), som er nettopp det kildekoden trenger.
- **Symptomet som identifiserer feilen:** et argument gitt på kommandolinjen
  kommer ut riktig i samme kjøring der litteraler i fila er korrupte. Da er det
  *fildekodingen* som er problemet — ikke konsollet, ikke kodesiden.
- **Gjelder Windows PowerShell 5.1** (der dette er målt). PowerShell 7+ skal
  etter dokumentasjonen dekode `.ps1` som UTF-8 uten BOM og ikke trenge det, men
  det er ikke etterprøvd her — bruk symptomtesten over framfor å anta.
  `$PSVersionTable.PSVersion` sier hvilken du kjører.

## Git på Windows

- **Flerlinjede commit-meldinger:** here-strings avvises i enkelte oppsett av
  Claude Code — skriv meldingen til en fil og bruk `git commit -F <fil>`.
- `git grep`/`git ls-files` fungerer likt som på Unix og er trygge å bruke i den
  raske sikkerhetssjekken.

## PowerShell 5.1-syntaksfeller (for genererte kommandoer)

- `&&` og `||` finnes ikke — bruk `A; if ($?) { B }`.
- Ternary (`?:`), null-coalescing (`??`) og `?.` finnes ikke — bruk `if/else`.
- Unix-kommandoer som `head`, `tail`, `touch`, `which`, `wc` finnes ikke —
  bruk `Select-Object -First/-Last`, `New-Item`, `Get-Command`, `Measure-Object`.
- Stier med mellomrom: kall exe-er med `& "C:\Program Files\..."`.
- **`-like` er ikke literal — bruk `.Contains()` når du sammenligner tekst.** I et
  wildcard-mønster er backtick escape-tegn og `*?[]` er metategn, så hver linje
  med `kodeformat` i backticks mismatcher **stille**: `$tekst -like "*$linje*"`
  gir `False` selv når linja står der ordrett (målt — den siste backticken spiste
  tegnet etter seg). Feilmoden er farlig fordi den ser ut som «fant ikke», ikke
  som «mønsteret var feil». `$tekst.Contains($linje)` er literal og ordinal.
