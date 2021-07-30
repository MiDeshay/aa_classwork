require "card.rb"
require "deck.rb"
require "hand.rb"

describe Card do
    describe '#initialize' do           
        subject(:card) {Card.new("A", 'heart')}
        it "should accept a string card value" do 
            expect(card.instance_variable_get("@value")).to eq("A")
            expect(card.instance_variable_get("@suit")).to eq("heart")
        end
    end
end

describe Deck do
  describe '#initialize' do
    subject(:deck) {Deck.new}
  
    it 'should create an array of 52 cards with' do
      cards = deck.instance_variable_get("@cards")
      expect(cards.length).to eq(52)
      expect(cards.uniq).to eq(cards)
      end
  end

    describe "#draw_card" do
    subject(:deck) {Deck.new}
        it "should remove a card from the deck" do
          cards = deck.instance_variable_get("@cards")
          len = cards.length
          deck.draw_card
          expect(cards.length).to eq(len - 1)
        end

        it 'should return a card' do
          expect(deck.draw_card).to be_a Card
        end
    end

    describe '#reset_deck' do
    subject(:deck) {Deck.new}
      it 'should restock the deck' do
        deck.draw_card
        deck.reset_deck
        cards = deck.instance_variable_get("@cards")
        expect(cards.length).to eq(52)
        expect(cards.uniq).to eq(cards)
      end
    end
end

describe Hand do
    let(:deck) {Deck.new}
    subject(:hand) {Hand.new(deck)}
    describe "#initialize" do
        it "should have a hand of five cards" do
            expect(hand.instance_variable_get("@hand").length).to be 5
        end
        it "should use Deck#draw_card" do
            expect(deck).to receive(:draw_card).exactly(5).times
            Hand.new(deck)
        end
    end

    describe "#calculate_strength" do
        #returns an array of the hands strength and the matching card value
        # 1 pair of twor of hearts [1, card = two of hearts]
        # [0...9] 
        it "returns an array of the hands strength and the highest card value" do
          arr = hand.calculate_strength
          expect(arr[0]).to be_a Integer
          expect(arr[1]).to be_a Card 
        end
    end

    describe "#tie_breaker" do
        

    end

end
