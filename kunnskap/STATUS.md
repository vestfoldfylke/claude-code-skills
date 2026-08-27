# STATUS — les denne først i ny økt

*Overskrives ved faseslutt. Historikk: `logg.md`. Selvvurdering: `laering.md`.*
**Plan:** `kunnskap/plan.md` **TODO:** `kunnskap/TODO.md`
**Køen bor i GitHub issues** — `gh issue list`. `TODO.md` bærer beslutninger og
resonnement. Merkelappen `kjent-før-test` = bevisst utsatt.

**FRIST: samlingen er 14. september 2026.** Under tre uker. Seks grupper,
deltakernes egne maskiner, satt opp på forhånd av BK (Mac + ARM + x86_64).

**Fase:** tørrkjøringen internt er avsluttet (fase 0/1/2 verifisert, fase 3
bevisst ikke kjørt). Siste utgivelse er `faseflyt` **0.5.11** (2026-08-27,
`fd86599`) — steg 6 i `fase-slutt` krever nå ett kontrollsøk som skal gi treff.

**Køen er tom bak frysen.** Seks av sju åpne issues bærer `kjent-før-test` (#15,
#10, #9, #8, #7, #3) — det er MVP-frysen (BK 2026-08-19: ikke bygg mer før testen
er gjort). #16 var umerket og ble lukket i denne økten. **Å ta et av de seks nå er
å oppheve frysen — det er BKs valg, ikke en oppgave å plukke.**

## Neste — start her

**1. Tørrkjøringen skjer 28. august på DENNE maskinen (`VPC-8WD9VC4`) sammen med
en kollega.** Case: «Oppgave 5 — Utstyrsskapet», sitert ordrett i `TODO.md`.
**Skal skje i en blank økt i en tom mappe utenfor dette repoet** — en økt som har
lest `plan.md`/`TODO.md` måler seg selv med fasit i hånda.

**FØR den starter: cachen ligger bak repoet.** Maskinen kjører 0.5.10; repoet står
på 0.5.11. Kjør `/plugin marketplace update` **og start Claude Code på nytt** —
en kjørende prosess beholder versjonen den startet med. Fang før-verdien først.

**2. Innholdssammenligning cache mot repo er aldri gjort på denne maskinen.** Kun
versjonsnummer er målt på ARM, ikke innhold. Gjort to ganger på hjemme-PC-en
(0.2.1, 0.4.0 — 0 avvik). Normaliser linjeskift: cachen er CRLF, repoet LF.

**3. Mac-pre-flight — viktigste umålte post før fristen.** Helt urørt, og
plattformen flest er på. `kollegatest.md` har alle bokser tomme. Krever en
frivillig Mac; kan ikke gjøres herfra.

## Arbeidsmåte neste økt

- **[en-maaling-per-tur]** *(videreført, tredje runde uten skikkelig press)* En
  måletur inneholder instruksen og kallet — ingenting annet. Tørrkjøringen er
  anledningen som endelig presser den.
- **[foer-verdien-maa-fanges-foer-handlingen]** *(videreført, ikke prøvd)* Før en
  handling som skal måles: skriv ned dagens verdi. Treffer direkte i morgen —
  versjonen må leses før `marketplace update`, ikke etter.
- **[arvet-ordlyd-maa-vaskes-foer-den-limes-inn]** *(ny)* En ferdig ordlyd fra en
  issue eller et eldre notat er skrevet under gamle regler. Hold den mot
  `CLAUDE.md` før den går inn, og meld avviket — ikke rett det stille.

## Det en ny økt må vite

- **PROMOTERINGSFORSLAG VENTER, tolvte runde:**
  `[proev-forslaget-mot-prosjektets-egne-laerdommer]` inn i `CLAUDE.md` under
  `## Målinger`, ut av STATUS. **Krever BKs klarsignal — aldri automatisk.**
- **Arkivert i `laering.md`, ikke i STATUS:**
  `[sett-brukerinstruksen-rett-for-kallet]` — falt ut på maks-tre etter tre runder
  uten å bli hverken fulgt eller brutt. Hentes tilbake når en måling krever at
  brukeren gjør noe. Skal **ikke** promoteres: ratchet-en teller punkter som
  gjentar seg fordi de ikke følges.
- **Norske commit-meldinger lukker ikke issues.** GitHub kjenner
  `Closes`/`Fixes`/`Resolves`, ikke «Lukker #16». Bruk `gh issue close` som eget
  kall. Observert 2026-08-27.
- **Engangsgodkjenninger brenner målfiler.** Trykker brukeren «Yes», går fila
  gjennom ut økten uansett form. Velg alltid en urørt fil som mål, og si «trykk
  No» rett før kallet. Godkjenninger gjelder én økt.
- **Allowlist-saken er LUKKET.** Sammenhengen mellom `.claude/settings.json` og
  oppstartsdialogene finnes ikke. Noen få valg i oppstarten er greit og skal bare
  sies tydelig i dokumentasjonen (BK). Ikke gjenåpne uten ny bestilling.
- **Ingen automatisk sjekk finnes.** Diffen er eneste port. Renhetssjekken kjøres
  fra Bash ETTER `git add`, alltid med ett kontrollsøk som skal gi treff, og
  `claude plugin validate .` ved siden av.
- **Beskrevet omfang er avtalt omfang:** ingen pakke-/mal-/dokumentfil endres
  uten ordlyd-forslag og klarsignal. Pakkeendring = bump BEGGE manifestene +
  `CHANGELOG.md`. Målinger dateres og navngir maskinen.
- `.claude/settings.json` er tracket og endres av hver godkjenning — kjent falsk
  positiv i `fase-start` steg 2. Les diffen framfor å anta; en absolutt brukersti
  der havner hos alle som henter prosjektet.
- `kunnskap/` har også `kollegatest.md`, `testplan.md`, `selvbaerende-test.md`.
- `/plugin` og `/permissions` kun i terminalen — ikke i VS Code-utvidelsen.
- Flerlinjede commit-meldinger: meldingsfil + `git commit -F`.
