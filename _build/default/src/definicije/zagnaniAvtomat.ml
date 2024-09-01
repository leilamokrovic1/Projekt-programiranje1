type t = { avtomat : Avtomat.t; 
           trak : Trak.t; 
           stanje : Stanje.t; 
           sklad : Sklad.t }

let pozeni avtomat trak sklad=
  { avtomat; trak; stanje = Avtomat.zacetno_stanje avtomat; sklad}

let avtomat { avtomat; _ } = avtomat
let trak { trak; _ } = trak
let stanje { stanje; _ } = stanje

let nastavi_trak model niz = { model with trak = Trak.iz_niza niz }

let korak_naprej { avtomat; trak; stanje; sklad } =
  if Trak.je_na_koncu trak then None
  else
    let izhod =
      Avtomat.prehodna_funkcija avtomat stanje (Trak.trenutni_znak trak) (Sklad.trenutni_znak sklad)
    in
    match izhod with
    | None -> None
    | Some (stanje', beseda') ->
        Some { avtomat; trak = Trak.premakni_naprej trak; stanje = stanje'; sklad = Sklad.dodaj_na_sklad sklad beseda'}

let je_v_sprejemnem_stanju { avtomat; stanje; _ } =
  Avtomat.je_sprejemno_stanje avtomat stanje

let sklad_prazen sklad = Sklad.je_prazen sklad