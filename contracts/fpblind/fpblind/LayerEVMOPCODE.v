(* WARNING: This file is generated by Edsger, the DeepSEA compiler.
            All modification will be lost when regenerating. *)
(* Module fpblind.LayerEVMOPCODE for fpblind.ds *)
Require Import BinPos.
Require Import DeepSpec.Runtime.
Require Import fpblind.EdsgerIdents.
Require Import fpblind.DataTypes.
Require Import fpblind.DataTypeOps.
Require Import fpblind.DataTypeProofs.
(*Require Import liblayers.compcertx.MakeProgram.
Require Import liblayers.compcertx.MemWithData.*)
Require Import DeepSpec.lib.Monad.Monad.
Require Import DeepSpec.lib.Monad.MonadState.
Require Import DeepSpec.lib.Monad.StateMonad.
Require Import DeepSpec.lib.Monad.OptionMonad.
Require Import DeepSpec.lib.Monad.MonadZero.
Require Import DeepSpec.core.SynthesisStmt.
Require Import backend.MachineModel.
Existing Instance MonadState_DS.
Existing Instance MonadZero_DS.

Section EdsgerGen.



Context {memModelOps : MemoryModelOps mem}.
Instance GlobalLayerSpec : LayerSpecClass := {
  memModelOps := memModelOps;                                            
  GetHighData := global_abstract_data_type 
}.


Context`{global_abdata : !GlobalAbData init_global_abstract_data global_low_level_invariant}.
Definition EVMOPCODE_kernel_mode (abd : global_abstract_data_type) := True.
Global Arguments EVMOPCODE_kernel_mode / abd.

Class Layer_EVMOPCODE_Context_prf  := {
  (* ensuring global empty data matches those in the object definitions *)
  EVMOPCODE_init__events_eq : _events init_global_abstract_data = nil
}.
Context`{CTXT_prf : !Layer_EVMOPCODE_Context_prf}.

Instance EVMOPCODE_data_ops : CompatDataOps global_abstract_data_type := {
  empty_data := init_global_abstract_data;
  high_level_invariant d := True;
  (* low_level_invariant := global_low_level_invariant; *) (* Omitted in Ethereum backend. 
  kernel_mode d := EVMOPCODE_kernel_mode d *)
}.

Instance EVMOPCODE_data : CompatData global_abstract_data_type := {
  (* low_level_invariant_incr := AbData_low_level_invariant_incr;
  empty_data_low_level_invariant := AbData_empty_data_low_level_invariant; *) (* Omitted in Ethereum backend. *)
  empty_data_high_level_invariant := I
}.

Instance EVMOPCODE_overlay_spec : OverlaySpecClass := {
  (*cdataOpsHigh := EVMOPCODE_data_ops;
  cdataHigh := EVMOPCODE_data *)
}.



Instance EVMOPCODE_underlay_spec : UnderlaySpecClass := {
  cdataOpsLow := @BuiltinBase_data_ops GlobalLayerSpec init_global_abstract_data;
  cdataLow := BuiltinBase_data;
  (*GetLowLayer := BuiltinBase_Layer *)
}.


Section OBJECT_EVMOpcode_DEFINITION.
  Context`{HM : !HyperMem}.

  (* Object variables *)
  Definition EVMOpcode__events_var := {|
    ltype_tp_marker := tint_list_Transfer;

    ltype_ident := Values.Iident 99%positive;
    ltype_ghost := true;

    ltype_get := _events;
    ltype_set := update__events;

    ltype_set_ocond := otrue1;
    ltype_get_extra_ocond := otrue1
  |}.

  Definition EVMOpcode_transfer := {|
    FC_ident_start := BuiltinBase_local_ident_start;
    FC_params := (cons (* toaddr : *) int_U_pair (cons (* much : *) int_U_pair nil));
    FC_returns := void_unit_pair;
    FC_body := (CClet (* e := *) 13%positive
      (CCload (LCvar EVMOpcode__events_var))
      (CCsequence
        (CCrespec_opt
          (AList.set 13%positive int_list_Transfer_pair (AList.set 12%positive int_U_pair (AList.set 11%positive int_U_pair (@AList.empty hyper_type_pair))))
          (CCpanic tvoid_unit)
          (fun se => @bind _ (@Monad_DS GlobalLayerSpec) _ _ get (fun d =>
          let a := (fun toaddr much e => {| _amount := much; _to := toaddr|} :: e)
               (SpecTree.get 12%positive (* much *) se)
               (SpecTree.get 11%positive (* toaddr *) se)
               (SpecTree.get 13%positive (* e *) se) in
put (EVMOpcode__events_var.(ltype_set) a d)
           )))
        (CCyield (ECconst_int256 tvoid_unit tt Int256.zero))))
  |}.
  Lemma EVMOpcode_transfer_wf
      : synth_func_wellformed EVMOpcode_transfer.
  Proof. solve_wellformed. Defined.
  Definition EVMOpcode_transfer_opt :int256 -> int256 ->  machine_env -> DS unit  := 
  Eval cbv -[Int256.modulus zeq zle zlt Z.iter Z.le Z.lt Z.gt Z.ge Z.eqb Z.leb Z.ltb Z.geb Z.gtb Z.mul Z.div Z.modulo Z.add Z.sub Z.shiftl Z.shiftr Z.lxor Z.land Z.lor Int256.add Int256.sub Int256.mul Int256.modu Int256.divu Int256.cmpu Int256.not Int256.and Int256.or Int256.xor Int256.shl Int256.shru Ziteri Z.of_nat List.length HyperType.Hquery0 hashvalue_eqb
             ret bind mzero get put gets guard modify
             GetHighData is_true bool_dec ZMap.get ZMap.set Int256Tree.get Int256Tree.set
             
             _events update__events]
  in synth_func_spec_opt EVMOpcode_transfer EVMOpcode_transfer_wf.
  Definition EVMOpcode_transfer_spec_hlist_opt args :=
    @apply_param_func EVMOpcode_transfer.(FC_params) _
                      (EVMOpcode_transfer_opt) args.
  Definition EVMOpcode_transfer_spec_cond :=
   (*Eval cbv -[Int256.modulus zeq zle zlt Z.iter Z.le Z.lt Z.gt Z.ge Z.eqb Z.leb Z.ltb Z.geb Z.gtb Z.mul Z.div Z.modulo Z.add Z.sub Z.shiftl Z.shiftr Z.lxor Z.land Z.lor Int256.add Int256.sub Int256.mul Int256.modu Int256.divu Int256.cmpu Int256.not Int256.and Int256.or Int256.xor Int256.shl Int256.shru Ziteri Z.of_nat List.length HyperType.Hquery0 hashvalue_eqb
             ret bind mzero get put gets guard modify runStateT evalStateT execStateT
             is_true bool_dec ZMap.get ZMap.set Int256Tree.get Int256Tree.set hlist_hd
             omap2 oand2 oimply2 oabsorption2 hlist_param_func (* SpecTree.get SpecTree.get_eq SpecTree.set *)
             
             _events update__events]
  in *)
  synth_func_spec_cond EVMOpcode_transfer EVMOpcode_transfer_wf.

  Definition EVMOpcode_transfer_prim := {|
    PRIMident := ident_EVMOpcode_transfer;
    (* PRIMcc := AST.cc_default; *)
    PRIMghost := false;
    PRIMpure := false;
    PRIMargt_marker := EVMOpcode_transfer.(FC_params);
    PRIMret_marker := EVMOpcode_transfer.(FC_returns);
    PRIMcond := EVMOpcode_transfer_spec_cond;
    (* PRIMsem := EVMOpcode_transfer_spec_hlist; *)
    PRIMsem_opt := EVMOpcode_transfer_spec_hlist_opt
  |}.

  Lemma EVMOpcode_transfer_spec_hlist_opt_eq :
    EVMOpcode_transfer_spec_hlist_opt =
    fun args => apply_param_func
      (synth_func_spec_opt EVMOpcode_transfer EVMOpcode_transfer_wf)
      args.
  Proof.
    (*cbv -[Int256.modulus zeq zle zlt Z.iter Z.le Z.lt Z.gt Z.ge Z.eqb Z.leb Z.ltb Z.geb Z.gtb Z.mul Z.div Z.modulo Z.add Z.sub Z.shiftl Z.shiftr Z.lxor Z.land Z.lor Int256.add Int256.sub Int256.mul Int256.modu Int256.divu Int256.cmpu Int256.not Int256.and Int256.or Int256.xor Int256.shl Int256.shru Ziteri Z.of_nat List.length HyperType.Hquery0 hashvalue_eqb
             ret bind mzero get put gets guard modify
             GetHighData is_true bool_dec ZMap.get ZMap.set Int256Tree.get Int256Tree.set
             
             _events update__events]. *)
     reflexivity. 
  Qed.
  Definition EVMOpcode_transfer_cfun :=
  Eval cbv in synth_func_func EVMOpcode_transfer.

  Definition EVMOpcode_transfer_cond  a0 a1 me d  :=
  Eval cbv -[Int256.modulus zeq zle zlt Z.iter Z.le Z.lt Z.gt Z.ge Z.eqb Z.leb Z.ltb Z.geb Z.gtb Z.mul Z.div Z.modulo Z.add Z.sub Z.shiftl Z.shiftr Z.lxor Z.land Z.lor Int256.add Int256.sub Int256.mul Int256.modu Int256.divu Int256.cmpu Int256.not Int256.and Int256.or Int256.xor Int256.shl Int256.shru Ziteri Z.of_nat List.length HyperType.Hquery0 hashvalue_eqb
             ret bind mzero get put gets guard modify runStateT evalStateT execStateT
             is_true bool_dec ZMap.get ZMap.set Int256Tree.get Int256Tree.set hlist_hd
             
             _events update__events]
    in
    ht_ft_cond a0 -> ht_valid_ft_cond a0 ->
    ht_ft_cond a1 -> ht_valid_ft_cond a1 ->
    high_level_invariant d ->
    synth_func_cond EVMOpcode_transfer EVMOpcode_transfer_wf
								      a0 a1 me d.
  
  Lemma EVMOpcode_transfer_cond_eq : forall  a0 a1 me d, 
    EVMOpcode_transfer_cond  a0 a1 me d ->
    ht_ft_cond a0 -> ht_valid_ft_cond a0 ->
    ht_ft_cond a1 -> ht_valid_ft_cond a1 ->
    high_level_invariant d ->
    synth_func_cond EVMOpcode_transfer EVMOpcode_transfer_wf  a0 a1 me d.
    Proof.
      intros  a0 a1 me d H_cond.
      cbv -[Int256.modulus zeq zle zlt Z.iter Z.le Z.lt Z.gt Z.ge Z.eqb Z.leb Z.ltb Z.geb Z.gtb Z.mul Z.div Z.modulo Z.add Z.sub Z.shiftl Z.shiftr Z.lxor Z.land Z.lor Int256.add Int256.sub Int256.mul Int256.modu Int256.divu Int256.cmpu Int256.not Int256.and Int256.or Int256.xor Int256.shl Int256.shru Ziteri Z.of_nat List.length HyperType.Hquery0 hashvalue_eqb
             ret bind mzero get put gets guard modify runStateT evalStateT execStateT
             is_true bool_dec ZMap.get ZMap.set Int256Tree.get Int256Tree.set hlist_hd
             
             _events update__events].
       exact H_cond.
    Qed.

  Definition EVMOpcode_transfer_obligation  a0 a1 me d  :=
  Eval cbv -[Int256.modulus zeq zle zlt Z.iter Z.le Z.lt Z.gt Z.ge Z.eqb Z.leb Z.ltb Z.geb Z.gtb Z.mul Z.div Z.modulo Z.add Z.sub Z.shiftl Z.shiftr Z.lxor Z.land Z.lor Int256.add Int256.sub Int256.mul Int256.modu Int256.divu Int256.cmpu Int256.not Int256.and Int256.or Int256.xor Int256.shl Int256.shru Ziteri Z.of_nat List.length HyperType.Hquery0 hashvalue_eqb
             ret bind mzero get put gets guard modify runStateT evalStateT execStateT
             is_true bool_dec ZMap.get ZMap.set Int256Tree.get Int256Tree.set hlist_hd
             
             _events update__events]
    in
    ht_ft_cond a0 -> ht_valid_ft_cond a0 ->
    ht_ft_cond a1 -> ht_valid_ft_cond a1 ->
    high_level_invariant d ->
    synth_func_obligation EVMOpcode_transfer EVMOpcode_transfer_wf
								      a0 a1 me d.
  
  Lemma EVMOpcode_transfer_obligation_eq : forall  a0 a1 me d, 
    EVMOpcode_transfer_obligation  a0 a1 me d ->
    ht_ft_cond a0 -> ht_valid_ft_cond a0 ->
    ht_ft_cond a1 -> ht_valid_ft_cond a1 ->
    high_level_invariant d ->
    synth_func_obligation EVMOpcode_transfer EVMOpcode_transfer_wf  a0 a1 me d.
    Proof.
      intros  a0 a1 me d H_cond.
      cbv -[Int256.modulus zeq zle zlt Z.iter Z.le Z.lt Z.gt Z.ge Z.eqb Z.leb Z.ltb Z.geb Z.gtb Z.mul Z.div Z.modulo Z.add Z.sub Z.shiftl Z.shiftr Z.lxor Z.land Z.lor Int256.add Int256.sub Int256.mul Int256.modu Int256.divu Int256.cmpu Int256.not Int256.and Int256.or Int256.xor Int256.shl Int256.shru Ziteri Z.of_nat List.length HyperType.Hquery0 hashvalue_eqb
             ret bind mzero get put gets guard modify runStateT evalStateT execStateT
             is_true bool_dec ZMap.get ZMap.set Int256Tree.get Int256Tree.set hlist_hd
             
             _events update__events].
       exact H_cond.
    Qed.

  Definition EVMOpcode_transfer_spec :=
  Eval cbv [sf_mem sf_return fst snd EVMOpcode_transfer_opt] in
    fun  a0 a1 me => execStateT (EVMOpcode_transfer_opt a0 a1 me).
  Lemma EVMOpcode_transfer_spec_eq :
    EVMOpcode_transfer_spec =
    fun  a0 a1 me => execStateT (synth_func_spec_opt EVMOpcode_transfer EVMOpcode_transfer_wf a0 a1 me).
  Proof.
    cbv -[Int256.modulus zeq zle zlt Z.iter Z.le Z.lt Z.gt Z.ge Z.eqb Z.leb Z.ltb Z.geb Z.gtb Z.mul Z.div Z.modulo Z.add Z.sub Z.shiftl Z.shiftr Z.lxor Z.land Z.lor Int256.add Int256.sub Int256.mul Int256.modu Int256.divu Int256.cmpu Int256.not Int256.and Int256.or Int256.xor Int256.shl Int256.shru Ziteri Z.of_nat List.length HyperType.Hquery0 hashvalue_eqb
          ret bind mzero get put gets guard modify
          GetHighData is_true bool_dec ZMap.get ZMap.set Int256Tree.get Int256Tree.set
          
          _events update__events].
    reflexivity.
  Qed.

Global Opaque EVMOpcode_transfer_opt.
End OBJECT_EVMOpcode_DEFINITION.
(* (*Temporarily omitted in the Ethereum version.*)

Section LAYER_EVMOPCODE_DEFINITION.
  Definition EVMOPCODE_evm_transfer_prim := EVMOpcode_transfer_prim.

  Class EVMOPCODE_preserves_invariants := {
    EVMOPCODE_EVMOpcode_transfer_preserves_invariants :>
      CompatGenSem.PreservesInvariants EVMOpcode_transfer_spec
  }.
  Context`{EVMOPCODE_pres_inv : !EVMOPCODE_preserves_invariants}.

  Definition EVMOPCODE_Layer : CompatLayerDef.compatlayer GetHighDataX :=
    transfer ↦ CompatGenSem.gensem EVMOpcode_transfer_spec.
End LAYER_EVMOPCODE_DEFINITION.
*)
End EdsgerGen.
