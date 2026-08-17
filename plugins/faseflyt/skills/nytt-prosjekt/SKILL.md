---
name: nytt-prosjekt
description: >-
  Setter opp fase-arbeidsflyten for et prosjekt: kunnskap/-struktur, plan- og
  statusmaler, læringssløyfe og prosjektregler. Brukes når et nytt prosjekt skal
  startes, eller når et eksisterende prosjekt skal over på faseinndelt arbeidsflyt.
  Triggere: «nytt prosjekt», «start et prosjekt», «sett opp faseflyt», «new
  project», «set up phased workflow», «scaffold project workflow».
---

# Nytt prosjekt — fase-arbeidsflyt

Denne skillen setter opp arbeidsflyten der prosjekter kjøres i **faser med
verifiseringsport**: planen skrives først (i planmodus) og lagres i prosjektet,
hver fase implementeres i én økt, **brukeren verifiserer** før neste fase, og
`/faseflyt:fase-slutt` + `/clear` avslutter økten. Ny økt starter med
`/faseflyt:fase-start`, som leser `kunnskap/STATUS.md` i stedet for å utforske
kodebasen på nytt. Utforskning underveis delegeres til Explore-subagenter — bare
konklusjonen inn i hovedtråden. Tyngste modell brukes til plan/arkitektur/
sikkerhetskritiske valg; lettere modell holder til mekanisk implementering.

## Når du blir kalt — gjør i rekkefølge

1. **Nytt eller eksisterende prosjekt?** I et eksisterende prosjekt: opprett kun
   det som mangler, hopp over `git init` når repo finnes, og UTVID eksisterende
   `CLAUDE.md` — overskriv aldri noe.

2. **Avklar prosjekttype** (styrer alt videre — se `references/prosjekttyper.md`):
   webapp/prototype, script/automatisering, dokumentasjon/utredning, eller
   API/backend-tjeneste. Spør samtidig: behandler prosjektet **persondata**
   (styrer deny-regler i steg 6)? Bruker det **FINT** (styrer skill-deklarasjon)?
   Og prosjektnavn/domene.

3. **Tilby `/faseflyt:grill-me` før planen.** Grillingen låser beslutningene som
   ellers dukker opp midt i implementeringen. Beslutningene skrives inn i planens
   `## Avklarte beslutninger` med `**Beslutning (<beslutningstaker>, <tema>):**`
   + begrunnelse — `<beslutningstaker>` er personen som bestemte, ikke temaet.

4. **Planen skrives i planmodus og kopieres til `kunnskap/plan.md`.** Planmodus
   lagrer sin fil under `~/.claude/plans/` med autogenerert navn — den kopien er
   en engangsartikkel. **Ved godkjenning kopieres innholdet til
   `kunnskap/plan.md`, som fra da av er kanonisk** og det STATUS peker på.
   Endres planen senere, endres `kunnskap/plan.md`. Planstruktur og
   fasedimensjonering: se plan-malen i `references/maler.md` — én fase = én
   enhet brukeren kan verifisere, som får plass i én økt uten `/compact`;
   fase 0 er alltid scaffold + røyktest; 3–10 faser er normalområdet.

5. **Opprett filene** fra malene i `references/maler.md`:
   `kunnskap/STATUS.md`, `kunnskap/logg.md`, `kunnskap/laering.md` og
   `kunnskap/sikkerhet.md` for alle typer; `kunnskap/arkitektur.md` kun for
   kode-typene. `TODO.md` i rotkatalogen fra dag 1 — også tom.
   På Windows: legg encoding-reglene fra `references/windows.md` inn i STATUS
   FØR første filskript skrives.

6. **Skriv `.claude/settings.json` og `.claude/skills/README.md`** fra malene:
   marketplace-deklarasjonen gjør at den som kloner prosjektet får
   arbeidsflyt-skillene automatisk (regelen er: org-skills deklareres, aldri
   kopieres; kun prosjektets egen domenekunnskap bor i `.claude/skills/`).
   Deklarer `web-prototype` kun for webapp-typen og `fint-graphql` kun når
   prosjektet bruker FINT. Behandler prosjektet persondata: tilby deny-settet
   for prosjekttypen (se maler.md) — men **skriv aldri en `permissions`-blokk uten
   å levere integritetsproben i samme endring** (`Bash(curl:*)` mot
   `http://127.0.0.1:9/`): en uverifisert nøkkel kan gjøre hele blokken stille
   inaktiv, og et ubekreftet vern er verre enn ingen. Vær ærlig om grensene i
   samme åndedrag: matcherne er verktøy-scopet (på Windows dekkes ikke
   PowerShell-verktøyet), navnebaserte mønstre kan ikke bli komplette, og settet
   er risikoreduksjon — ikke sandkasse. Hovedvernet er regelen i CLAUDE.md
   («Claude forbereder kommandoen, brukeren kjører den og limer inn resultatet»);
   deny-settet støtter den, og de to hører alltid sammen.

7. **Tilby privat git-repo** (med mindre repo finnes): `git init -b main` +
   `.gitignore` (node_modules, `.env` unntatt `.env.example`, build-artefakter)
   + første commit + `gh repo create <navn> --private --source . --push`.
   Commit-og-push hører deretter til hvert `/faseflyt:fase-slutt`.

8. **Tilby CLAUDE.md-avsnittet** fra maler.md — det inneholder kunnskapsfangst-
   regelen, de tre rytmevaktene (plan-vakt, fase-slutt-vakt, scope-vakt) og
   regelen om deklarerte vs. prosjekteide skills. Finnes CLAUDE.md fra før:
   legg avsnittet til, ikke overskriv.

9. **Forklar fase-rytmen kort**, slik at den er avtalt fra dag 1:
   `/faseflyt:fase-start` som første handling i hver økt → implementer fasen →
   brukeren verifiserer → `/faseflyt:fase-slutt` → `/clear`. `/compact` brukes
   kun midt i en fase som ikke rekker å fullføres.

## Referanser — les ved behov

- `references/maler.md` — alle filmalene (STATUS, logg, læring, arkitektur,
  sikkerhet, TODO, plan, CLAUDE.md-avsnitt, settings.json, skills-README).
- `references/prosjekttyper.md` — hva hver prosjekttype får og slipper.
- `references/windows.md` — encoding- og PowerShell-feller (alle Windows-prosjekter).
- `references/claude-design-oppskrift.md` — eget visuelt tema → Designsystemet-tokens
  (kun webapp-typen).
- `references/fallgruver.md` — fallgruver og mønstre som beviselig virker, fra
  prosjektene som formet denne arbeidsflyten.
