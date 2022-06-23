
class HumanPlayer

    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position
        print "Player #{mark_value}, enter the position as two numbers with a space between them like '4 5'"
        input = gets.chomp.split.map(&:to_i)
        raise 'position is not correct' if input.length != 2
    end

end