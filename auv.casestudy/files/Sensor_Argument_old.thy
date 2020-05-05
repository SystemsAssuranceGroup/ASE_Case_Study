theory Sensor_Argument_old
	imports "Isabelle_SACM.Isa_SACM" 	
begin 
	Claim Sensor.G1 ‹ The system's sensors are acceptbaly reliable ›
	Claim Sensor.G2 ‹ Input parameters are accurate ›
	Claim Sensor.G3 ‹ Obstacle readings are accurate ›
	ArtifactReference Sensor.Sn1 ‹Runtime model validation›
	ArtifactReference Sensor.Sn2 ‹Runtime model validation›
	ArtifactReference Sensor.Sn3 ‹Redundant sensors to improve accuracy›
	Inference Name src ‹{@{ClaimSensor.G2}, @{ClaimSensor.G2}, @{ClaimSensor.G3}}› tgt ‹{@{Claim Sensor.G1}}›
		‹ @{Claim Sensor.G1} is supported by @{ClaimSensor.G2}, @{ClaimSensor.G2}, @{ClaimSensor.G3}.›
	Inference Name src ‹{@{Claim Sensor.S1}}› tgt ‹{@{Claim Sensor.G1}}›
		‹ @{Claim Sensor.G1} is supported by @{Claim Sensor.S1}.›
	Inference Name src ‹{@{Claim Sensor.G2}}› tgt ‹{@{Claim Sensor.S1}}›
		‹ @{Claim Sensor.S1} is supported by @{Claim Sensor.G2}.›
	Inference Name src ‹{@{Claim Sensor.G3}}› tgt ‹{@{Claim Sensor.S1}}›
		‹ @{Claim Sensor.S1} is supported by @{Claim Sensor.G3}.›
	Inference Name src ‹{@{ArtifactReference Sensor.Sn1}}› tgt ‹{@{Claim Sensor.G2}}›
		‹ @{Claim Sensor.G2} is supported by @{ArtifactReference Sensor.Sn1}.›
	Inference Name src ‹{@{ArtifactReference Sensor.Sn2}}› tgt ‹{@{Claim Sensor.G3}}›
		‹ @{Claim Sensor.G3} is supported by @{ArtifactReference Sensor.Sn2}.›
	Inference Name src ‹{@{ArtifactReference Sensor.Sn3}}› tgt ‹{@{Claim Sensor.G3}}›
		‹ @{Claim Sensor.G3} is supported by @{ArtifactReference Sensor.Sn3}.›
end 