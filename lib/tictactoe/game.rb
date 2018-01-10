require_relative 'constants'
require_relative 'messages'
require_relative 'board'

class Game
    @turn
    @board

    def initialize
        @turn = nil
        @board = Board.new
    end

    def start
        Messages.put_start

        # Game loop
        while @board.can_move && @board.winner == nil
            @board.print_moves
            toggle_turn
            get_move
        end

        # Game ending
        @board.print_moves
        if @board.winner
            Messages.put_winner_message(@board.winner)
        elsif !@board.can_move
            Messages.put_no_more_moves
        end
    end

    private def get_move
        Messages.put_get_input(@turn)
        input = gets.strip
        if input == INPUT_HELP
            Messages.put_manual
            get_move
        elsif input[INPUT_REGEX] == nil
            Messages.put_input_error
            get_move
        else
            row = input[0].to_i
            col = input[1].to_i
            if !@board.add_move(row, col, @turn)
                Messages.put_position_error
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
