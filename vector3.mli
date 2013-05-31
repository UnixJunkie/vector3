(** {2 3D vectors} *)

type t = { x : float; y : float; z : float; }

(** {4 Constructors} *)

val origin : t

val make : float -> float -> float -> t

val of_triplet : float * float * float -> t
val of_string : string -> t

(** {4 Export to other types} *)

val to_triplet : t -> float * float * float
val to_string : t -> string

(** {4 Operations} *)

val dot : t -> t -> float
val cross : t -> t -> t
val diff : t -> t -> t
val add : t -> t -> t
val mag2 : t -> float
val mag : t -> float
val angle : t -> t -> float
val dist : t -> t -> float
val div : t -> float -> t
val mult : t -> float -> t
val normalize : t -> t
