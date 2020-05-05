theory LRE Argument
	imports "Isabelle_SACM.Isa_SACM" 	
begin 
	Claim LRE.C1 ‹ RoboChart statemachine 
	               model formalising LRE behaviour ›
	Claim LRE.A1 assumed ‹ The LRE is not under operator control. ›
	Claim C6.a ‹ Whenever the LRE senses a 
	             close static obstacle, it advises the 
	             autopilot to switch to HCM and 
	             reduces the velocity to 0.1m/s. ›
	Claim C7.a ‹ LRE activates HCM mode 
	             if there are potential collision 
	             risks. ›
	Claim C7.d needsSupport ‹ LRE accept no navigation input from the operator ›
	Claim C7.b ‹ LRE sends command to reduce the speed to 0.1m/s ›
	Claim C7.c ‹ LRE is deadlock free ›
	Claim LRE.Validation needsSupport ‹ LRE software is validated against the formal model. ›
	Claim LRE.Appropriateness needsSupport ‹ The RoboChart language is 
	                                         an appropriate formal method 
	                                         for modelling the LRE. ›
	ArtifactReference Sn2 ‹Entry action of HCM state in RoboChart 
	                       model›
	ArtifactReference Sn3 ‹Formal 
	                       verification›
	ArtifactReference Sn1 ‹Implementing transitions in RoboChart 
	                       model›
	Inference Name src ‹{@{ClaimC7.a}, @{ClaimC7.a}, @{ClaimC7.b}, @{ClaimC7.c}, @{ClaimC7.d}, @{ClaimLRE.Validation}, @{ClaimLRE.Appropriateness}}› tgt ‹{@{Claim C6.a}}›
		‹ @{Claim C6.a} is supported by @{ClaimC7.a}, @{ClaimC7.a}, @{ClaimC7.b}, @{ClaimC7.c}, @{ClaimC7.d}, @{ClaimLRE.Validation}, @{ClaimLRE.Appropriateness}.›
	Inference Name src ‹{@{ArtifactReference Sn2}}› tgt ‹{@{Claim C7.b}}›
		‹ @{Claim C7.b} is supported by @{ArtifactReference Sn2}.›
	Inference Name src ‹{@{ArtifactReference Sn3}}› tgt ‹{@{Claim C7.c}}›
		‹ @{Claim C7.c} is supported by @{ArtifactReference Sn3}.›
	Context Name src ‹{@{Claim Sensors}}› tgt ‹{@{Claim C6.a}}›
		‹ @{Claim C6.a} is context for @{Claim Sensors}.›
	Context Name src ‹{@{Claim Autopilot}}› tgt ‹{@{Claim C6.a}}›
		‹ @{Claim C6.a} is context for @{Claim Autopilot}.›
	Inference Name src ‹{@{Claim LRE.S1}}› tgt ‹{@{Claim C6.a}}›
		‹ @{Claim C6.a} is supported by @{Claim LRE.S1}.›
	Inference Name src ‹{@{Claim C7.a}}› tgt ‹{@{Claim LRE.S1}}›
		‹ @{Claim LRE.S1} is supported by @{Claim C7.a}.›
	Inference Name src ‹{@{Claim C7.b}}› tgt ‹{@{Claim LRE.S1}}›
		‹ @{Claim LRE.S1} is supported by @{Claim C7.b}.›
	Inference Name src ‹{@{Claim C7.c}}› tgt ‹{@{Claim LRE.S1}}›
		‹ @{Claim LRE.S1} is supported by @{Claim C7.c}.›
	Inference Name src ‹{@{Claim C7.d}}› tgt ‹{@{Claim LRE.S1}}›
		‹ @{Claim LRE.S1} is supported by @{Claim C7.d}.›
	Context Name src ‹{@{Claim LRE.C1}}› tgt ‹{@{Claim LRE.S1}}›
		‹ @{Claim LRE.S1} is context for @{Claim LRE.C1}.›
	Inference Name src ‹{@{Claim LRE.Validation}}› tgt ‹{@{Claim LRE.S1}}›
		‹ @{Claim LRE.S1} is supported by @{Claim LRE.Validation}.›
	Inference Name src ‹{@{Claim LRE.Appropriateness}}› tgt ‹{@{Claim LRE.S1}}›
		‹ @{Claim LRE.S1} is supported by @{Claim LRE.Appropriateness}.›
	Context Name src ‹{@{Claim LRE.A1}}› tgt ‹{@{Claim C6.a}}›
		‹ @{Claim C6.a} is context for @{Claim LRE.A1}.›
	Inference Name src ‹{@{ArtifactReference Sn1}}› tgt ‹{@{Claim C7.a}}›
		‹ @{Claim C7.a} is supported by @{ArtifactReference Sn1}.›
end 