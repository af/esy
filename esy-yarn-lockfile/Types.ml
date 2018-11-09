open Ppx_sexp_conv_lib.Conv

type token =
  | NUMBER of float
  | IDENTIFIER of string
  | TRUE
  | FALSE
  | STRING of string
  | COLON
  | NEWLINE of int
  | INDENT
  | DEDENT
  | LI
  | EOF
  [@@deriving (show, eq, sexp)]

type t =
  | Mapping of (string * t) list
  | Sequence of t list
  | Scalar of scalar
  [@@deriving (show, eq, sexp)]

and scalar =
  | Number of float
  | String of string
  | Boolean of bool

exception SyntaxError of string
