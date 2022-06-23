require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(number)
        @player = Player.new
        @board = Board.new(number)
        @remaining_misses = (number * number) / 2
    end

    def start_game
        @board.place_random_ships
        print "number of ships: #{@board.num_ships}"
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            print 'you lose'
            return true
        else 
            return false
        end
    end

    def win?
        if @board.num_ships == 0
            print 'you win'
            return true
        else
            return false
        end
    end

    def game_over?
        return true if win? || lose?
        false
    end

    def turn
        @remaining_misses -= 1 if !@board.attack(@player.get_move)
        @board.print  
        print @remaining_misses
    end
end
