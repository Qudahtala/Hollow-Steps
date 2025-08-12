extends Control

@onready var port_input = $CanvasLayer/Panel/VBoxContainer/port
@onready var ip_input = $CanvasLayer/Panel/VBoxContainer/ip

var localUsername : String

func _ready() -> void:
	pass

func _on_name_text_changed(new_text: String) -> void:
	localUsername = new_text

func start_client():
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(ip_input.text, int(port_input.text))
	multiplayer.multiplayer_peer = peer
	
	multiplayer.connected_to_server.connect(_on_connected_to_server)
	multiplayer.connection_failed.connect(_on_disconnected_to_server)
	multiplayer.server_disconnected.connect(_on_server_disconnected)

func _on_connected_to_server():
	print("connected to server")

func _on_disconnected_to_server():
	print("disconnected to server")
	
func _on_server_disconnected():
	print("server exploded")
