require 'deck.rb'

class Hand
  def initialize(deck)
    @deck = deck
    @hand = []
    5.times { @hand << @deck.draw_card }
  end

  def calculate_strength
    arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    high_card = nil
    high_card_value = 0
    new_arr = @hand.sort_by do |card|

    end
  end
end