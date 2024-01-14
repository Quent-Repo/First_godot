extends Node2D

enum StartTimeMode { System_time, random_time, fixed_time, offset_time}

@export var time_scale := 1.0

##This is a note
@export var start_time := StartTimeMode.System_time


#@export_group('Fixed Start Time')
#@export var start_hour := 0
#@export var start_min := 0
#@export var start_sec := 0

##This is a group
@export_group('fixed of Offest start time')
@export_range(-11,11) var start_hour := 0
@export_range(0,59) var start_min := 0
@export_range(0,59) var start_sec := 0

var t:= 0.0


@onready var Sec:= $sec as Node2D
@onready var Min:= $min as Node2D
@onready var Hour:=$HourArm as Node2D

func _ready() -> void:
	if start_time == StartTimeMode.random_time:
		t = randf_range(0.0, 43200.0)
	else:
		if start_time != StartTimeMode.fixed_time:
			var x := Time.get_time_dict_from_system()
			t = float(x.second+x.minute*60+x.hour*3600)
		if  start_time != StartTimeMode.System_time:
			t += float(start_sec+start_min+start_hour)
	


func _process(delta: float) -> void:
	
	
	t += delta * time_scale
	
	#$sec.rotation_degrees = x['second'] * 6
	#$min.rotation_degrees= x['minute'] *6
	#$HourArm.rotation_degrees= x['hour']*30
	Sec.rotation = fmod(t,60.0) * TAU /60.0
	Min.rotation= fmod(t/60.0,60.0) * TAU /60.0
	Hour.rotation= fmod(t/3600.0,12.0)* TAU/12.0
	pass
	


