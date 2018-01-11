require_relative 'constants'

class Board
    def initialize(output)
        @output = output
        @moves = [
            [:empty, :empty, :empty],
            [:empty, :empty, :empty],
            [:empty, :empty, :empty]
        ]
    end

    def can_move
        return @moves.flatten.include?(:empty)
    end

    def add_move(row, col, mark)
        move = @moves[row][col]
        if move == :empty
            @moves[row][col] = mark
            return true
        else
            return false
        end
    end

    def winner
        points = []
        points << check_lr_diagonal
        points << check_rl_diagonal
        INDEX_RANGE.each { |i|
            points << check_row(i)
            points << check_col(i)
        }
        return :cross if points.include?(CROSS_WINNING_POINTS)            
        return :circle if points.include?(CIRCLE_WINNING_POINTS)
        return nil
    end

    def show_moves
        board = "\n"
        @moves.each_with_index { |row, row_index| 
            board << "\t"
            row.each_with_index { |mark, col_index|
                board << " #{Messages.string_for_mark(mark)} "
                board << BOARD_VERTICAL_SEPARATOR.white if col_index < MAX_INDEX
            }
            board << "\n"
            board << "\t#{BOARD_HORIZONTAL_SEPARATOR}".white if row_index < MAX_INDEX
        }
        board << "\n"
        @output.show(board)
    end

    private def check_row(row)
        return sum_points(@moves[row])
    end

    private def check_col(col)
        column = INDEX_RANGE.map { |i| @moves[i][col] }
        return sum_points(column)
    end

    private def check_lr_diagonal()
        lr_diagonal = INDEX_RANGE.map { |i| @moves[i][i] }
        return sum_points(lr_diagonal)
    end

    private def check_rl_diagonal()
        rl_diagonal = INDEX_RANGE.map { |i| @moves[i][MAX_INDEX - i] }
        return sum_points(rl_diagonal)
    end

    private def sum_points(moves)
        moves.inject(0) { |sum, mark| sum + points_for_mark(mark) }
    end

    private def points_for_mark(mark)
        return EMPTY_POINTS if mark == :empty
        return CROSS_POINT if mark == :cross
        return CIRCLE_POINT if mark == :circle
    end
end
