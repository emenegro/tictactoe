require_relative 'constants'

module Messages
    def Messages.put_start
        puts "
 ████████╗██╗ ██████╗     ████████╗ █████╗  ██████╗     ████████╗ ██████╗ ███████╗
 ╚══██╔══╝██║██╔════╝     ╚══██╔══╝██╔══██╗██╔════╝     ╚══██╔══╝██╔═══██╗██╔════╝
    ██║   ██║██║     █████╗  ██║   ███████║██║     █████╗  ██║   ██║   ██║█████╗  
    ██║   ██║██║     ╚════╝  ██║   ██╔══██║██║     ╚════╝  ██║   ██║   ██║██╔══╝  
    ██║   ██║╚██████╗        ██║   ██║  ██║╚██████╗        ██║   ╚██████╔╝███████╗
    ╚═╝   ╚═╝ ╚═════╝        ╚═╝   ╚═╝  ╚═╝ ╚═════╝        ╚═╝    ╚═════╝ ╚══════╝
        ".yellow
        put_manual
        puts "\nIf you have any doubt, you can read these instructions again by typing #{"help".yellow}. Let's go!".italic
    end

    def Messages.put_manual
        puts "When prompted, enter the coordinate in which you want to make your move.".italic
        puts "Coordinates are a pair of numbers beetween #{MIN_INDEX} and #{MAX_INDEX}.".italic
        puts "Input them in the format #{"##".bold}. Here are some examples:\n".italic
        puts "\t#{"00".green} -> #{"Correct".green}".italic
        puts "\t#{"10".green} -> #{"Correct".green}".italic
        puts "\t#{"22".green} -> #{"Correct".green}".italic
        puts "\t#{"30".red} -> #{"Incorrect".red}".italic
        puts "\t#{"05".red} -> #{"Incorrect".red}".italic
        puts "\t#{"0w".red} -> #{"Incorrect".red}".italic
    end

    def Messages.put_get_input(mark)
        print "Enter move for ".white
        print string_for_mark(mark)
        print ": ".white
    end

    def Messages.put_input_error
        puts "Position is wrong, values have to be between #{MIN_INDEX} and #{MAX_INDEX} in the format ##".red        
    end

    def Messages.put_position_error
        puts "Position is already taken, please try another".red
    end

    def Messages.put_winner_message(winner)
        puts "\n\t#{string_for_mark(winner)} WINS!\n\n".green
    end
    
    def Messages.put_no_more_moves
        puts "\n\tNO MORE MOVES AVAILABLE :(\n\n".red
    end

    def Messages.string_for_mark(mark)
        return MARK_EMPTY if mark == :empty
        return MARK_X.blue if mark == :cross
        return MARK_O.yellow if mark == :circle
    end
end