require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos, :children
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos 
   
  end


  def losing_node?(evaluator)

    p board.won?
    return false if evaluator != @next_mover_mark && @board.won?
    true

  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    @children = []
    checked_spaces = []

    @board.rows.each_with_index do |row, i|
      row.each_with_index do |space, j|

        dup_board = board.dup

        mark = :x
        if @next_mover_mark == :x
          mark = :o
        end

        if space.nil? && !checked_spaces.include?([i,j])
          checked_spaces << [i,j]
          dup_board.rows[i][j] = mark
          @prev_move_pos = [i,j]
          child = TicTacToeNode.new(dup_board, mark, @prev_move_pos)
          @children << child
        end
      end
    end

    @children
  end
end
