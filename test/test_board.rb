require 'colorize'
require 'minitest/autorun'
require_relative 'doubles'
require_relative '../lib/tictactoe/board'

class BoardTest < Minitest::Test
    @board

    def setup
        @board = Board.new(DummyOutput.new)
    end

    def test_new_board_can_move
        assert_equal true, @board.can_move
    end

    def test_board_with_some_moves_can_move
        @board.add_move(0, 0, :cross)
        @board.add_move(1, 0, :circle)
        assert_equal true, @board.can_move
    end

    def test_board_with_all_moves_cant_move
        @board.add_move(0, 0, :cross)
        @board.add_move(0, 1, :circle)
        @board.add_move(0, 2, :cross)
        @board.add_move(1, 0, :circle)
        @board.add_move(1, 1, :cross)
        @board.add_move(1, 2, :circle)
        @board.add_move(2, 0, :cross)
        @board.add_move(2, 1, :circle)
        @board.add_move(2, 2, :cross)
        assert_equal false, @board.can_move
    end

    def test_already_taken_move_returns_false
        @board.add_move(0, 0, :cross)
        added = @board.add_move(0, 0, :circle)
        assert_equal false, added
    end

    def test_board_empty_no_winner
        # Board is empty, created in setup method
        assert_nil @board.winner
    end

    def test_board_full_but_no_winner
        @board.add_move(0, 0, :cross)
        @board.add_move(0, 1, :circle)
        @board.add_move(0, 2, :cross)
        @board.add_move(1, 0, :circle)
        @board.add_move(1, 1, :cross)
        @board.add_move(1, 2, :circle)
        @board.add_move(2, 0, :circle)
        @board.add_move(2, 1, :cross)
        @board.add_move(2, 2, :circle)
        assert_nil @board.winner
    end

    def test_board_half_full_but_no_winner
        @board.add_move(0, 0, :cross)
        @board.add_move(0, 1, :circle)
        @board.add_move(0, 2, :cross)
        @board.add_move(1, 0, :circle)
        @board.add_move(1, 1, :cross)
        assert_nil @board.winner
    end

    def test_rows_winner_correct
        (0..2).each { |i| 
            @board.add_move(i, 0, :cross)
            @board.add_move(i, 1, :cross)
            @board.add_move(i, 2, :cross)
            assert_equal :cross, @board.winner
        }
    end

    def test_cols_winner_correct
        (0..2).each { |i| 
            @board.add_move(0, i, :circle)
            @board.add_move(1, i, :circle)
            @board.add_move(2, i, :circle)
            assert_equal :circle, @board.winner
        }
    end

    def test_lr_diagonal_winner_correct
        @board.add_move(0, 0, :cross)
        @board.add_move(1, 1, :cross)
        @board.add_move(2, 2, :cross)
        assert_equal :cross, @board.winner
    end

    def test_rl_diagonal_winner_correct
        @board.add_move(0, 2, :cross)
        @board.add_move(1, 1, :cross)
        @board.add_move(2, 0, :cross)
        assert_equal :cross, @board.winner
    end

    def test_three_marks_not_in_line_no_winner
        @board.add_move(0, 0, :cross)
        @board.add_move(1, 1, :cross)
        @board.add_move(1, 2, :cross)
        assert_nil @board.winner
    end

    def test_three_marks_in_line_but_different_no_winner
        @board.add_move(0, 0, :cross)
        @board.add_move(0, 1, :circle)
        @board.add_move(0, 2, :cross)
        assert_nil @board.winner
    end
end