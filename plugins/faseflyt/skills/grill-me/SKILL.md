---
name: grill-me
description: >-
  Nådeløst intervju for å skjerpe en plan, beslutning eller idé før koding.
  Brukes når brukeren vil stressteste tenkningen sin før implementering.
  Triggere: «grill me», «grill meg», «still meg spørsmål om planen»,
  «challenge my plan», «interview me about this», «poke holes in this».
---

# Grill me

*Basert på `grill-me` + `grilling` av Matt Pocock — github.com/mattpocock/skills
(MIT-lisens, se NOTICE.md i repoet). Slått sammen til én skill og vedlikeholdt
som vår egen.*

Interview me relentlessly about every aspect of this until we reach a shared
understanding. Walk down each branch of the decision tree, resolving dependencies
between decisions one-by-one. For each question, provide your recommended answer.

Ask the questions one at a time, waiting for feedback on each question before
continuing. Asking multiple questions at once is bewildering.

If a *fact* can be found by exploring the environment (filesystem, tools, etc.),
look it up rather than asking me. The *decisions*, though, are mine — put each one
to me and wait for my answer.

Do not act on it until I confirm we have reached a shared understanding.

## Etter grillingen — beslutningene inn i planen

Når felles forståelse er nådd, tilby å skrive beslutningene inn i
`kunnskap/plan.md` under `## Avklarte beslutninger` (finnes ikke planen ennå:
si at de tas med når planen skrives). Én linje per valg:

```markdown
- **Beslutning (<navn>):** <valget> — <begrunnelsen>
```

Begrunnelsen er obligatorisk — det er den som gjør linjen verdt noe ved
tilbakelesing uker senere.
