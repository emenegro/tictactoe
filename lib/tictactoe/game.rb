require_relative 'constants'
require_relative 'messages'
require_relative 'board'

class Game
    @turn
    @board
    @coords
    @output

    def initialize(board, coords, output)
        @turn = nil
        @board = board
        @coords = coords
        @output = output
    end

    def start
        @output.show(Messages.start)

        # Game loop
        while @board.can_move && @board.winner == nil
            @board.show_moves
            toggle_turn
            get_move
        end

        # Game ending
        @board.show_moves
        if @board.winner
            @output.show(Messages.winner_message(@board.winner))
        elsif !@board.can_move
            @output.show(Messages.no_more_moves)
        end
    end

    private def get_move
        @output.show(Messages.get_input(@turn))
        coords = @coords.get_coords
        if coords == nil
            get_move
        else
            row = coords[0]
            col = coords[1]
            if !@board.add_move(row, col, @turn)
                @output.show(Messages.position_error)
                get_move
            end
        end
    end

    private def toggle_turn
        if @turn == :circle || @turn == nil 
            @turn = :cross
        else 
            @turn = :circle
        end
    end
end
