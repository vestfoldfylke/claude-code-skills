# Testplan — verifisering av pakken (kjøres av BK)

Fem tester i stigende rekkefølge. Noter konkret hva som skjer ved avvik — avvik
i test 3–5 er ikke nødvendigvis feil i pakken, men kan bety at skill-formuleringer
må skjerpes.

## Test 1 — Installasjon (~5 min)

I en hvilken som helst Claude Code-økt:

```
/plugin marketplace add vestfoldfylke/claude-code-skills
/plugin install faseflyt@claude-code-skills
```

**Verifiser:**
- [ ] Begge kommandoene melder suksess
- [ ] `/faseflyt:` autofullfører til `nytt-prosjekt`, `fase-start`, `fase-slutt`, `grill-me`
- [ ] `/plugin`-panelet viser `faseflyt` som installert og aktiv

## Mellom test 1 og 2 — rydd de private kopiene (~10 min)

De gamle kopiene i `~/.claude` VIL forurense test 2–3 (Claude kan trigge på
gammel skill i stedet for plugin). Ryddes så snart test 1 er grønn — alt er
gjenopprettbart fra git-historikken i `claude-global-config`:

- [ ] Slett `~/.claude/skills/{nytt-prosjekt,grill-me,fint-graphql,web-prototype}/`
- [ ] Slett `~/.claude/commands/fase-start.md` og `fase-slutt.md`
- [ ] Installer erstatningene: `/plugin install web-prototype@claude-code-skills`
      og `/plugin install fint-graphql@claude-code-skills`
- [ ] Oppdater hvitlisten i `~/.claude/.gitignore`, commit + push
      (jobb-PC blir ren ved neste pull der)
- [ ] Global `~/.claude/CLAUDE.md`: flytt til side under test 2–3
      (selvbærende-testen); etterpå kan faseflyt-avsnittet utgå permanent —
      behold gjerne git-/commit-F-regelen

## Test 2 — Tørrkjøring av nytt-prosjekt (~15 min)

Tom mappe (f.eks. `C:\dev\test-faseflyt`), åpne i Claude Code, kjør
`/faseflyt:nytt-prosjekt`. Velg **script/automatisering**.

**I chatten:** spørsmål om nytt/eksisterende, prosjekttype, persondata og FINT
skal komme FØR noe opprettes.

**På disk etterpå:**

| Fil | Forventning |
|---|---|
| `kunnskap/STATUS.md` | `**Plan:** kunnskap/plan.md`, `## Arbeidsmåte neste økt`, Windows-encoding-regel under «Det en ny økt må vite» |
| `kunnskap/logg.md`, `laering.md`, `sikkerhet.md` | Finnes; sikkerhet.md har den SMALE script-sjekklisten (4 punkter) |
| `TODO.md` | Finnes i rot, også tom |
| `.claude/settings.json` | `extraKnownMarketplaces` → `vestfoldfylke/claude-code-skills`, `faseflyt@claude-code-skills: true` — IKKE web-prototype |
| `.claude/skills/README.md` | Forklarer deklarert-ikke-kopiert-regelen |
| `CLAUDE.md` | Tre rytmevakter + kunnskapsfangst-avsnitt |

- [ ] Alt over stemmer
- [ ] Valgfritt: gjenta med dokumentasjonstypen — `arkitektur.md` skal IKKE opprettes

## Test 3 — Rundtur med læringssløyfe og rytmevakter (~20 min) — VIKTIGST

I test-prosjektet fra Test 2:

Kjørt 2026-08-17 i `C:\dev\test-faseflyt`. Steg 1–3 gjennomført.

1. Be Claude lage noe lite (script på 20 linjer). Når det virker, skriv
   **«verifisert, alt OK»**.
   - [x] ~~*Fase-slutt-vakten:* Claude foreslår `/faseflyt:fase-slutt` selv~~
     **FEILET** — den *kjørte* hele faseslutt-rutinen og committet (`005b07c`)
     uten å spørre. Malen krever «foreslå». Funn ført i TODO.md.
2. Kjør `/faseflyt:fase-slutt`.
   - [x] Nytt datert innslag øverst i `logg.md` — riktig rekkefølge, beslutninger
     med begrunnelse OG konsekvens
   - [x] Nytt innslag i `laering.md` med stikkordsetikett i klammer —
     `[ps1-bom]`, `[egen-status-regel]`, `[kjør-og-se]`, alle med belegg
   - [x] `STATUS.md` overskrevet, har `## Arbeidsmåte neste økt`
   - [x] Git-commit laget (`005b07c`)
   - Bimerknad: beslutninger merket med tema, ikke beslutningstaker — eget funn
     i TODO.md (`<navn>`-plassholderen).
3. `/clear`, deretter `/faseflyt:fase-start`.
   - [x] Oppsummerer fase/tilstand — skilte riktig mellom «plan ikke skrevet
     ennå» og «brukket peker»
   - [x] KVITTERER på arbeidsmåte-punktene som forpliktelser («Denne økten: …»)
     — alle tre, og operasjonalisert (ikke gjengivelse)
   - [x] Foreslår ETT neste steg og VENTER på klarsignal
4. *Plan-vakten:* be om noe vesentlig nytt («bygg en webserver med API»).
   - [ ] Claude foreslår planmodus i stedet for å kode
   - NB: økten har alt foreslått grilling + planmodus av eget initiativ, så
     vakten er «primet». Test den som en rå arbeidsordre uten å nevne plan.
5. *Scope-vakten:* start noe smått, skyt inn «kan du også legge til X?».
   - [ ] Claude foreslår TODO.md
6. *Deny-sjekken* (fra STATUS, ble hoppet over da faseslutt kjørte for tidlig):
   - [x] **Biter `Bash(...)`-deny når kommandoen går via PowerShell? NEI.**
     Kontrollkall samme URL: `curl` via Bash blokkert, `Invoke-RestMethod` via
     PowerShell kjørte. Matcherne er verktøy-scopede. Ført som alvorligste funn
     i TODO.md.
   - [ ] Åpent: matcher relativt mønster (`Read(.env)`) en absolutt sti?
     Kanarifugl-forsøket ble tvetydig — `settings.json` leses ved øktstart, og
     regelen var ikke lastet. Lukkes med `.env.kanari`, som treffer det
     allerede lastede `Read(.env.*)`, lest via ABSOLUTT sti.
   - Merk: fil-probene mot `.env` selv er ubrukelige — modellen håndhever
     CLAUDE.md-regelen av eget skjønn og forsøker ikke kallet. Bruk alltid en
     regel uten tilsvarende CLAUDE.md-regel.

## Test 4 — Bakoverkompatibilitet (~10 min)

1. Åpne `C:\dev\ElevPC-fakturagrunnlag`, kjør `/faseflyt:fase-start`.
   - [ ] Starter normalt, kræsjer ikke på manglende `laering.md`
   - [ ] Tilbyr (én gang) å oppgradere — uten å gjøre det selv
2. Åpne `C:\dev\fint-samtykke`, kjør `/faseflyt:fase-start`.
   - [ ] Oppdager at planpekeren peker på slettet fil, sier det tydelig
   - [ ] Tilbyr å rekonstruere `kunnskap/plan.md` fra STATUS/logg

## Test 5 — Overtakelse (~10 min)

Kopier test-prosjektet fra Test 2 til ny mappe, åpne i Claude Code, godta
trust-prompten.
- [ ] Claude Code tilbyr å installere marketplace/plugins fra `.claude/settings.json`
  (dokumentert oppførsel — skjer det ikke, er det et viktig funn)

## Til slutt (når 2–3 er grønne)

- [ ] Selvbærende-test: flytt `~/.claude/CLAUDE.md` midlertidig til side, gjenta
  test 2–3, legg fila tilbake — flyten skal virke uten den

## Gjenstår etter testene (fra planen)

Ingenting. Avgjort 2026-09-05 (BK): kollegatest, org-opplasting og
konsollsjekken av web-prototype er droppet — pakken distribueres bare som
plugin. Branch-beskyttelse ble slått av 2026-08-21. Skill-kopien i
`fint-samtykke/.claude/skills/nytt-prosjekt/` er fjernet som skill samme dag
(`SKILL.md` og oppskriften slettet; prosjektets egen retrospektiv ligger igjen
til BK flytter den). Kollegaene møter pakken via gruppeleder-prepen før
samlingen 14. september.
