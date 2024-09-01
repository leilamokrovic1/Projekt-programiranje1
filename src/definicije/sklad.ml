
type t = char list 


let prazen = []

let je_prazen sklad = List.compare_length_with sklad 0 = 0 (*iz OCaml dokumentacije, preveri če je seznam prazen*)

let trenutni_znak = function
  | [] -> 'B' (*če prazen, je znak Blank / B*)
  | z::_ -> z (*vrh sklada, prvin znak v seznamu*)

let dodaj_na_sklad sklad beseda =    (*pravilno stakne sklad z besedo*)
  let rec nalozi sklad' beseda' = match beseda' with
    | [] -> sklad'
    | z::rep' -> nalozi (z::sklad') rep'
  in
  match sklad with
    | [] -> nalozi sklad beseda
    | _::rep -> nalozi rep beseda (*damo besedo namesto prvega znaka*)

