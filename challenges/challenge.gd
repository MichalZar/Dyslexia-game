class_name Challenge
extends Control

signal finished
signal notification_sent(notification: CompanionNotification)

const APPROVALS := [
	"Świetnie ci poszło!",
	"Wspaniale!",
	"Fantastycznie!",
	"Dobra robota!",
	"Brawo, udało ci się!",
	"Rewelacyjnie!",
	"To było wybitne!",
	"Perfekcyjnie wykonane",
	"Cudownie!",
	"Znakomicie!",
	"Twoje umiejętności są imponujące!",
	"Znakomita praca!",
	"To było niesamowite!",
	"Super!",
	"Brawo!"
]

const CORRECTIONS := [
	"Prawie ci się udało!",
	"Spróbujmy jeszcze raz",
	"Było naprawdę blisko",
	"Niewiele zabrakło",
	"Następnym razem będzie lepiej",
	"Nie zniechęcaj się",
	"Nie poddawaj się!",
	"Uda się, wierzę w ciebie!",
	"Jesteś na dobrej drodze!",
	"Jeszcze tylko trochę!"
]

func notify_companion_approval() -> void:
	await notify_companion(APPROVALS.pick_random())

func notify_companion_correction() -> void:
	await notify_companion(CORRECTIONS.pick_random())

func notify_companion(message: String) -> void:
	var notification := CompanionNotification.new()
	notification.message = message

	# When nothing listens on notifications (for example, when running in the
	# debug mode), then don't await the `disappeared` event.
	if notification_sent.get_connections().size() > 0:
		notification_sent.emit(notification)
		await notification.disappeared
