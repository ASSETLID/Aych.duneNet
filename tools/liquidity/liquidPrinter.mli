(****************************************************************************)
(*                               Liquidity                                  *)
(*                                                                          *)
(*                  Copyright (C) 2017-2019 OCamlPro SAS                    *)
(*                                                                          *)
(*                    Authors: Fabrice Le Fessant                           *)
(*                             Alain Mebsout                                *)
(*                             David Declerck                               *)
(*                                                                          *)
(*  This program is free software: you can redistribute it and/or modify    *)
(*  it under the terms of the GNU General Public License as published by    *)
(*  the Free Software Foundation, either version 3 of the License, or       *)
(*  (at your option) any later version.                                     *)
(*                                                                          *)
(*  This program is distributed in the hope that it will be useful,         *)
(*  but WITHOUT ANY WARRANTY; without even the implied warranty of          *)
(*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           *)
(*  GNU General Public License for more details.                            *)
(*                                                                          *)
(*  You should have received a copy of the GNU General Public License       *)
(*  along with this program.  If not, see <https://www.gnu.org/licenses/>.  *)
(****************************************************************************)

(** Pretty-printing of Liquidity and Michelson, code and values *)

open LiquidTypes


module Syntax : sig
  val string_of_structure :
    Parsetree.structure -> (string * Location.t) list -> string
  val string_of_expression : Parsetree.expression -> string
  val string_of_core_type : Parsetree.core_type -> string
end

(** {2 Pretty-printing of Liquidity} *)

module Liquid : sig
  (** Pretty-print Liquidity type *)
  val string_of_type : datatype -> string
  (** Pretty-print Liquidity constant *)
  val string_of_const : (datatype, 'a) exp const -> string
  (** Pretty-print Liquidity contract *)
  val string_of_contract : typed_contract -> string
  (** Pretty-print typed Liquidity code *)
  val string_of_code : (datatype, 'a) exp -> string
end

(** {2 Pretty-printing of Liquidity terms for debugging} *)

module LiquidDebug : sig
  (** Pretty-print Liquidity type *)
  val string_of_type : datatype -> string
  (** Pretty-print Liquidity constant *)
  val string_of_const : ('a, 'b) exp const -> string
  (** Pretty-print Liquidity contract *)
  val string_of_contract : ?debug:bool -> ('a, 'b) exp contract -> string
  (** Pretty-print Liquidity typed contract *)
  val string_of_contract_types : ?debug:bool -> (datatype, 'a) exp contract -> string
  (** Pretty-print typed Liquidity code *)
  val string_of_code : ?debug:bool -> ('a, 'b) exp -> string
  (** Pretty-print Liquidity typed code *)
  val string_of_code_types : ?debug:bool -> typed_exp -> string
end

(** {2 Pretty-printing of Michelson } *)

module Michelson : sig
  (** Pretty-print Michelson type *)
  val string_of_type : datatype -> string
  (** Pretty-print Michelson type on a single line *)
  val line_of_type : datatype -> string
  (** Pretty-print Michelson constant *)
  val string_of_const : michelson_exp const -> string
  (** Pretty-print Michelson constant on a single line *)
  val line_of_const : michelson_exp const -> string
  (** Pretty-print intermediate Michelson contract *)
  val string_of_contract : michelson_contract -> string
  (** Pretty-print intermediate Michelson contract on a single line *)
  val line_of_contract : michelson_contract -> string
  (** Pretty-print intermediate Michelson code *)
  val string_of_code : michelson_exp -> string
  (** Pretty-print intermediate Michelson code on a single line *)
  val line_of_code : michelson_exp -> string
  (** Pretty-print actual Michelson contract *)
  val string_of_loc_michelson : loc_michelson -> string
  (** Pretty-print actual Michelson contract on a single line *)
  val line_of_loc_michelson : loc_michelson -> string
  val string_of_loc_michelson_const : loc_michelson const -> string
end

(** Print a decompiled node (for debugging purposes) *)
val string_of_node : node -> string
