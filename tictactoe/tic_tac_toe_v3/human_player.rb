
class HumanPlayer

    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(legal_positions)
       input = nil
        while !legal_positions.include?(input)
            print "Player #{mark_value.to_s}, enter the position as two numbers with a space between them like '4 5'"
            input = gets.chomp.split(" ").map(&:to_i)
            puts "#{input} is not a legal position" if !legal_positions.include?(input)
            
            raise 'position is not correct' if input.length != 2
        end
        input
    end

end