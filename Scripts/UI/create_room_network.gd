extends Control

const MAX_CLIENTS = 2

@onready var port_input = $CanvasLayer/Panel/VBoxContainer/port

var localUsername : String

func _ready() -> void:
	pass

func _on_name_text_changed(new_text: String) -> void:
	localUsername = new_text

func start_host():
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(int(port_input.text), MAX_CLIENTS)
	multiplayer.multiplayer_peer = peer
	
	multiplayer.peer_connected.connect(_on_player_connected)
	multiplayer.peer_disconnected.connect(_on_player_disconnected)
	
func _on_player_connected(id : int):
	print("player %s has connected" % id)
	
func _on_player_disconnected(id : int):
	print("player %s has disconnected" % id)
