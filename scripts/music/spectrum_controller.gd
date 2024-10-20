extends Node2D
class_name SpectrumSoundController

var drums_spectrum

var snare = false
var kick = false
var ride = false
var hat = false

func _ready() -> void:
	drums_spectrum = AudioServer.get_bus_effect_instance(1,0) # obtiene el efecto 'SpectrumAnalizer de el bus 'Drums'. 

func _process(delta: float) -> void:
	get_drum_instrument_sound()

func get_drum_instrument_sound():
	"""
	Proposito:
		Indica que instrumento de la bateria esta sonando actualmente.
	Precondiciones:
		Ninguna.
	"""
	if sound_kick():
		kick = true
		snare = false
		ride = false
		hat = false
	elif sound_snare():
		kick = false
		snare = true
		ride = false
		hat = false
	elif sound_hat():
		ride = false
		hat = true
	elif sound_ride():
		ride = true
		hat = false
	else:
		ride = false

func sound_kick():
	"""
	Proposito:
		Indica si el instrumento que suena actualmente es o no el bombo.
	Precondiciones:
		Ninguna
	"""
	var kick_magnitude = drums_spectrum.get_magnitude_for_frequency_range(80,140)
	var total_kick_mag = kick_magnitude.x + kick_magnitude.y
	return total_kick_mag > 0.05

func sound_snare():
	"""
	Proposito:
		Indica si el instrumento que suena actualmente es o no el redoblante.
	Precondiciones:
		Ninguna
	"""
	var snare_magnitude = drums_spectrum.get_magnitude_for_frequency_range(260,340)
	var total_snare_mag = snare_magnitude.x + snare_magnitude.y
	
	return total_snare_mag > 0.01

func sound_ride():
	"""
	Proposito:
		Indica si el instrumento que suena actualmente es o no el ride.
	Precondiciones:
		Ninguna
	"""
	var ride_magnitude = drums_spectrum.get_magnitude_for_frequency_range(8600,10500)
	var total_ride_mag = ride_magnitude.x + ride_magnitude.y
	
	return total_ride_mag > 0.01

func sound_hat():
	"""
	Proposito:
		Indica si el instrumento que suena actualmente es o no el hithat.
	Precondiciones:
		Ninguna
	"""
	var hat_magnitude = drums_spectrum.get_magnitude_for_frequency_range(920,1000)
	var total_hat_mag = hat_magnitude.x + hat_magnitude.y
	
	return total_hat_mag > 0.01
