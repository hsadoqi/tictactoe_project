class Board 
    def initialize 
        @board = Array.new(3) {Array.new(3, '_') }
    end 

    def valid?(position)
        position[0].abs < @board.length && position[1].abs < @board[position[0]].length
    end 

    def empty?(position)
        @board[position[0]][position[1]] == '_'
    end 

    def place_mark(position, mark)
        if valid?(position) && empty?(position)
            @board[position[0]][position[1]] = mark
        end
    end
end 