extends Node


func process(input:String) -> String:
	var words = input.split(" ", false)
	if words.size() == 0:
		return "Enter 'commands' to get a list of commands"

	var first_word = words[0].to_lower()
	var second_word = ""
	
	if words.size() > 1:
		second_word = words[1].to_lower()
	print(first_word, second_word)
	
	match first_word:
		"commands":
			return "This is a list of commands."
		"help":
			return help(second_word)
		_:
			return "Invalid command: enter 'commands' for a list of valid commands"

	return "something went wrong"


func help(second_word:String) -> String:
	if second_word == "":
		return "Enter 'help' followed by a command. Enter 'commands' to get a list of commands."

	match second_word:
		"commands":
			return "Enter 'help' followed by a command."
		_:
			return "Invalid command"
		
