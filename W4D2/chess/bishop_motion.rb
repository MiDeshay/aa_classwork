module BishopMotion

    def find_diag(end_pos)
        starting_row = position[0]
        starting_col = position[1]

        ending_row = end_pos[0]
        ending_col = end_pos[1]

        if (ending_row < 0 || ending_row > 7) || (ending_col < 0 || ending_col > 7)
            return false
        end

        if starting_row < ending_row && starting_col < ending_col
            i = 1
            j = 1
            until @board[[starting_row + i, starting_col + j]] == nil
                if @board[[starting_row + i, starting_col + j]].is_a?(Piece)
                    if starting_row + i == ending_row && starting_col + j == ending_col
                        return true
                    else
                        return false
                    end
                elsif starting_row + i == ending_row && starting_col + j == ending_col
                    return true
                else
                    i += 1
                    j += 1
                end
            end
        elsif starting_row > ending_row && starting_col < ending_col
            i = -1
            j = 1
            until @board[[starting_row + i, starting_col + j]] == nil
                if @board[[starting_row + i, starting_col + j]].is_a?(Piece)
                    if starting_row + i == ending_row && starting_col + j == ending_col
                        return true
                    else
                        return false
                    end
                elsif starting_row + i == ending_row && starting_col + j == ending_col
                    return true
                else
                    i -= 1
                    j += 1
                end
            end
        elsif starting_row > ending_row && starting_col > ending_col
            i = -1
            j = -1
            until @board[[starting_row + i, starting_col + j]] == nil
                if @board[[starting_row + i, starting_col + j]].is_a?(Piece)
                    if starting_row + i == ending_row && starting_col + j == ending_col
                        return true
                    else
                        return false
                    end
                elsif starting_row + i == ending_row && starting_col + j == ending_col
                    return true
                else
                    i -= 1
                    j -= 1
                end
            end
        elsif starting_row < ending_row && starting_col > ending_col
            i = 1
            j = -1
            until @board[[starting_row + i, starting_col + j]] == nil
                if @board[[starting_row + i, starting_col + j]].is_a?(Piece)
                    if starting_row + i == ending_row && starting_col + j == ending_col
                        return true
                    else
                        return false
                    end
                elsif starting_row + i == ending_row && starting_col + j == ending_col
                    return true
                else
                    i += 1
                    j -= 1
                end
            end
        end
    end
end