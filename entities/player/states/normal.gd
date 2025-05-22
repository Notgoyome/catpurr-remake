extends State

@export var capture_component: CaptureComponent
@export var movement_component: MovementComponent

func enter() -> void:
	movement_component.can_move = true

func process(delta: float) -> void:
	if Input.is_action_pressed("capture") and capture_component.can_capture():
		state_finished.emit(self, "Capturing")
		capture_component.capture()
	if Input.is_action_pressed("jump") :
		state_finished.emit(self, "Jumping")
