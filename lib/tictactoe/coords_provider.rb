require_relative 'constants'
require_relative 'messages'

class CoordsProvider
    def initialize(input, output)
        @input = input
        @output = output
    end

    def get_coords
        input = @input.get_input
        if input == INPUT_HELP
            @output.show(Messages.manual)
            return nil
        elsif input[INPUT_REGEX] == nil
            @output.show(Messages.input_error)
            return nil
        else
            row = input[0].to_i
            col = input[1].to_i
            return row, col
        end
    end
end
