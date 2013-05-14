(* Copyright (c) 2013, Zhang Initiative Research Unit,
 * Advance Science Institute, RIKEN
 * 2-1 Hirosawa, Wako, Saitama 351-0198, Japan
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 * TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. *)

type t = { x : float ;
           y : float ;
           z : float }

(* constructors ------------------------------------------------------------ *)

let origin =
  { x = 0. ;
    y = 0. ;
    z = 0. ; }

let make x y z =
  { x = x ;
    y = y ;
    z = z ; }

let of_triplet (x, y, z) =
  { x = x ;
    y = y ;
    z = z ; }

let of_string str =
  Scanf.sscanf str "%f %f %f"
    (fun x y z -> { x = x ;
                    y = y ;
                    z = z })

(* to other types ---------------------------------------------------------- *)

let to_triplet v =
  (v.x, v.y, v.z)

let to_string v =
  Printf.sprintf "%f %f %f" v.x v.y v.z

(* operations -------------------------------------------------------------- *)

let dot v1 v2 =
  v1.x *. v2.x +.
  v1.y *. v2.y +.
  v1.z *. v2.z

(*$T cross
  let ox, oy, oz = (make 1. 0. 0.,    \
                    make 0. 1. 0.,    \
                    make 0. 0. 1.) in \
  cross ox oy = oz
*)
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

let mag2 v =
  v.x *. v.x +.
  v.y *. v.y +.
  v.z *. v.z

let mag v =
  sqrt (mag2 v)

let dist v1 v2 =
  mag (diff v1 v2)

let div v s =
  { x = v.x /. s ;
    y = v.y /. s ;
    z = v.z /. s }

let mult v s =
  { x = v.x *. s ;
    y = v.y *. s ;
    z = v.z *. s }

let normalize v =
  div v (mag v)
