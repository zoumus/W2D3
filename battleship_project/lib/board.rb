class Board
  
    attr_reader :size

    def self.print_grid(arr)
        arr.each do |row|
            puts row.join(' ')
        end
    end

    def initialize(number)
        @grid = Array.new(number) {Array.new(number, :N)}
        @size = number * number
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def num_ships
        # num = 0
        # @grid.each do |sub|
        #     num += sub.count {|el| el == :S}
        # end
        # num
        @grid.flatten.count { |el| el == :S}
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts 'you sunk my battleship!'
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        rand = @size * 0.25
        while num_ships < rand
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            self[[row, col]] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |el|
                if el == :S
                    :N
                else
                    el
                end
            end
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end
