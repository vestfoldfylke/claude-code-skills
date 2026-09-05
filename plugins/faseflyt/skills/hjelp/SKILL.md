---
name: hjelp
description: >-
  Forklarer faseflyt-arbeidsflyten og de fem kommandoene, og sier hvor i flyten
  brukeren står akkurat nå. Brukes når noen har glemt hvordan flyten går, ikke
  vet hva neste steg er, eller vil vite hva kommandoene gjør. Triggere: «hjelp»,
  «faseflyt hjelp», «hvordan var flyten», «hva gjør jeg nå», «hvilke kommandoer
  finnes», «help», «how does this work», «what do I do now».
---

# Hjelp — faseflyten på én skjerm

Noen har glemt hvordan flyten går, eller vet ikke hva neste steg er. Svar kort,
i denne rekkefølgen, og ikke gjenta README — pek på den til slutt.

Gjelder spørsmålet ikke flyten — en feilmelding, en kodelinje, noe i prosjektet
— si det i én linje («dette er ikke et spørsmål om flyten») og svar på det
brukeren faktisk spurte om. Resten av denne skillen brukes ikke da.

## 1. Si hvor brukeren står — men bare hvis du vet det

Finnes `kunnskap/STATUS.md`: les den, og åpne svaret med tre linjer — hvilken
fase prosjektet er i, hva som sist ble verifisert, og hva neste steg er. Hent
alle tre fra STATUS. Står noe av det ikke der, hopp over linjen framfor å gjette.

Dette er **ikke** `/faseflyt:fase-start`: du leser bare STATUS, ikke planen
eller loggen, du kvitterer ikke på arbeidsmåte-punkter, og du starter ikke
arbeidet. Er brukeren midt i en økt, skal denne skillen ikke røre den.

Finnes ikke `kunnskap/STATUS.md`, er prosjektet ikke satt opp med faseflyt. Si
det i én setning, og nevn at `/faseflyt:nytt-prosjekt` setter det opp — også i
et prosjekt som alt er i gang, uten å overskrive noe.

## 2. Flyten

Gjengi den slik. Forklar ordene i setningen de står i — ikke som ordliste:

> Du jobber i **faser**: en bit arbeid som er liten nok til at du selv kan se at
> den virker.
>
> 1. **Planen først.** Claude planlegger, du godkjenner. Ingenting bygges før
>    planen står i `kunnskap/plan.md`.
> 2. **Én fase bygges.**
> 3. **Du sjekker at det virker.** Ikke Claude — du. Går det ikke, fortsetter
>    arbeidet i samme fase.
> 4. **`/faseflyt:fase-slutt`** når du har sett det virke: Claude skriver logg
>    og STATUS, sjekker at prosjektet fortsatt går, og committer.
> 5. **`/clear`** tømmer samtalen, så neste gang starter frisk.
> 6. **`/faseflyt:fase-start`** neste gang: Claude leser notatene og sier hvor
>    du står.

## 3. Kommandoene

| Kommando | Hva den gjør | Når |
|---|---|---|
| `/faseflyt:nytt-prosjekt` | Setter opp fase-strukturen | Én gang per prosjekt |
| `/faseflyt:grill-me` | Intervjuer deg til bestillingen er avklart | Før planen skrives |
| `/faseflyt:fase-start` | Leser STATUS og planen, sier hvor du står | Først i hver økt |
| `/faseflyt:fase-slutt` | Logg, STATUS, sjekk, commit | Når du har sett en fase virke |
| `/faseflyt:hjelp` | Denne | Når du har glemt flyten |

**Kommandoformen styrer modellen.** Skriver du en av kommandoene over direkte,
kjører skillen alltid på Sonnet — det står i skillens egen definisjon,
uavhengig av hva økten ellers står på. Sier du i stedet noe som bare *ligner*
på kommandoen («start økten», «avslutt fasen» …), kjører skillen på øktens
gjeldende modell.

## 4. Pek videre, og stopp

Én linje: resten står i README-en i pakkerepoet
(`vestfoldfylke/claude-code-skills`) — hvorfor faser, hva filene i `kunnskap/`
er til for, hvordan pakken oppdateres og skrus av, og om du i det hele tatt
trenger hele opplegget.

Så **stopp**. Ikke begynn på arbeid, ikke foreslå et neste steg utover det
STATUS alt sier, og ikke still oppfølgingsspørsmål. Brukeren spurte om flyten,
ikke om hjelp til oppgaven.
