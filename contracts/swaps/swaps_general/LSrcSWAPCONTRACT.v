(* WARNING: This file is generated by Edsger, the DeepSEA compiler.
            All modification will be lost when regenerating. *)
(* Module swaps_general.LSrcSWAPCONTRACT for swaps_general.ds *)
Require Import BinPos.
Require Import DeepSpec.Runtime.
Require Import swaps_general.EdsgerIdents.
Require Import swaps_general.DataTypes.
Require Import swaps_general.DataTypeOps.
Require Import swaps_general.DataTypeProofs.


Require Import swaps_general.LayerSWAPCONTRACT.

Require Import cclib.Integers.
Require Import cclib.Coqlib.
Require Import cclib.Maps.

Require Import backend.Options.
Require Import backend.AST.
Require Import backend.phase.Clike.Language.
Require Import backend.phase.MiniC.Language.
Require Import backend.Cop.
Require Import backend.Ctypes.
Require Import backend.Compiled.
Require Import backend.Compiled.
Require Import backend.Globalenvs.
Require Import backend.Glue.


Section EdsgerGen.

Definition SwapContract_initialize_done : function := 
	mkfunction
	SwapContract_initialize_cfun.(fn_return)
	SwapContract_initialize_cfun.(fn_params)
	SwapContract_initialize_cfun.(fn_temps)
	SwapContract_initialize_cfun.(fn_body).

Definition SwapContract_unlock_done : function := 
	mkfunction
	SwapContract_unlock_cfun.(fn_return)
	SwapContract_unlock_cfun.(fn_params)
	SwapContract_unlock_cfun.(fn_temps)
	SwapContract_unlock_cfun.(fn_body).

Definition SwapContract_claim_done : function := 
	mkfunction
	SwapContract_claim_cfun.(fn_return)
	SwapContract_claim_cfun.(fn_params)
	SwapContract_claim_cfun.(fn_temps)
	SwapContract_claim_cfun.(fn_body).

Definition SwapContract_refund_done : function := 
	mkfunction
	SwapContract_refund_cfun.(fn_return)
	SwapContract_refund_cfun.(fn_params)
	SwapContract_refund_cfun.(fn_temps)
	SwapContract_refund_cfun.(fn_body).

Definition ge : genv := new_genv (
	(var_SwapContract__assetAmount_ident, unpair_ty tint_U)::
	(var_SwapContract__timelocks_ident, unpair_ty tarray_int_AR1_Z)::
	(var_SwapContract__hashlocks_ident, unpair_ty tarray_int_AR1_hashvalue)::
	(var_SwapContract__party_ident, unpair_ty tint_U)::
	(var_SwapContract__counterparty_ident, unpair_ty tint_U)::
	(var_SwapContract__start_ident, unpair_ty tint_U)::
	(var_SwapContract__delta_ident, unpair_ty tint_U)::
	(var_SwapContract__unlocked_ident, unpair_ty tarray_int_AR1_bool)::
	(var_SwapContract__ended_ident, unpair_ty tint_bool)::
	(var_SwapContract__canrefund_ident, unpair_ty tint_bool)::nil)
	nil
	(
	(Int.repr 1621285444, SwapContract_initialize_done):: (* 0x60a2da44 = "initialize(uint256,uint256,uint256,uint256)" *)

	(Int.repr 1543166756, SwapContract_unlock_done):: (* 0x5bfadb24 = "unlock(uint256,uint256)" *)

	(Int.repr 1316084013, SwapContract_claim_done):: (* 0x4e71d92d = "claim()" *)

	(Int.repr 1494096611, SwapContract_refund_done):: (* 0x590e1ae3 = "refund()" *)
nil)
	None.


End EdsgerGen.

(*change into extract directory*)
Cd "/Users/lemontree/Dropbox/Year4-2/CPSC528/DeepSEA/contracts/swaps/swaps_general/extraction".

(* Avoid name clashes *)
Extraction Blacklist List String Int.

Separate Extraction
    positive global_abstract_data_type  (* This line forces Coq to generate some files even if they are not used, to make the makefile work correctly. *)
    Glue.full_compile_genv
    ge.
