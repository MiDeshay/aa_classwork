require_relative "piece.rb"
require_relative "rook_motion.rb"
require_relative "slidable.rb"

class Rook < Piece
    include RookMotion
    include Slideable

    attr_reader :color, :position
    attr_accessor :position

    def initialize(color, position, board)
        super(color, position, board)
    end

    def symbol
        "R"
    end

    def move_dirs
        return horizantal_dirs
    end

    def valid_move?(end_pos)
        self.find_straight_line(end_pos)
    end

end