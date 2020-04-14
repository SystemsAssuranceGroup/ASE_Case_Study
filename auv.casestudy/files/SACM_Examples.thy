theory SACM_Examples
  imports "Isabelle_SACM.Isa_SACM"
begin

subsection ‹ Hazard Logs ›

text ‹ Here, we create a new (SACM) ``categories'' for Hazard and Hazard Logs. We are effectively
  extending our meta-model, potentially using bits defined in an ecore meta-model. ›

doc_class Hazard = "Artifact" +
  name :: string

doc_class HazardLog = "Artifact" +
  hazards :: "Hazard set"

doc_class FormalHazard = Hazard +
  condition :: "term"

text ‹ Here, we are creating new (SACM) ``terms'' that refer to a particular hazards. ›

text*[H1::FormalHazard, condition="@{term ‹heat > 100›}"] ‹›
text*[H2::Hazard] ‹›

text*[Hazard_Log::HazardLog, hazards="{@{docitem ''H1''}, @{docitem ''H2''}}"] ‹›
abbreviation "Hazard_Log ≡ ''Hazard_Log''"

theorem vc1: True by simp

subsection ‹ Hazard Mitigation Argument ›

print_doc_items

ArtifactReference ar_Hazard_Log artifacts "{@{docitem Hazard_Log}}"

Artifact FV1 ‹ Formal Verification Results: @{thm vc1} ›

ArtifactReference ar_FV1 artifacts "{@{docitem ‹FV1›}}"

Claim C1 ‹ The system is acceptably safe. ›

Claim C2 ‹ All identified hazards have 
  been sufficiently mitigated. ›

Inference I1 src ‹{@{Claim C2}}› tgt ‹{@{Claim C1}}›
  ‹ @{Claim C1} is supported by @{Claim C2}. ›

Context ac1 
  src ‹{@{Artifact Hazard_Log}}› tgt ‹{@{Claim C2}}›
  ‹ The Hazard Log @{HazardLog Hazard_Log} 
    is context for @{Claim C2} ›

Claim C3 ‹ @{Hazard H1} is sufficiently mitigated. ›

Evidence E1 
  src ‹{@{Artifact FV1}}› tgt "{@{Claim C3}}"
  ‹ Formal verification result @{Artifact FV1} 
    is evidence for @{Claim C3}. ›

Claim C4 needsSupport 
  ‹ @{Hazard H2} is sufficiently mitigated. ›

Artifact T1 ‹ Test Results ›

ArtifactReference ar_T1 artifacts "{@{docitem T1}}"

Evidence E2 src "{@{ArtifactReference ar_T1}}" tgt "{@{Claim C4}}"

Inference I2 src "{@{Claim C3}, @{Claim C4}}" tgt "{@{Claim C2}}"

print_doc_items

subsection ‹ DOF Queries ›

― ‹ Retrieve the term that characterises @{Claim C1} ›
ML ‹ DOF_core.get_value_global "C1" @{theory} ›

― ‹ Retrieve the term assigned to the @{term source} attribute in @{AssertedInference I1} ›
ML ‹ AttributeAccess.compute_attr_access (Context.Theory @{theory}) "source" "I1" @{here} @{here} ›

― ‹ Above, using an ML antiquotation ›
ML ‹ YXML.content_of (Syntax.string_of_term_global @{theory} @{docitem_attribute source :: I1}) ›

text ‹ How can we generate and prove proof obligations for OCL constraints on a meta-model? ›

(* Domain model, DFRS, Grammatico *)

end