# Windows- og PowerShell-feller

Gjelder ALLE prosjekter som utvikles på Windows. De viktigste reglene legges inn
i `kunnskap/STATUS.md` under «Det en ny økt må vite» FØR første filskript
skrives — ikke etter første mojibake-hendelse.

## Encoding-fella (den som alltid biter)

Windows PowerShell 5.1 leser og skriver ANSI som standard, ikke UTF-8:

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
