require 'colorize'
require_relative 'tictactoe/game'
require_relative 'tictactoe/input'
require_relative 'tictactoe/output'
require_relative 'tictactoe/coords_provider'

input = CLIInput.new
output = CLIOutput.new

board = Board.new(output)
coords = CoordsProvider.new(input, output)
game = Game.new(board, coords, output)
game.start