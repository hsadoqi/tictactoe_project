class HumanPlayer
    @@all = []

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def mark
        @mark_value 
    end 

    def valid?(position)
        pos = position.split(" ")

        if pos.length != 2
            # can also put 'raise' but cli game would be interrupted with a runtime error
            p "Please enter two numbers separated by a space"
            position = gets.chomp
            valid?(position)
        else 
            pos
        end
    end 

    def get_position
        p "Which row and position in the row would you like to play? Please enter the numbers separated by a space."

        pos = valid?(gets.chomp)

        if pos
            p pos
        end
        



    end 


end