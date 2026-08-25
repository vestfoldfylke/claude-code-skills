# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. `TODO.md` bærer beslutninger og
resonnement. Merkelappen `kjent-før-test` = bevisst utsatt.

**FRIST: samlingen er 14. september 2026.** Tre uker. Seks grupper, deltakernes
egne maskiner, satt opp på forhånd av BK (Mac + ARM + x86_64).

**Fase:** tørrkjøringen er avsluttet (fase 0/1/2 verifisert, fase 3 bevisst ikke
kjørt). **LEVERT 2026-08-25 (sent kveld), på `VPC-5CG3433WMH`:** `faseflyt`
**0.5.4** (oppstartens egne kall skal ikke koste godkjenninger) og **0.5.5** (to
småposter ut av verden). Renhetsporten kjørt foran push. Arbeidstreet er rent.

**Første økt som kjørte 0.5.3 i drift.** Funnet: én fase-start kostet fem
godkjenningsdialoger — tre `Read` skrevet med absolutt brukersti mot
tilde-matchere, og steg 0s to git-kommandoer kjedet med `&&`. Steg 2s
git-kommandoer var dessuten aldri allowlistet. Alt rettet i 0.5.4.

**Avklart, ikke lenger umålt:** `Read(~/...)` i en permission-matcher **virker** —
men bare når kallet også skrives med tilde. Direkte observert i begge retninger,
samme fil. At `&&`-kjeding bryter matchingen er *sluttet*, ikke isolert.

## Neste — start her

**1. `/plugin marketplace update claude-code-skills` i terminalen + omstart.**
0.5.5 ligger på `main`; økten som skrev dette kjørte 0.5.3, så SKILL.md-endringene
er ikke prøvd i drift. Neste `/fase-start` etter omstart er første måling av dem.

**2. Mac-pre-flight (helt urørt, plattformen flest er på) og ARM-pre-flight**
(kontor-PC, Snapdragon). `kollegatest.md` har alle bokser tomme. Dette er
kritisk vei for samlingen. Rekkefølgen for ARM står i `TODO.md` under
«Maskinstatus»: `git -C ~/.claude pull` FØRST, så `/plugin marketplace add`.

**3. Første post: `fase-slutt`s utdatakontrakt sier ingenting om rekkefølge.**
Sluttrapporten 2026-08-25 kom som 5, 6, 4, 2 — «unntaket er steg 5 og 6» inviterer
til å løfte dem først, og de rene stegene fikk egen seksjon framfor én samlelinje.
Vurder samtidig om stegnumre hører i utskriften i det hele tatt. Utsatt med vilje
(BK): fiksen bør formes av hvordan neste faseslutt faktisk leser.

## Arbeidsmåte neste økt

- **[proev-forslaget-mot-prosjektets-egne-laerdommer]** *(sjette runde — se
  promoteringsforslag)* Før et råd om tilgang, regler eller konfigurasjon: søk i
  `plan.md`, `TODO.md` og `logg.md` etter om det alt er målt eller avgjort.
- **[foelg-kontrakten-du-selv-leser]** *(ny)* Oppgir en skill jeg kjører et
  konkret utdatamål, sjekker jeg utkastet mot det målet før jeg sender — ikke
  bare mot om innholdet er sant. Alt kan være korrekt og likevel bryte kontrakten.
- **[tilby-valgene-brukeren-faktisk-har]** *(ny)* Før jeg tilbyr et valg: spenner
  alternativene over det brukeren realistisk kan ville? «Gjør det ferdig nå» skal
  være med når posten er liten nok til det.

## Det en ny økt må vite

- **PROMOTERINGSFORSLAG VENTER, sjette runde:**
  `[proev-forslaget-mot-prosjektets-egne-laerdommer]` inn i `CLAUDE.md` under
  «Målinger og språk», ut av STATUS. **Krever BKs klarsignal — aldri automatisk.**
- **Skriv dine egne kall slik allowlisten ser dem:** tilde-form, aldri absolutt
  brukersti, og ett kall per kommando — `&&`/`;`-kjeder matcher ingen oppføring.
  Står nå som eget avsnitt i `fase-start/SKILL.md`.
- **Ingen automatisk port finnes.** Diffen er eneste port. Renhetsporten kjøres
  fra Bash ETTER `git add`, alltid med én positiv kontroll, og
  `claude plugin validate .` ved siden av.
- **Beskrevet omfang er avtalt omfang:** ingen pakke-/mal-/dokumentfil endres
  uten ordlyd-forslag og klarsignal. Pakkeendring = bump BEGGE manifestene +
  `CHANGELOG.md`. Målinger dateres og navngir maskinen.
- **Én person kan ikke fullføre en faseslutt i et nytt `vestfoldfylke`-repo** —
  org-regelsamling `9211483`. Vårt eget repo er fritatt (2026-08-19).
- `kunnskap/` har også `kollegatest.md`, `testplan.md`, `selvbaerende-test.md`.
- `/plugin` og `/permissions` kun i terminalen — ikke i VS Code-utvidelsen.
- Flerlinjede commit-meldinger: meldingsfil + `git commit -F`.
