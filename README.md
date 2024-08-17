# Turingov stroj z več trakovi

Turingov stroj z več trakovi je razširitev klasičnega Turingovega stroja, pri katerem ima stroj več kot en trak in več bralno-pisalnih glav.
Vsak trak deluje neodvisno, z lastno glavo za branje in pisanje, vendar so vse glave krmiljene hkrati z isto tabelo pravil.
Ta model omogoča učinkovitejše izvajanje nekaterih izračunov in je enakovreden standardnemu Turingovemu stroju po izračunljivosti, vendar lahko določene naloge reši hitreje.

### Struktura Turingovega stroja z več trakovi:
1. **Več trakov**: Vsak trak je neskončen in deluje neodvisno.
   Na vsakem traku se shranjujejo podatki, ki jih obdeluje stroj.
2. **Več bralno-pisalnih glav**: Vsak trak ima svojo glavo, ki bere in piše simbole.
   Glave se lahko premikajo levo ali desno neodvisno ena od druge.
3. **Stanja**: Stroj se nahaja v enem izmed končnih stanj.
   Pravila določajo prehode med stanji na podlagi simbolov, prebranih na vseh trakovih.
4. **Tabela pravil**: Vsako pravilo določa, kaj mora stroj storiti glede na trenutno stanje in prebrane simbole na vseh trakovih.
   Pravilo lahko vključuje zapis novega simbola na kateremkoli traku, premik glave na kateremkoli traku, in prehod v novo stanje.

Čeprav Turingov stroj z več trakovi ne poveča teoretične moči izračunljivosti v primerjavi s standardnim enotrakovnim strojem, je bistveno hitrejši pri izvajanju določenih operacij.
