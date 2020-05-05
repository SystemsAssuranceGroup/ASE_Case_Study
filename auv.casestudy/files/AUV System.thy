theory AUV System
	imports "Isabelle_SACM.Isa_SACM" 	
begin 
	Claim Context1 ‹ Defined AUV operation area ›
	Claim Context2 ‹ Hazard log ›
	Claim Context 4 ‹ OPEZ  definition ›
	Claim Context3 ‹ Definition of static obstacle and dynamic obstacle ›
	Claim C1 ‹ AUV system operates safely ›
	Claim C2.a ‹ Hazard H1 'AUV collides with obstacles' is mitigated ›
	Claim C2.b ‹ Hazard H2 'AUV causes splash' is mitigated. ›
	Claim C4.a ‹ SR1-1 No collision shall occur to static obstacles ›
	Claim C4.b needsSupport ‹ SR1-2 No collision shall occur with dynamic obstacles ›
	Claim C5.a ‹ SR1-1-1The velocity shall be reduced sufficiently when the collision risk is high ›
	Claim C3.b needsSupport ‹ SR2- AUV does not enter OPEZ zone ›
	Claim C3.a ‹ SR1-AUV system does not cause collision with obstacles ›
	Claim C3.b ‹ SR-2 operators does not cause collision with obstacles ›
	Claim C5.b needsSupport ‹ SR1-1-2 Navigation shall avoid the path with high collision risk ›
	Inference Name src ‹{@{ClaimC2.b}, @{ClaimC2.b}, @{ClaimC2.a}}› tgt ‹{@{Claim C1}}›
		‹ @{Claim C1} is supported by @{ClaimC2.b}, @{ClaimC2.b}, @{ClaimC2.a}.›
	Inference Name src ‹{@{ClaimC4.a}, @{ClaimC4.a}, @{ClaimC4.b}}› tgt ‹{@{Claim C3.a}}›
		‹ @{Claim C3.a} is supported by @{ClaimC4.a}, @{ClaimC4.a}, @{ClaimC4.b}.›
	Inference Name src ‹{@{ClaimAutopilot_Argument}, @{ClaimAutopilot_Argument}, @{ClaimSensor_Argument}, @{ClaimActuator_Argument}, @{ClaimC6.a}}› tgt ‹{@{Claim C5.a}}›
		‹ @{Claim C5.a} is supported by @{ClaimAutopilot_Argument}, @{ClaimAutopilot_Argument}, @{ClaimSensor_Argument}, @{ClaimActuator_Argument}, @{ClaimC6.a}.›
	Inference Name src ‹{@{ClaimC3.b}, @{ClaimC3.b}}› tgt ‹{@{Claim C2.b}}›
		‹ @{Claim C2.b} is supported by @{ClaimC3.b}, @{ClaimC3.b}.›
	Inference Name src ‹{@{ClaimC3.a}, @{ClaimC3.a}, @{ClaimC3.b}}› tgt ‹{@{Claim C2.a}}›
		‹ @{Claim C2.a} is supported by @{ClaimC3.a}, @{ClaimC3.a}, @{ClaimC3.b}.›
	Context Name src ‹{@{Claim Context1}}› tgt ‹{@{Claim C1}}›
		‹ @{Claim C1} is context for @{Claim Context1}.›
	Inference Name src ‹{@{Claim S1}}› tgt ‹{@{Claim C1}}›
		‹ @{Claim C1} is supported by @{Claim S1}.›
	Inference Name src ‹{@{Claim C2.b}}› tgt ‹{@{Claim S1}}›
		‹ @{Claim S1} is supported by @{Claim C2.b}.›
	Inference Name src ‹{@{Claim C2.a}}› tgt ‹{@{Claim S1}}›
		‹ @{Claim S1} is supported by @{Claim C2.a}.›
	Inference Name src ‹{@{Claim C4.a}}› tgt ‹{@{Claim S3}}›
		‹ @{Claim S3} is supported by @{Claim C4.a}.›
	Inference Name src ‹{@{Claim C4.b}}› tgt ‹{@{Claim S3}}›
		‹ @{Claim S3} is supported by @{Claim C4.b}.›
	Inference Name src ‹{@{Claim S4.a }}› tgt ‹{@{Claim C5.a}}›
		‹ @{Claim C5.a} is supported by @{Claim S4.a }.›
	Context Name src ‹{@{Claim Context2}}› tgt ‹{@{Claim S1}}›
		‹ @{Claim S1} is context for @{Claim Context2}.›
	Inference Name src ‹{@{Claim S2.b}}› tgt ‹{@{Claim C2.b}}›
		‹ @{Claim C2.b} is supported by @{Claim S2.b}.›
	Inference Name src ‹{@{Claim C3.b}}› tgt ‹{@{Claim S2.b}}›
		‹ @{Claim S2.b} is supported by @{Claim C3.b}.›
	Context Name src ‹{@{Claim Context 4}}› tgt ‹{@{Claim C3.b}}›
		‹ @{Claim C3.b} is context for @{Claim Context 4}.›
	Inference Name src ‹{@{Claim S2.a}}› tgt ‹{@{Claim C2.a}}›
		‹ @{Claim C2.a} is supported by @{Claim S2.a}.›
	Inference Name src ‹{@{Claim C3.a}}› tgt ‹{@{Claim S2.a}}›
		‹ @{Claim S2.a} is supported by @{Claim C3.a}.›
	Inference Name src ‹{@{Claim C3.b}}› tgt ‹{@{Claim S2.a}}›
		‹ @{Claim S2.a} is supported by @{Claim C3.b}.›
	Inference Name src ‹{@{Claim S3}}› tgt ‹{@{Claim C3.a}}›
		‹ @{Claim C3.a} is supported by @{Claim S3}.›
	Context Name src ‹{@{Claim Context3}}› tgt ‹{@{Claim C3.a}}›
		‹ @{Claim C3.a} is context for @{Claim Context3}.›
	Inference Name src ‹{@{Claim C5.a}}› tgt ‹{@{Claim C4.a}}›
		‹ @{Claim C4.a} is supported by @{Claim C5.a}.›
	Inference Name src ‹{@{Claim C5.b}}› tgt ‹{@{Claim C4.a}}›
		‹ @{Claim C4.a} is supported by @{Claim C5.b}.›
	Inference Name src ‹{@{Claim Autopilot_Argument}}› tgt ‹{@{Claim S4.a }}›
		‹ @{Claim S4.a } is supported by @{Claim Autopilot_Argument}.›
	Inference Name src ‹{@{Claim Sensor_Argument}}› tgt ‹{@{Claim S4.a }}›
		‹ @{Claim S4.a } is supported by @{Claim Sensor_Argument}.›
	Inference Name src ‹{@{Claim Actuator_Argument}}› tgt ‹{@{Claim S4.a }}›
		‹ @{Claim S4.a } is supported by @{Claim Actuator_Argument}.›
	Inference Name src ‹{@{Claim Operator_Argument}}› tgt ‹{@{Claim C3.b}}›
		‹ @{Claim C3.b} is supported by @{Claim Operator_Argument}.›
	Inference Name src ‹{@{Claim C6.a}}› tgt ‹{@{Claim S4.a }}›
		‹ @{Claim S4.a } is supported by @{Claim C6.a}.›
end 