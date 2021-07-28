require_relative "piece.rb"
require 'singleton'

class NullPiece < Piece
    include Singleton

    def initialize
        super('',0,'' )
    end


end