theory Platform Argument
	imports "Isabelle_SACM.Isa_SACM" 	
begin 
	Claim Sensors ‹ Sensor readings are within the specified range and accurate. ›
	Claim Sensor.G2.a ‹ Sensed obstacle data is accurate. ›
	Claim Sensor.G2.b ‹ Other sensed data is accurate. ›
	Claim Sensor.G3.a ‹ Obstacle data is well-formed ›
	Claim Sensor.G3.b ‹ Obstacle sensors support sufficient redundancy. ›
	Claim Sensor.G3.c ‹ Other input data is within range. ›
	Claim Sensor.G3.d ‹ Sensors for other input data are redundant. ›
	ArtifactReference Digital Twin ‹Runtime Evaluation›
	ArtifactReference Sensor.Sn2 ‹System 
	                              design review›
	ArtifactReference Sensor.Sn3 ‹EVL›
	ArtifactReference Sensor.Sn4 ‹System 
	                              design review›
	Inference Name src ‹{@{ClaimSensor.G2.a}, @{ClaimSensor.G2.b}}› tgt ‹{@{Claim Sensors}}›
		‹ @{Claim Sensors} is supported by @{ClaimSensor.G2.a}, @{ClaimSensor.G2.b}.›
	Inference Name src ‹{@{Claim Sensor.S1}}› tgt ‹{@{Claim Sensors}}›
		‹ @{Claim Sensors} is supported by @{Claim Sensor.S1}.›
	Inference Name src ‹{@{Claim Sensor.G2.a}}› tgt ‹{@{Claim Sensor.S1}}›
		‹ @{Claim Sensor.S1} is supported by @{Claim Sensor.G2.a}.›
	Inference Name src ‹{@{Claim Sensor.G2.b}}› tgt ‹{@{Claim Sensor.S1}}›
		‹ @{Claim Sensor.S1} is supported by @{Claim Sensor.G2.b}.›
	Inference Name src ‹{@{Claim Sensor.G3.a}}› tgt ‹{@{Claim Sensor.G2.a}}›
		‹ @{Claim Sensor.G2.a} is supported by @{Claim Sensor.G3.a}.›
	Inference Name src ‹{@{ArtifactReference Digital Twin}}› tgt ‹{@{Claim Sensor.G3.a}}›
		‹ @{Claim Sensor.G3.a} is supported by @{ArtifactReference Digital Twin}.›
	Inference Name src ‹{@{Claim Sensor.G3.b}}› tgt ‹{@{Claim Sensor.G2.a}}›
		‹ @{Claim Sensor.G2.a} is supported by @{Claim Sensor.G3.b}.›
	Inference Name src ‹{@{ArtifactReference Sensor.Sn2}}› tgt ‹{@{Claim Sensor.G3.b}}›
		‹ @{Claim Sensor.G3.b} is supported by @{ArtifactReference Sensor.Sn2}.›
	Inference Name src ‹{@{Claim Sensor.G3.c}}› tgt ‹{@{Claim Sensor.G2.b}}›
		‹ @{Claim Sensor.G2.b} is supported by @{Claim Sensor.G3.c}.›
	Inference Name src ‹{@{Claim Sensor.G3.d}}› tgt ‹{@{Claim Sensor.G2.b}}›
		‹ @{Claim Sensor.G2.b} is supported by @{Claim Sensor.G3.d}.›
	Inference Name src ‹{@{ArtifactReference Sensor.Sn3}}› tgt ‹{@{Claim Sensor.G3.c}}›
		‹ @{Claim Sensor.G3.c} is supported by @{ArtifactReference Sensor.Sn3}.›
	Inference Name src ‹{@{ArtifactReference Sensor.Sn4}}› tgt ‹{@{Claim Sensor.G3.d}}›
		‹ @{Claim Sensor.G3.d} is supported by @{ArtifactReference Sensor.Sn4}.›
end 