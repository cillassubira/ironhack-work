#gameofrooms
require 'pry'
class Room
	attr_reader :position, :exits, :objects, :description
	def initialize(position, exits, description, objects = false, people = false)
		@position = position
		@exits = exits
		@description = description
		@objects
		@people
	end
end

class Player
	attr_reader :name, :player_position 
	def initialize(name)
		@name
		@player_position = [1,1]
	end
end

class Game
	attr_reader :rooms, :player
	def initialize(rooms, player)
		@rooms = rooms
		@player = player
	end
	def start
		present_room = locate_player(player.player_position)
	end

	def locate_player(present_player_position)
		binding.pry
		puts "Present player position #{present_player_position}"
	 	present_room = rooms.find {|room| room.position == present_player_position}
	 	puts "You are now in #{present_room.description}"
	 	puts "Position of the room you are in #{present_room.position}"
	 	choose_exit(present_room)
	 	present_room
	end

	def choose_exit(present_room)
		puts "Choose an exit: \n>"
		selection = gets.chomp
		puts "Your selection is: #{selection}"
		if present_room.exits.find {|item| item == selection} != nil
			puts "Great! You can go through the door to the next room"
			new_player_position = updating_position(selection) #newroom
		else
			puts "There is no next room via that exit, you will die here"
		end
	end

	def updating_position(selection)
		case selection
		when "N"
			player.player_position[0] = player.player_position[0] - 1 
			puts player.player_position[0]
			puts player.player_position
		when "S"
			player.player_position[0] = player.player_position[0] + 1 
			puts player.player_position[0]
		when "E"
			player.player_position[1] = player.player_position[1] + 1 
			puts player.player_position[1]
		when "W"
			player.player_position[1] = player.player_position[1] - 1 
			puts player.player_position[1]
		end
		new_player_position = player.player_position
		# locate_player(new_player_position)
		# new_player_position

	end
end


room1 = Room.new([1,1], ["N","S", "E", "W"], "You are in Room 1")
room2 = Room.new([0,1], ["S"], "You are in Room 2")
room3 = Room.new([1,2], ["E", "W"], "You are in Room 3")
room4 = Room.new([2,1], ["N"], "You are in Room 4")
room5 = Room.new([1,0], ["E"], "You are in Room 5")
room6 = Room.new([1,3], ["E", "W"], "You are in Room 6, this is THE END")


rooms = [room1, room2, room3, room4, room5]

player1 = Player.new("Jugador1")

game1 = Game.new(rooms, player1)
game1.start


