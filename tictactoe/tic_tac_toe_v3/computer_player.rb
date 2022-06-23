class ComputerPlayer

    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(legal_positions)
        position = legal_positions.sample
        print "Computer #{mark_value}, chose postion #{position}"
    end
end