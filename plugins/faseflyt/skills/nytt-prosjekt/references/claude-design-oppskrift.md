# Claude Design → Designsystemet-tema, steg for steg

Oppskrift for å hente et visuelt tema fra et Claude Design-prosjekt og legge det
OPPÅ Designsystemet (`@digdir/designsystemet-css`) som ren token-overstyring —
aldri som frittstående komponent-CSS. Kun relevant for webapp-typen.

## Hvorfor tokens, ikke egen CSS

Designsystemet leverer alle komponenter (`ds-button`, `ds-card`, `ds-tabs` …)
allerede tilgjengelighets- og interaksjonstestet. De leser farger/radius/font fra
CSS-variabler (`--ds-color-*`, `--ds-border-radius-base`, `--ds-font-family`).
Overstyr disse variablene i `:root`, og HVER eksisterende komponent tar det nye
temaet automatisk — ingen ny komponent-CSS å holde i synk, ingen risiko for å
bryte fokus-/tastatur-/kontraststøtte som allerede er løst.

## Steg 1 — koble til designprosjektet

- Interaktiv innlogging kreves (kan ikke gjøres av Claude i en non-interaktiv
  økt): `/design-login` (bruker) via CLI-binæren som følger VS Code-utvidelsen —
  merk at `claude` ofte ikke ligger på PATH, så kommandoen må kjøres fra samme
  binær som utvidelsen bruker.
- `DesignSync`-verktøyet leser deretter designprosjektene. `list_projects` viser
  KUN design-system-prosjekter — et separat wireframe-prosjekt (f.eks. en
  konkret skjermflyt) vises ikke i listen, men kan likevel leses hvis brukeren
  oppgir projectId direkte.

## Steg 2 — hent paletten og map til DS-fargeroller

Designsystemet har seks semantiske fargeroller: `accent`, `info`, `neutral`,
`success`, `warning`, `danger` — hver med et fast sett undertoner
(`background-default/tinted`, `surface-default/tinted/hover/active`,
`border-subtle/default/strong`, `text-subtle/default`, `base-default/hover/active`,
`base-contrast-subtle/default`).

Map designmanualens palett til disse rollene FØR du skriver en linje CSS — dette
er en beslutning brukeren tar (hvilken palettfarge er «advarsel», hvilken er
«suksess»), ikke noe som utledes automatisk. Loggfør mappingen som en
`**Beslutning (<beslutningstaker>, <tema>):**` i prosjektets logg — med navnet på
den som bestemte.

For hver rolle: ta palettfargens tonalskala (10/20/30/40/80/90/100 e.l.) og sett
den rå fargen på riktig DS-variabel — `border-strong`/`base-default` får den
mest mettede tonen, `surface-tinted` den lyseste. Sjekk kontrast selv for
tekst-på-bunn-kombinasjoner: `base-contrast-default` er ofte `#fff` ELLER
`#000` avhengig av hvor lys basisfargen er — `warning`-rollen ender typisk med
`#000`, ikke `#fff`.

## Steg 3 — typografi og radius

- `--ds-font-family` for brødtekst.
- Designsystemet har KUN én font-token — hvis designmanualen skiller display-
  og brødtekstfont, sett display-fonten som en egen regel på `.ds-heading` i
  stedet for å prøve å presse to fonter inn i én token.
- `--ds-border-radius-base` for hjørneradius (designmanualens «md»-verdi er
  typisk riktig default).
- `--ds-color-focus-outer` for fokusring — universell utforming-krav, settes
  alltid eksplisitt til en farge med god kontrast mot bakgrunn.

## Steg 4 — samle alt i én fil

Én fil (typisk `src/app.css`) med en kommentarblokk på toppen som navngir
KILDEN (designprosjekt + palett-/manualnavn) og selve
palett→DS-rolle-mappingen. Dette er dokumentasjonen neste utvikler (eller
Claude) trenger for å forstå HVORFOR en gitt hex-verdi står der, uten å måtte
gå tilbake til designprosjektet.

## Steg 5 — bruk wireframes som visuell fasit, ikke som kode

Hvis designprosjektet også inneholder konkrete skjermflyter (wireframes, ofte i
et annet rammeverk enn appen — f.eks. React-wireframes mot en Svelte-app):
bruk dem KUN til å avgjøre layout/variant-valg. Implementer alltid i appens
eget rammeverk med DS-komponenter — kopier aldri wireframe-koden.

## Fallback uten DesignSync

Hvis `/design-login` ikke er satt opp eller designprosjektet ikke er
tilgjengelig: skjermdumper limt inn i chatten, eller statiske filer i en
`design/`-mappe i prosjektet, dekker samme behov — DesignSync er en
bekvemmelighet, ikke en forutsetning for oppskriften.
