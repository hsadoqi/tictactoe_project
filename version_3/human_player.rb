class HumanPlayer

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def mark
        @mark_value 
    end 

    def valid?(position)
        pos = position.split(" ").map {|i| i.to_i}

        if pos.length != 2
            # can also put 'raise' but cli game would be interrupted with a runtime error
            p "Please enter two numbers separated by a space"
            position = gets.chomp
            valid?(position)
        else 
            pos
        end
    end 

    def get_position(positions)
        p "Which row and position in the row would you like to play? Please enter the numbers separated by a space."

        pos = valid?(gets.chomp)

        if pos && positions.include?(pos)
            p pos
        else 
            p "#{pos} is not a legal position"
            get_position(positions)
        end
        

    end 


end