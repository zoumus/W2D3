
class Board

    def initialize
        @grid = Array.new(3) {Array.new(3, '_')}
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def valid?(pos)
        row, col = pos
        (0...3).include?(row) && (0...3).include?(col)
    end

    def empty?(pos)
        self[pos] == '_'
    end

    def place_mark(pos, mark)
        raise 'pos not valid or empty' if !valid?(pos) || !empty?(pos)
        self[pos] = mark
    end

    def print
        @grid.each do |row|
            puts row.join(' ')
        end
    end

    def win_col?(mark)
        @grid.transpose.any? { |col| col.all? { |el| el == mark }}
    end

    def win_row?(mark)
        @grid.any? { |row| row.all? { |el| el == mark }}
    end

    def win_diagonal?(mark)
        l_r = (0...@grid.length),all? do 
            pos = i, i
            self[pos] == mark
        end
        r_l = (0...@grid.length),all? do 
            pos = i, @grid.length - 1 - i
            self[pos] == mark
        end
        l_r || r_l
    end

    def win?(mark)
        win_col?(mark) || win_row?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.any? { |el| el == '_'}
    end
end