module RookMotion

    def find_straight_line(end_pos)
        starting_row = position[0]
        starting_col = position[1]

        ending_row = end_pos[0]
        ending_col = end_pos[1]

        if (ending_row < 0 || ending_row > 7) || (ending_col < 0 || ending_col > 7)
            return false
        end

        if (ending_row < starting_row || ending_row > starting_row) && starting_col == ending_col && ending_row < 8 && ending_row >= 0 
            if ending_row < starting_row
                (ending_row...starting_row).each do |num|
                    if @board[[num, starting_col]].is_a?(Piece)
                        if num == ending_row && starting_col == ending_col
                            return true
                        else
                            return false
                        end
                    end
                end
            elsif ending_row > starting_row
                (starting_row+1..ending_row).each do |num|
                    if @board[[num, starting_col]].is_a?(Piece)
                        if num == ending_row && starting_col == ending_col
                            return true
                        else
                            return false
                        end
                    end
                end
            end
            return true
        elsif (ending_col < starting_col || ending_col > starting_col) && starting_row == ending_row && ending_col < 8 && ending_col >= 0
            if ending_col < starting_col
                (ending_col...starting_col).each do |num|
                    if @board[[starting_row,num]].is_a?(Piece)
                        if starting_row == ending_row && num == ending_col
                            return true
                        else
                            return false
                        end
                    end
                end
            elsif ending_col > starting_col
                (starting_col+1..ending_col).each do |num|
                    if @board[[starting_row,num]].is_a?(Piece)
                        if starting_row == ending_row && num == ending_col
                            return true
                        else
                            return false
                        end
                    end
                end
            end
            return true
        end
        false
    end

end