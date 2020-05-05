theory AUV_Overall_old
	imports "Isabelle_SACM.Isa_SACM" 	
begin 
	Claim C1 ‹ Defined AUV operation area ›
	Claim G1 ‹ The AUV is acceptably safe to operate ›
	Inference Name src ‹{@{ClaimLRE_Argument}, @{ClaimSensor_Argument}, @{ClaimAutopiloe_Argument}, @{ClaimActuator_Argument}}› tgt ‹{@{Claim G1}}›
		‹ @{Claim G1} is supported by @{ClaimLRE_Argument}, @{ClaimSensor_Argument}, @{ClaimAutopiloe_Argument}, @{ClaimActuator_Argument}.›
	Context Name src ‹{@{Claim C1}}› tgt ‹{@{Claim G1}}›
		‹ @{Claim G1} is context for @{Claim C1}.›
	Inference Name src ‹{@{Claim S1}}› tgt ‹{@{Claim G1}}›
		‹ @{Claim G1} is supported by @{Claim S1}.›
	Inference Name src ‹{@{Claim LRE_Argument}}› tgt ‹{@{Claim S1}}›
		‹ @{Claim S1} is supported by @{Claim LRE_Argument}.›
	Inference Name src ‹{@{Claim Sensor_Argument}}› tgt ‹{@{Claim S1}}›
		‹ @{Claim S1} is supported by @{Claim Sensor_Argument}.›
	Inference Name src ‹{@{Claim Autopiloe_Argument}}› tgt ‹{@{Claim S1}}›
		‹ @{Claim S1} is supported by @{Claim Autopiloe_Argument}.›
	Inference Name src ‹{@{Claim Actuator_Argument}}› tgt ‹{@{Claim S1}}›
		‹ @{Claim S1} is supported by @{Claim Actuator_Argument}.›
end 