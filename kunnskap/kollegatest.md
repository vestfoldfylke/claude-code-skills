# Full kollegatesting — protokoll

Kjøres ETTER at testplan.md test 1–3 er grønne (ellers tester kollegaene dine
feil, ikke pakkens formidling). Målet er IKKE å teste kollegaene — det er å
teste at README + skills bærer seg selv uten deg. **Alt du må forklare muntlig,
er en mangel i pakken.**

## Testpersoner — velg ulikt teknisk grunnlag

| | Profil A — teknisk | Profil B — mindre teknisk |
|---|---|---|
| Bakgrunn | Utvikler/scripter, bruker git daglig | Rådgiver/fagperson, bruker Claude men ikke git/terminal daglig |
| Scenario | Script/automatisering ELLER API/backend | Dokumentasjon/utredning (ingen kode-forkunnskap nødvendig) |
| Tester i tillegg | Test C (overtakelse) | Forutsetningskjeden (GitHub-medlemskap, gh auth) |

Én av hver er nok. Book 60–90 min per person, helst fysisk eller skjermdeling.

**Minst én av testpersonene skal være på Mac** (helst profil A — de fleste
utviklerne er der). All testing i testplan.md kjøres på Windows, så
kollegatesten er eneste sjekk av at pakken ikke har Windows-antakelser.
Observer spesielt: at STATUS *ikke* får Windows-regler på Mac, og at ingen
genererte kommandoer er PowerShell-spesifikke.

## Din rolle under testen — de tre reglene

1. **Ikke hjelp.** Sitt bak, ta notater. Kollegaen skal kun bruke README-en og
   det Claude selv sier.
2. **Grip inn først etter 5 minutter fastlåst** — og noter da NØYAKTIG hva som
   låste seg og hvilken setning som løste det. Den setningen mangler i README.
3. **Be dem tenke høyt.** «Hva leter du etter nå?» er lov å spørre; «prøv å
   klikke der» er ikke.

## Forberedelser (din sjekkliste, dagen før)

- [ ] Kollegaen har Claude Code installert (CLI eller VS Code-utvidelsen)
- [ ] Kollegaen er medlem av `vestfoldfylke` på GitHub — IKKE fiks dette i
      stillhet: tiden det tar å oppdage og løse manglende medlemskap er et
      testfunn i seg selv (README sier «spør IT» — holder det?)
- [ ] `gh` CLI installert — samme prinsipp: observer om README-forutsetningene
      er nok
- [ ] PR #1 er flettet og eventuelle funn fra testplan.md er rettet
- [ ] Du har notatmal klar (nederst)

## Testløp

### Del 1 — Fra null til installert (mål: < 15 min uten hjelp)

Gi kollegaen KUN lenken til repoet. Ingen annen kontekst enn: «Vi har laget en
arbeidsflyt-pakke for Claude Code. Installer den og start et testprosjekt.»

Observer:
- [ ] Finner de installasjonsseksjonen i README selv?
- [ ] Snubler de i forutsetningene (gh auth, GitHub-medlemskap)?
- [ ] Forstår de at `/plugin marketplace add` ikke «publiserer» noe?
- [ ] Vet de at kommandoene heter `/faseflyt:...` (namespace-forklaringen)?

### Del 2 — Første prosjekt (mål: fase 1 i mål på < 60 min)

De følger «Kom i gang»-seksjonen i README med et REELT lite behov fra egen
jobb (be dem ta med et på forhånd — f.eks. et script de har ønsket seg, eller
et dokument de skal skrive). Ikke konstruert oppgave — reell bruk avslører mer.

Observer per steg (noter tid og friksjonspunkter):
- [ ] `/faseflyt:nytt-prosjekt` — svarer de riktig på prosjekttype-spørsmålet?
      Forstår de persondata-spørsmålet og konsekvensen?
- [ ] `/faseflyt:grill-me` — orker de hele grillingen, eller hopper de av?
      (Hvis de hopper av: hvor mange spørsmål inn?)
- [ ] Planmodus — finner de Shift+Tab selv fra README? Forstår de forskjellen
      på å godkjenne planen og å godkjenne kode?
- [ ] Verifiseringsporten — forstår de at DE skal teste før neste fase, eller
      sier de bare «ok, fortsett»? (Dette er arbeidsflytens kjerne — hvis den
      misforstås, er README-seksjon 3 for svak.)
- [ ] `/faseflyt:fase-slutt` + `/clear` — tør de kjøre /clear? (Mange er redde
      for å «miste alt» — sier README tydelig nok at alt ligger i filer?)
- [ ] `/faseflyt:fase-start` neste økt — opplever de at Claude faktisk husker?

### Del 3 — Kun profil A: overtakelse (~15 min)

Gi dem klonelenken til DITT testprosjekt fra testplan.md test 2:
- [ ] Kloner, åpner, godtar trust — får de skills-tilbudet automatisk?
- [ ] Kjører `/faseflyt:fase-start` og forstår hvor prosjektet står, uten å
      spørre deg?

### Del 4 — Debrief (10 min, felles spørsmål til begge)

1. «Forklar med egne ord hva en fase er, og hvorfor /clear er trygt.»
   (Tester om HVORFOR-et nådde frem, ikke bare kommandoene.)
2. «Hva ville du gjort hvis noe i arbeidsflyten var klønete?»
   (Fasit: issue i repoet / fase-slutt tilbyr det — vet de det?)
3. «Ville du brukt dette på ditt neste prosjekt? Hvis nei — hva mangler?»

## Notatmal (én per testperson)

```markdown
## Kollegatest <dato> — profil <A/B>, <rolle>

**Del 1 (installasjon):** <min> — friksjon: ...
**Del 2 (første prosjekt):** <min> — friksjon per steg: ...
**Del 3 (overtakelse, kun A):** ...
**Debrief-svar:** 1) ... 2) ... 3) ...

**Inngrep** (5-min-regelen): hva låste seg → setningen som løste det:
- ...

**Funn → tiltak:**
- [ ] README-endring: ...
- [ ] Skill-endring: ...
- [ ] Issue opprettet: #...
```

## Etterarbeid

Hvert funn blir enten en README-/skill-endring (via PR) eller et issue i
repoet — bruk samme kanal som kollegaene skal bruke, så testes den også.
Alvorlige funn (kollegaen kom ikke gjennom Del 1 eller misforsto
verifiseringsporten) rettes FØR pakken annonseres bredere i organisasjonen.
