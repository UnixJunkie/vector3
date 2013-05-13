
type vector3 = {x: float;
                y: float;
                z: float}

let origin =
  { x = 0. ;
    y = 0. ;
    z = 0. ; }

let new_vector3 x y z =
  { x = x ;
    y = y ;
    z = z ; }

let vector3_of_triplet (x, y, z) =
  { x = x ;
    y = y ;
    z = z ; }

let triplet_of_vector3 v =
  (v.x, v.y, v.z)

let dot v1 v2 =
  v1.x *. v2.x +.
  v1.y *. v2.y +.
  v1.z *. v2.z

let cross v1 v2 =
  { x = v1.y *. v2.z -. v1.z *. v2.y;
    y = v1.z *. v2.x -. v1.x *. v2.z;
    z = v1.x *. v2.y -. v1.y *. v2.x }

let angle v1 v2 =
  acos (dot v1 v2)

let diff v1 v2 =
  { x = v1.x -. v2.x;
    y = v1.y -. v2.y;
    z = v1.z -. v2.z }

let add v1 v2 =
  { x = v1.x +. v2.x;
    y = v1.y +. v2.y;
    z = v1.z +. v2.z }

let squared_magnitude v =
  v.x *. v.x +.
  v.y *. v.y +.
  v.z *. v.z

let magnitude v =
  sqrt (squared_magnitude v)

let distance v1 v2 =
  magnitude (diff v1 v2)

let div v s =
  { x = v.x /. s ;
    y = v.y /. s ;
    z = v.z /. s }

let mult v s =
  { x = v.x *. s ;
    y = v.y *. s ;
    z = v.z *. s }

let normalize v =
  div v (magnitude v)

let vector3_of_string str =
  match Scanf.sscanf str "%f %f %f" (fun x y z -> (x, y, z)) with
    (x, y, z) -> { x = x ;
                   y = y ;
                   z = z }

let string_of_vector3 v =
  Printf.sprintf "%f %f %f" v.x v.y v.z

(* H atom PDB line *)
let make_pdb_line ?(bfactor=0.0) v =
(* example:
   'ATOM     10  C3  MPT    10     103.646  58.223 -36.577    1   0.07' *)
  Printf.sprintf "ATOM          H  MPT      %12.3f%8.3f%8.3f%5d%7.2f"
    v.x v.y v.z 1 bfactor
