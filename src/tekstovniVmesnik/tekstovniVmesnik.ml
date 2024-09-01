open Definicije
open ZagnaniAvtomat

type stanje_vmesnika =
  | SeznamMoznosti
  | BranjeNiza
  | RezultatPrebranegaNiza
  | OpozoriloONapacnemNizu

type model = ZagnaniAvtomat.t
type vmesnik = {
  model : model;
  stanje_avtomata : Stanje.t;
  stanje_vmesnika : stanje_vmesnika
}

type msg =
  | PreberiNiz of string
  | ZamenjajVmesnik of stanje_vmesnika
  | VrniVPrvotnoStanje

(* let preberi_niz avtomat q niz =
  let aux acc vhodni_znak =
    match acc with
    | None -> None
    | Some stanje -> Avtomat.prehodna_funkcija avtomat stanje vhodni_znak (Sklad.trenutni_znak model.sklad)
  in
  niz |> String.to_seq |> Seq.fold_left aux (Some q) *)


(* let rec read_str model niz = match (korak_naprej model) with
  | None -> None
  | Some model' -> if (Trak.je_na_koncu model'.trak) then (Some model')
                   else (read_str model')  *)

let read_str model niz = 
  let rec aux m = match (korak_naprej m) with
    | None -> None (* Dobimo None, če naletimo na neveljaven znak, ki ni oklepaj *)
    | Some m' -> 
      if (Trak.je_na_koncu m'.trak) then (Some m') 
      else (aux m')
  in
  aux (nastavi_trak model niz)


let update vmesnik = function
  | PreberiNiz str -> (
      match read_str vmesnik.model str with
      | None -> { vmesnik with stanje_vmesnika = OpozoriloONapacnemNizu }
      | Some model' ->
          {
            (* vmesnik with *)
            model = model';
            stanje_avtomata = model'.stanje;
            stanje_vmesnika = RezultatPrebranegaNiza;
          })
  | ZamenjajVmesnik stanje_vmesnika -> { vmesnik with stanje_vmesnika }
  | VrniVPrvotnoStanje ->
      {
        (* vmesnik with *)
        model = {vmesnik.model with trak = Trak.prazen; stanje = Avtomat.zacetno_stanje vmesnik.model.avtomat; sklad = Sklad.prazen};
        stanje_avtomata = Avtomat.zacetno_stanje vmesnik.model.avtomat;
        stanje_vmesnika = SeznamMoznosti;
      }

let rec izpisi_moznosti () =
  print_endline "1) Preveri oklepajski niz";
  print_endline "2) Nastavi na začetno stanje";
  print_string "> ";
  match read_line () with
  | "1" -> ZamenjajVmesnik BranjeNiza
  | "2" -> VrniVPrvotnoStanje
  | _ ->
      print_endline "** VNESI 1 ALI 2 **";
      izpisi_moznosti ()



let beri_niz _vmesnik =
  print_string "Vnesi niz oklepajev > ";
  let str = read_line () in
  PreberiNiz str

let izpisi_rezultat vmesnik =
  if sklad_prazen vmesnik.model.sklad then begin
    print_endline "Oklepajski izraz je veljaven.";
    print_endline ("Trenutno stanje avtomata: " ^ (Stanje.v_niz vmesnik.stanje_avtomata)) end 
  else print_endline "Oklepajski izraz ni veljaven"

let view vmesnik =
  match vmesnik.stanje_vmesnika with
  | SeznamMoznosti -> izpisi_moznosti ()
  | BranjeNiza -> beri_niz vmesnik
  | RezultatPrebranegaNiza ->
      izpisi_rezultat vmesnik;
      ZamenjajVmesnik SeznamMoznosti
  | OpozoriloONapacnemNizu ->
      print_endline "Niz ni veljaven";
      ZamenjajVmesnik SeznamMoznosti

let init model =
  {
    model;
    stanje_avtomata = Avtomat.zacetno_stanje model.avtomat;
    stanje_vmesnika = SeznamMoznosti;
  }

let rec loop vmesnik =
  let msg = view vmesnik in
  let vmesnik' = update vmesnik msg in
  loop vmesnik'

let _ = loop (init (pozeni Avtomat.sa_veljavni_oklepaji Trak.prazen Sklad.prazen))