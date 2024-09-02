# Skladovni avtomati
Projekt vsebuje implementacijo skladovnih avtomatov, enega izmed zelo uporabnih računskih modelov, ter njihovo uporabo za preverjanje (oklepajskih) nizov. 

Skladovni avtomat začne v enem izmed možnih stanj. Glede na trenutno stanje, trenutni simbol in vrhnji element na skladu, preide v novo stanje, hkrati pa lahko vrhnji znak sklada zamenja z določeno besedo. Če po obdelavi celotnega niza avtomat konča v enem od sprejemnih stanj ali je sklad prazen, je niz sprejet, sicer pa ni.

##  Uporaba skladovnih avtomatov za karakterizacijo oklepajskih nizov

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

Za nemoteno delovanje projekta sta potrebna OCaml in Dune. Za uporabo ter vnos oklepajskega niza se poslužujemo tekstovnega vmesnika, ki ga zaženemo z ukazom ```dune build```. Ta postopek bo ustvaril program ```tekstovniVmesnik.exe```. Za samo uporabo pa je treba pognati še ```dune exec ./tekstovniVmesnik.exe```.

Program bo izpisal sledeče:

```

1) Preveri oklepajski niz         
2) Nastavi na začetno stanje
```
Za preverjanje veljavnosti oklepajskih nizov izberemo 1, za ponovno uporabo 2.

## Implementacija
Zaradi preglednosti je avtomat zapisan v nekaj datotekah v mapi ```src```. 
### Struktura datotek
Datoteke tega projekta so:
-  avtomat.ml, ki definira skladovni avtomat
-  sklad.ml, ki definira obliko in obnašanje sklada ob prehodih.
-  stanje.ml, kjer je zapisan tip stanja 
-  trak.ml, ki definira trak in njegovo obnašanje ob prebranem znaku
-  zagnaniAvtomat.ml, kjer se avtomat premika naprej po korakih
-  tekstovni.Vmesnik.ml, ki definira vmesnik za branje oklepajskih nizov.

## Primerjava skladovnih avtomatov z običajnimi končnimi avtomati
Kot že samo ime nakazuje, je ključna razlika med skladovnimi avtomati in običajnimi končnimi avtomati prisotnost sklada. Sklad pri skladovnih avtomatih omogoča shranjevanje in dostop do že prebranih znakov, kar je pomembno za bolj kompleksno obdelavo vhodnih nizov.

Z uporabo sklada lahko avtomat ohranja informacijo o prejšnjih stanjih, kar mu omogoča reševanje problemov, ki jih običajni končni avtomati ne morejo. Na primer, skladovni avtomati so sposobni analizirati strukturo gnezdenih elementov, medtem ko to za običajne končne avtomate predstavlja prevelik izziv.
