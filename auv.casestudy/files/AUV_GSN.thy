theory AUV_GSN
	imports "Isabelle_SACM.Isa_SACM" 	
begin 
	Claim C1 ‹ The system is acceptably safe ›
	Claim C2 ‹ All identified hazards have been mitigated ›
	Claim C3 ‹ Hazard H1 is sufficiently mitigated ›
	Claim C4 needsSupport ‹ Hazard H2 is sufficiently mitigated ›
	Claim Hazard_Log ‹ The Hazard Log ›
	ArtifactReference FV1 ‹Formal Verification›
	Inference SB2 src ‹{@{ClaimC3}, @{ClaimC4}}› tgt ‹{@{Claim C2}}›
		‹ @{Claim C2} is supported by @{ClaimC3}, @{ClaimC4}.›
	Inference SB1 src ‹{@{Claim C2}}› tgt ‹{@{Claim C1}}›
		‹ @{Claim C1} is supported by @{Claim C2}.›
	Context IC1 src ‹{@{Claim Hazard_Log}}› tgt ‹{@{Claim C2}}›
		‹ @{Claim C2} is context for @{Claim Hazard_Log}.›
	Inference SB2 src ‹{@{Claim I1}}› tgt ‹{@{Claim C2}}›
		‹ @{Claim C2} is supported by @{Claim I1}.›
	Inference SB3 src ‹{@{Claim C3}}› tgt ‹{@{Claim I1}}›
		‹ @{Claim I1} is supported by @{Claim C3}.›
	Inference SB5 src ‹{@{ArtifactReference FV1}}› tgt ‹{@{Claim C3}}›
		‹ @{Claim C3} is supported by @{ArtifactReference FV1}.›
	Inference SB4 src ‹{@{Claim C4}}› tgt ‹{@{Claim I1}}›
		‹ @{Claim I1} is supported by @{Claim C4}.›
end 