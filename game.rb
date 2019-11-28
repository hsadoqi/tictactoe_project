require './board.rb'
require './human_player.rb'
class Game 

    def initialize(player_1_mark, player_2_mark)
        if player_1_mark == player_2_mark
            raise 'You must have different marks'
        else 
            @player_1 = HumanPlayer.new(player_1_mark)
            @player_2 = HumanPlayer.new(player_2_mark)
            @current_player = @player_1
            @board = Board.new
        end
    end

    def switch_turn 
        if @current_player == @player_1 
            @current_player = @player_2
        else 
            @current_player = @player_1
        end
    end 

    def play 
        while @board.empty_positions? do
            @board.print 
            @board.place_mark(@current_player.get_position, @current_player.mark)
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