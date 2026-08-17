# Windows- og PowerShell-feller

Gjelder ALLE prosjekter som utvikles på Windows. De viktigste reglene legges inn
i `kunnskap/STATUS.md` under «Det en ny økt må vite» FØR første filskript
skrives — ikke etter første mojibake-hendelse.

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

- **Flerlinjede commit-meldinger:** here-strings avvises av enkelte
  harness-oppsett — skriv meldingen til en fil og bruk `git commit -F <fil>`.
- `git grep`/`git ls-files` fungerer likt som på Unix og er trygge i
  sikkerhetsrøyktesten.

## PowerShell 5.1-syntaksfeller (for genererte kommandoer)

- `&&` og `||` finnes ikke — bruk `A; if ($?) { B }`.
- Ternary (`?:`), null-coalescing (`??`) og `?.` finnes ikke — bruk `if/else`.
- Unix-kommandoer som `head`, `tail`, `touch`, `which`, `wc` finnes ikke —
  bruk `Select-Object -First/-Last`, `New-Item`, `Get-Command`, `Measure-Object`.
- Stier med mellomrom: kall exe-er med `& "C:\Program Files\..."`.
