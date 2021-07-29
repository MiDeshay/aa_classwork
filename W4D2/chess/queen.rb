require_relative "piece.rb"
require_relative "rook_motion.rb"
require_relative "bishop_motion.rb"

class Queen < Piece
    include RookMotion
    include BishopMotion
    
    attr_accessor :position
    attr_reader :color

    def initialize(color, position, board)
        super(color, position, board)
    end

    def symbol
        return 'Q'
    end
    
    def valid_move?(end_pos)
        self.find_straight_line(end_pos) || self.find_diag(end_pos)
    end

end