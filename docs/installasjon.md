# Installasjon og vedlikehold — for administrator

Vanlig installasjon for kollegaer står i [README.md](../README.md). Denne siden
dekker det administrative.

## Kanalene

| Kanal | Når | Hva |
|---|---|---|
| Plugin (dette repoet) | Claude Code (CLI/VS Code) | Alle tre plugins |
| Org-katalogen på claude.ai | claude.ai / Desktop-chat | Kun `grill-me`, `fint-graphql`, `web-prototype` |

Faseflyt-trioen (`nytt-prosjekt`/`fase-start`/`fase-slutt`) skal **ikke** i
org-katalogen — den krever filsystem, git og planmodus, som chat-flatene ikke
har. En kollega som møter dem der først, opplever en pakke som ikke virker.

## Org-katalogen (claude.ai admin-konsollet)

Last opp hver skill-mappe for seg (mappen som inneholder `SKILL.md`):

- `plugins/faseflyt/skills/grill-me/`
- `plugins/fint-graphql/skills/fint-graphql/`
- `plugins/web-prototype/skills/web-prototype/` — **dette repoet er master**
  for web-prototype: konsollversjonen oppdateres FRA repoet ved endringer,
  aldri motsatt.

## Sentral utrulling via managed settings (valgfritt)

Som org-admin kan du gi alle kollegaer marketplacet uten at de kjører noen
kommando, via managed settings:

```json
{
  "extraKnownMarketplaces": {
    "claude-code-skills": {
      "source": {
        "source": "github",
        "repo": "vestfoldfylke/claude-code-skills"
      }
    }
  },
  "enabledPlugins": {
    "faseflyt@claude-code-skills": true
  }
}
```

`web-prototype` og `fint-graphql` bør IKKE aktiveres sentralt — de er
behovsstyrte og deklareres per prosjekt av `nytt-prosjekt`.

**Sikkerhetsmerknad:** med sentral utrulling (særlig `autoUpdate`) blir alt som
pushes til `main` i praksis arbeidsinstrukser i alle kollegaers Claude-økter.
Skrivetilgang til repoet skal derfor være begrenset til de som vedlikeholder
pakken, og endringer fra andre skal inn via PR.

## Per-prosjekt-deklarasjon (det `nytt-prosjekt` skriver)

Prosjekter scaffoldet med `nytt-prosjekt` får en `.claude/settings.json` som
deklarerer marketplacet og pluginene prosjektet trenger. Når en kollega kloner
prosjektet og godtar workspace-trust-dialogen, tilbyr Claude Code å installere
dem (dokumentert oppførsel: prompten kommer etter trust-aksept). Krever
GitHub-tilgang til dette repoet.

## Oppdatere pakken

1. Gjør endringen på en branch, PR til `main`.
2. Bump `version` i berørt `plugins/*/.claude-plugin/plugin.json` og
   `marketplace.json` (semver — brytende endringer i `kunnskap/`-strukturen
   markeres i CHANGELOG med migreringsnotat).
3. Én linje i `CHANGELOG.md`.
4. Endret `web-prototype`, `grill-me` eller `fint-graphql`: oppdater også
   org-katalogen (last opp på nytt).
5. Kollegaer henter med `/plugin marketplace update claude-code-skills`.

## Renhetskrav (håndheves før hver push)

- Den gamle forkortelsen for fylkeskommunen (v-t-f-k) — null treff i hele
  repoet; vi heter Vestfold fylkeskommune.
- Personnavn og private repo-referanser — null treff.
- `fint` — kun i `plugins/fint-graphql/`.
- Aldri persondata, fødselsnummer, secrets eller interne miljø-URL-er,
  heller ikke i eksempler.

## Valgfritt: reglene alltid aktive i egen `~/.claude/CLAUDE.md`

Skillene er selvbærende, så dette trengs ikke — men den som vil ha fase-rytmen
aktiv i ALLE prosjekter (også de uten `kunnskap/`-struktur) kan legge dette i
sin egen `~/.claude/CLAUDE.md`:

```markdown
## Faseinndelte prosjekter

- Prosjekter kjøres i faser med verifiseringsport: planmodus → plan i
  kunnskap/plan.md → faser → brukeren verifiserer → /faseflyt:fase-slutt → /clear.
- Ny økt starter med /faseflyt:fase-start. Ikke utforsk kodebasen for ting
  STATUS allerede svarer på.
- Utforskning delegeres til Explore-subagent — bare konklusjonen inn i hovedtråden.
- /compact kun midt i en fase som ikke rekker å fullføres.
```
