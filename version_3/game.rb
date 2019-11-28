require './board.rb'
require './human_player.rb'
require './computer_player.rb'

class Game 

    def initialize(board_size, marks)
        @players = marks.map {|mark, computer| computer ? ComputerPlayer.new(mark) : HumanPlayer.new(mark)}
        @current_player = @players.first
        @board = Board.new(board_size)
    end

    def switch_turn 
        @current_player = @players.rotate!.first
    end 

    def play 
        while @board.empty_positions? do
            @board.print 
            @board.place_mark(@current_player.get_position(@board.legal_positions), @current_player.mark)
            if @board.win?(@current_player.mark)
                p "You won!"
                return @board.print
            else 
                switch_turn 
            end
        end 

        p "No one won!"
    end


end 