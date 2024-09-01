type stanje = Stanje.t;;
type sklad = Sklad.t;;



type t = {
  stanja : stanje list;
  zacetno_stanje : stanje;
  sprejemna_stanja : stanje list;
  prehodi : (stanje * char * char * stanje * (char list)) list;
}

let prazen_avtomat zacetno_stanje =
  {
    stanja = [ zacetno_stanje ];
    zacetno_stanje;
    sprejemna_stanja = [];
    prehodi = []; (* stanje*char*char -> stanje*(char list)  *)

  }

let dodaj_nesprejemno_stanje stanje avtomat =
  { avtomat with stanja = stanje :: avtomat.stanja } (* vrnemo isti avtomat skupaj z novim stanjem *)

let dodaj_sprejemno_stanje stanje avtomat =
  {
    avtomat with
    stanja = stanje :: avtomat.stanja;
    sprejemna_stanja = stanje :: avtomat.sprejemna_stanja;
  }


let dodaj_prehod stanje1 vhodni_znak sklad_znak stanje2 beseda avtomat =
  { avtomat with prehodi = (stanje1, vhodni_znak, sklad_znak, stanje2, beseda) :: avtomat.prehodi }

let prehodna_funkcija avtomat stanje vhodni_znak sklad_znak =
  match
    List.find_opt
      (fun (stanje1, vhodni_znak', sklad_znak', _stanje2, _beseda) -> stanje1 = stanje && vhodni_znak = vhodni_znak' && sklad_znak = sklad_znak')
      avtomat.prehodi
  with
  | None -> None
  | Some (_, _, _, stanje2, beseda) -> Some (stanje2, beseda)

let zacetno_stanje avtomat = avtomat.zacetno_stanje
let seznam_stanj avtomat = avtomat.stanja
let seznam_prehodov avtomat = avtomat.prehodi

let je_sprejemno_stanje avtomat stanje =
  List.mem stanje avtomat.sprejemna_stanja


let sa_veljavni_oklepaji =
  let q0 = Stanje.iz_niza "q0" in
  prazen_avtomat q0 |> dodaj_sprejemno_stanje q0
  |> dodaj_prehod q0 '(' 'B' q0 ['(']
  |> dodaj_prehod q0 '(' '(' q0 ['('; '(']
  |> dodaj_prehod q0 '(' ')' q0 [')'; '(']
  |> dodaj_prehod q0 '(' '{' q0 ['{'; '(']
  |> dodaj_prehod q0 '(' '}' q0 ['}'; '(']
  |> dodaj_prehod q0 '(' '[' q0 ['['; '(']
  |> dodaj_prehod q0 '(' ']' q0 [']'; '(']

  |> dodaj_prehod q0 '{' 'B' q0 ['{']
  |> dodaj_prehod q0 '{' '(' q0 ['('; '{']
  |> dodaj_prehod q0 '{' ')' q0 [')'; '{']
  |> dodaj_prehod q0 '{' '{' q0 ['{'; '{']
  |> dodaj_prehod q0 '{' '}' q0 ['}'; '{']
  |> dodaj_prehod q0 '{' '[' q0 ['['; '{']
  |> dodaj_prehod q0 '{' ']' q0 [']'; '{']

  |> dodaj_prehod q0 '[' 'B' q0 ['[']
  |> dodaj_prehod q0 '[' '(' q0 ['('; '[']
  |> dodaj_prehod q0 '[' ')' q0 [')'; '[']
  |> dodaj_prehod q0 '[' '{' q0 ['{'; '[']
  |> dodaj_prehod q0 '[' '}' q0 ['}'; '[']
  |> dodaj_prehod q0 '[' '[' q0 ['['; '[']
  |> dodaj_prehod q0 '[' ']' q0 [']'; '[']

  |> dodaj_prehod q0 ')' '(' q0 []
  |> dodaj_prehod q0 '}' '{' q0 []
  |> dodaj_prehod q0 ']' '[' q0 []

  |> dodaj_prehod q0 ')' 'B' q0 [     ')']
  |> dodaj_prehod q0 ')' ')' q0 [')'; ')']
  |> dodaj_prehod q0 ')' '{' q0 ['{'; ')']
  |> dodaj_prehod q0 ')' '}' q0 ['}'; ')']
  |> dodaj_prehod q0 ')' '[' q0 ['['; ')']
  |> dodaj_prehod q0 ')' ']' q0 [']'; ')']

  |> dodaj_prehod q0 ']' 'B' q0 [     ']']
  |> dodaj_prehod q0 ']' '(' q0 ['('; ']']
  |> dodaj_prehod q0 ']' ')' q0 [')'; ']']
  |> dodaj_prehod q0 ']' '{' q0 ['{'; ']']
  |> dodaj_prehod q0 ']' '}' q0 ['}'; ']']
  |> dodaj_prehod q0 ']' ']' q0 [']'; ']']

  |> dodaj_prehod q0 '}' 'B' q0 [     '}']
  |> dodaj_prehod q0 '}' '(' q0 ['('; '}']
  |> dodaj_prehod q0 '}' ')' q0 [')'; '}']
  |> dodaj_prehod q0 '}' '}' q0 ['}'; '}']
  |> dodaj_prehod q0 '}' '[' q0 ['['; '}']
  |> dodaj_prehod q0 '}' ']' q0 [']'; '}']