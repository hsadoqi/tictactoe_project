class Board 
    def initialize(n)
        @board = Array.new(n) {Array.new(n, '_') }
    end 

    def [](pos)
        row, col = pos
        @board[row][col]
    end 

    def []=(pos, val)
        row, col = pos
        @board[row][col] = val
    end

    def valid?(position)
        position[0].abs < @board.length && position[1].abs < @board[position[0]].length
    end 

    def empty?(pos)
        self[pos] == '_'
    end 

    def place_mark(position, mark)
        pos = position[0].to_i, position[1].to_i
        unless !valid?(pos) || !empty?(pos)
            self[pos] = mark
        else 
            p "Please enter a valid position"
            new_pos = gets.chomp.split(" ")
            place_mark(new_pos, mark)
        end
    end

    def print 
        @board.each {|b| p b}
    end 

    def win_row?(mark)
        @board.any? do |row|
            check_values(row, mark)
        end
    end

    def check_values(arr, mark)
        arr.all? {|pos| pos == mark}
    end

    def win_col?(mark)
        @board.transpose.any? {|col| check_values(col, mark)}
    end

    def win_diagonal?(mark)
        left_diag = (0...@board.length).all? do |val|
            pos = [val, val]
            self[pos] == mark 
        end 

        right_diag = (0...@board.length).all? do |val|
            row = val 
            col = @board.length - 1 - val 
            pos = [row, col]
            self[pos] == mark
        end 

        left_diag || right_diag
    end

    def win?(mark)
        win_col?(mark) || win_row?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @board.flatten.any? {|pos| pos == '_'}
    end

    def legal_positions
        indices = (0...@board.length).to_a
        positions = indices.product(indices)
        positions.select { |pos| empty?(pos) }
    end


end 