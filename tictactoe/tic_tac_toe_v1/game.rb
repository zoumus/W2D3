require_relative "./board.rb"
require_relative "./human_player.rb"

class Game

    def initialize(pl_1_mark, pl_2_mark)
        @player_1 = HumanPlayer.new(pl_1_mark)
        @player_2 = HumanPlayer.new(pl_2_mark)
        @board = Board.new
        @current_player = @player_1
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
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