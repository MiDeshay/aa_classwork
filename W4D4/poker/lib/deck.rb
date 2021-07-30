require "card.rb"

class Deck

    VALUES = ['A', 'K', 'Q', 'J', '10', '9', '8',' 7', '6', '5', '4', '3', '2']
    SUITES = ['heart', 'spade', 'diamond', 'club']

    def initialize

        self.build_deck
    end

    def draw_card
      @cards.pop
    end

    def build_deck
        result = []
        
        VALUES.each do |value|
            SUITES.each do |suit|
                result << Card.new(value, suit)
            end
        end
        @cards = result.shuffle
    end

    def reset_deck 
        self.build_deck
    end
end