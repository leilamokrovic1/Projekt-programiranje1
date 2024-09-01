
type t = char list 


let prazen = []

let je_prazen sklad = List.compare_length_with sklad 0 = 0

let trenutni_znak = function
  | [] -> 'B' (*če prazen, je znak Blank / B*)
  | z::_ -> z

let dodaj_na_sklad sklad beseda = 
  let rec nalozi sklad' beseda' = match beseda' with
    | [] -> sklad'
    | z::rep' -> nalozi (z::sklad') rep'
  in
  match sklad with
    | [] -> nalozi sklad beseda
    | _::rep -> nalozi rep beseda

