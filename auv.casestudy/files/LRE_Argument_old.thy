theory LRE_Argument_old
	imports "Isabelle_SACM.Isa_SACM" 	
begin 
	Claim LRE.C1 ‹ LRE state space ›
	Claim LRE.G1 ‹ LRE is acceptably safe to operate ›
	Claim LRE.G8 ‹ LRE behaviour satisfies defined Requirement R1 ›
	Claim LRE.G9 ‹ LRE behaviour satisfies Requirement R2 ›
	Claim LRE.G7 ‹ LRE behaviour is acceptably safe ›
	Claim LRE.G2 ‹ LRE does not collide with static obstacle ›
	Claim LRE.G4 ‹ LRE obtains accurate readings of static obstacles ›
	Claim LRE.G5 ‹ LRE accurately determines it is in OPEZ based on sensor readings ›
	Claim LRE.G6 ‹ LRE behaves correctly to avoid closest static obstacle ›
	Claim LRE.G3 needsSupport ‹ LRE does not collide with dynamic obstacle ›
	ArtifactReference LRE.Sn4 ‹LRE behaviour model validation against R1›
	ArtifactReference LRE.Sn5 ‹LRE behaviour model validation against R2›
	ArtifactReference LRE.Sn2 ‹Testing›
	ArtifactReference LRE.Sn3 ‹Formal verification›
	Inference Name src ‹{@{ClaimLRE.G2}, @{ClaimLRE.G2}, @{ClaimLRE.G3}}› tgt ‹{@{Claim LRE.G1}}›
		‹ @{Claim LRE.G1} is supported by @{ClaimLRE.G2}, @{ClaimLRE.G2}, @{ClaimLRE.G3}.›
	Inference Name src ‹{@{ClaimLRE.G8}, @{ClaimLRE.G8}, @{ClaimLRE.G9}}› tgt ‹{@{Claim LRE.G7}}›
		‹ @{Claim LRE.G7} is supported by @{ClaimLRE.G8}, @{ClaimLRE.G8}, @{ClaimLRE.G9}.›
	Inference Name src ‹{@{Claim LRE.S1}}› tgt ‹{@{Claim LRE.G1}}›
		‹ @{Claim LRE.G1} is supported by @{Claim LRE.S1}.›
	Inference Name src ‹{@{ArtifactReference LRE.Sn4}}› tgt ‹{@{Claim LRE.G8}}›
		‹ @{Claim LRE.G8} is supported by @{ArtifactReference LRE.Sn4}.›
	Inference Name src ‹{@{ArtifactReference LRE.Sn5}}› tgt ‹{@{Claim LRE.G9}}›
		‹ @{Claim LRE.G9} is supported by @{ArtifactReference LRE.Sn5}.›
	Inference Name src ‹{@{Claim LRE.S2}}› tgt ‹{@{Claim LRE.G7}}›
		‹ @{Claim LRE.G7} is supported by @{Claim LRE.S2}.›
	Inference Name src ‹{@{Claim LRE.G8}}› tgt ‹{@{Claim LRE.S2}}›
		‹ @{Claim LRE.S2} is supported by @{Claim LRE.G8}.›
	Inference Name src ‹{@{Claim LRE.G9}}› tgt ‹{@{Claim LRE.S2}}›
		‹ @{Claim LRE.S2} is supported by @{Claim LRE.G9}.›
	Inference Name src ‹{@{Claim LRE.G2}}› tgt ‹{@{Claim LRE.S1}}›
		‹ @{Claim LRE.S1} is supported by @{Claim LRE.G2}.›
	Inference Name src ‹{@{Claim LRE.G4}}› tgt ‹{@{Claim LRE.G2}}›
		‹ @{Claim LRE.G2} is supported by @{Claim LRE.G4}.›
	Inference Name src ‹{@{Claim LRE.G5}}› tgt ‹{@{Claim LRE.G2}}›
		‹ @{Claim LRE.G2} is supported by @{Claim LRE.G5}.›
	Inference Name src ‹{@{Claim LRE.G6}}› tgt ‹{@{Claim LRE.G2}}›
		‹ @{Claim LRE.G2} is supported by @{Claim LRE.G6}.›
	Inference Name src ‹{@{Claim LRE.Sn1}}› tgt ‹{@{Claim LRE.G4}}›
		‹ @{Claim LRE.G4} is supported by @{Claim LRE.Sn1}.›
	Inference Name src ‹{@{ArtifactReference LRE.Sn2}}› tgt ‹{@{Claim LRE.G5}}›
		‹ @{Claim LRE.G5} is supported by @{ArtifactReference LRE.Sn2}.›
	Inference Name src ‹{@{ArtifactReference LRE.Sn3}}› tgt ‹{@{Claim LRE.G5}}›
		‹ @{Claim LRE.G5} is supported by @{ArtifactReference LRE.Sn3}.›
	Inference Name src ‹{@{Claim LRE.G7}}› tgt ‹{@{Claim LRE.G6}}›
		‹ @{Claim LRE.G6} is supported by @{Claim LRE.G7}.›
	Inference Name src ‹{@{Claim LRE.G3}}› tgt ‹{@{Claim LRE.S1}}›
		‹ @{Claim LRE.S1} is supported by @{Claim LRE.G3}.›
	Context Name src ‹{@{Claim LRE.C1}}› tgt ‹{@{Claim LRE.G1}}›
		‹ @{Claim LRE.G1} is context for @{Claim LRE.C1}.›
end 