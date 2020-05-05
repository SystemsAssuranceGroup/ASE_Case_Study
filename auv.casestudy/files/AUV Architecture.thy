theory AUV Architecture
	imports "Isabelle_SACM.Isa_SACM" 	
begin 
	Inference Name src ‹{@{Claim LRE Argument}}› tgt ‹{@{Claim AUV System}}›
		‹ @{Claim AUV System} is supported by @{Claim LRE Argument}.›
	Inference Name src ‹{@{Claim Autopilot Argument}}› tgt ‹{@{Claim AUV System}}›
		‹ @{Claim AUV System} is supported by @{Claim Autopilot Argument}.›
	Inference Name src ‹{@{Claim Platform Argument}}› tgt ‹{@{Claim AUV System}}›
		‹ @{Claim AUV System} is supported by @{Claim Platform Argument}.›
	Inference Name src ‹{@{Claim Operator Argument}}› tgt ‹{@{Claim AUV System}}›
		‹ @{Claim AUV System} is supported by @{Claim Operator Argument}.›
end 