require_relative "piece.rb"
require_relative "bishop_motion.rb"

class Bishop < Piece
    include BishopMotion 
    attr_reader :color, :position
    attr_accessor :position

    def initialize(color, position, board)
        super(color, position, board)
    end

    def symbol
        "B"
    end

    def valid_move?(end_pos)
        self.find_diag(end_pos)
    end
end