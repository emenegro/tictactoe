require_relative 'constants'

module Messages
    def Messages.start
        message = ""
        message << "
 ████████╗██╗ ██████╗     ████████╗ █████╗  ██████╗     ████████╗ ██████╗ ███████╗
 ╚══██╔══╝██║██╔════╝     ╚══██╔══╝██╔══██╗██╔════╝     ╚══██╔══╝██╔═══██╗██╔════╝
    ██║   ██║██║     █████╗  ██║   ███████║██║     █████╗  ██║   ██║   ██║█████╗  
    ██║   ██║██║     ╚════╝  ██║   ██╔══██║██║     ╚════╝  ██║   ██║   ██║██╔══╝  
    ██║   ██║╚██████╗        ██║   ██║  ██║╚██████╗        ██║   ╚██████╔╝███████╗
    ╚═╝   ╚═╝ ╚═════╝        ╚═╝   ╚═╝  ╚═╝ ╚═════╝        ╚═╝    ╚═════╝ ╚══════╝
        ".yellow
        message << "\n\t\tWelcome to Tic-Tac-Toe for two players\n".yellow
        message << manual
        message << "If you have any doubt, you can read these instructions again by typing #{"help".yellow}. Let's go!\n"
        return message
    end

    def Messages.manual
        message = ""
        message << "\nWhen prompted, enter the coordinate in which you want to make your move.\n"
        message << "Coordinates are a pair of numbers beetween #{MIN_INDEX} and #{MAX_INDEX}.\n"
        message << "Input them in the format #{"##".bold}. Here are some examples:\n\n"
        message << "\t#{"00".green} -> #{"Correct".green}\n"
        message << "\t#{"10".green} -> #{"Correct".green}\n"
        message << "\t#{"22".green} -> #{"Correct".green}\n"
        message << "\t#{"30".red} -> #{"Incorrect".red}\n"
        message << "\t#{"05".red} -> #{"Incorrect".red}\n"
        message << "\t#{"0w".red} -> #{"Incorrect".red}\n\n"
        return message
    end

    def Messages.get_input(mark)
        message = ""
        message << "Enter move for ".white
        message << string_for_mark(mark)
        message << ": ".white
        return message
    end

    def Messages.input_error
        return "Position is wrong, values have to be between #{MIN_INDEX} and #{MAX_INDEX} in the format ##\n".red        
    end

    def Messages.position_error
        return "Position is already taken, please try another\n".red
    end

    def Messages.winner_message(winner)
        return "\n\t#{string_for_mark(winner)} WINS!\n\n".green
    end
    
    def Messages.no_more_moves
        return "\n\tNO MORE MOVES AVAILABLE :(\n\n".red
    end

    def Messages.string_for_mark(mark)
        return MARK_EMPTY if mark == :empty
        return MARK_X.blue if mark == :cross
        return MARK_O.yellow if mark == :circle
    end
end