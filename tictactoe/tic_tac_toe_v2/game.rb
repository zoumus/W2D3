require_relative "./board.rb"
require_relative "./human_player.rb"

class Game

    def initialize(n, *marks)
        @player = marks.map { |mark| HumanPlayer.new(mark) }
        @board = Board.new(n)
        @current_player = @player.first
    end

    def switch_turn
        @current_player = @player.rotate!.first
    end

    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@current_player.get_position, @current_player.mark_value)

            if @board.win?(@current_player.mark_value)
                print "Victory, #{@current_player}"
                return
            else
                self.switch_turn
            end
        end
        print 'draw'
    end
end