class ComputerPlayer 

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def mark
        @mark_value 
    end 

    def get_position(positions)
        positions.sample
    end



end 