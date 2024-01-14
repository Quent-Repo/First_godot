extends Node2D

const System_time:=0
const random_time:=1


@export var start_time := System_time
var t:= 0.0



@onready var Sec:= $sec as Node2D
@onready var Min:= $min as Node2D
@onready var Hour:=$HourArm as Node2D

func _ready() -> void:
	var x := Time.get_time_dict_from_system()
	t = (x.second+x.minute*60+x.hour*3600)
	


func _process(delta: float) -> void:
	t += delta
	
	#$sec.rotation_degrees = x['second'] * 6
	#$min.rotation_degrees= x['minute'] *6
	#$HourArm.rotation_degrees= x['hour']*30
	Sec.rotation = fmod(t,60.0) * TAU /60.0
	Min.rotation= fmod(t/60.0,60.0) * TAU /60.0
	Hour.rotation= fmod(t/3600.0,12.0)* TAU/12.0
	pass
	


