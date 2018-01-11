require 'colorize'
require 'minitest/autorun'
require_relative 'doubles'
require_relative '../lib/tictactoe/coords_provider'

class CoordsProviderTest < Minitest::Test
    def provider(input)
        return CoordsProvider.new(input, DummyOutput.new)
    end

    def test_return_coords
        provider = provider(DummyInput.new(["00"]))

        assert [0, 0], provider.get_coords
    end

    def test_return_last_coords
        provider = provider(DummyInput.new(["00", "11"]))

        assert [1, 1], provider.get_coords
    end

    def test_return_nil_if_wrong_numbers
        provider = provider(DummyInput.new(["55"]))

        assert_nil provider.get_coords
    end

    def test_return_nil_if_one_wrong_number
        provider = provider(DummyInput.new(["05"]))

        assert_nil provider.get_coords
    end

    def test_return_nil_if_letters
        provider = provider(DummyInput.new(["w0"]))

        assert_nil provider.get_coords
    end

    def test_return_nil_if_help
        provider = provider(DummyInput.new(["help"]))

        assert_nil provider.get_coords
    end
end
