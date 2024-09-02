# Skladovni avtomati
Projekt vsebuje implementacijo skladovnih avtomatov, enega izmed zelo uporabnih računskih modelov, ter njihovo uporabo za preverjanje (oklepajskih) nizov. 

Skladovni avtomat začne v enem izmed možnih stanj. Glede na trenutno stanje, trenutni simbol in vrhnji element na skladu, preide v novo stanje, hkrati pa lahko spremeni vsebino sklada. Če po obdelavi celotnega niza avtomat konča v enem od sprejemnih stanj in sklad izpolnjuje določene pogoje, je niz sprejet, sicer pa ni.

##  Uporaba skladovnih svtomatov za karakterizacijo oklepjskih nizov

Ta projektna naloga predstavlja implementacijo skladovnih avtomatov za karakterizacijo oklepajskih nizov. Avtomat preverja ali je vneseni oklepajski niz veljaven ali ne. 

Oklepajski niz **je** veljaven, če:
- so oklepaji pravilno gnezdeni, npr.:
  ``` {[(){}]}()[] ```,
  ```()```...

Oklepajski niz **ni** veljaven, če:
- niz vsebuje ne-oklepjski znak, npr.:
  ``` 1(){}[] ```,  ``` abc(){}[]cbd ```, ``` +(){}[] ```...
- niz ni pravilno gnezden
## Matematična definicija

Skladovni avtomat je definiran kot nabor sedmih spremenljivk, na sledeč način $M=(Q, \Sigma, \Gamma, \delta, q_{0}, Z, F)$ kjer:


- $Q$ je končna množica stanj
- $\Sigma$ je končna množica, imenovana vhodna abeceda
- $\Gamma$ je končna množica, imenovana skladovna abeceda
- $\delta$ je končna podmnožica $Q \times (\Sigma \cup \{\varepsilon\}) \times \Gamma \times Q \times \Gamma^{*}$, prehodna funkcija
- $q_{0} \in Q$ je začetno stanje
- $Z \in \Gamma$ je začetni simbol sklada
- $F \subseteq Q$ je množica sprejemnih stanj

Uporabljamo standardno notacijo formalnih jezikov: 
$\Gamma^{*}$ označuje množico nizov končne dolžine nad abecedo $\Gamma$, 
$\varepsilon$ pa označuje prazni niz.

## Navodila za uporabo

Za nemoteno delovanje projekta sta potrebna OCaml in Dune. Za uporabo ter vnos oklepajskega niza se poslužujemo tekstovnega vmesnika, ki ga zaženemo z ukazom ```dune build```. Ta postopek bo ustvaril program ```tekstovniVmesnik.exe```.

### Tekstovni vmesnik

## Implementacija

### Struktura datotek

## Razlike med skladovnimi avtomati in običajnimi končnimi avtomati

