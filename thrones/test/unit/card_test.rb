require 'test_helper'

class CardTest < ActiveSupport::TestCase
  test "Card subtypes should be subclasses of Card" do
    assert Card.subclasses.include?(Westeros1)
    assert Card.subclasses.include?(Westeros2)
    assert Card.subclasses.include?(Westeros3)
    assert Card.subclasses.include?(General)
  end
  
  test "The Westeros I deck should be correct" do
    deck = Deck.new("Westeros1")
    card = nil
    cards = {}
    while(card = deck.draw(true))
      cards[card.descriptor] = 0 unless cards[card.descriptor]
      cards[card.descriptor] += 1
    end
    assert_equal cards["Supply"], 4
    assert_equal cards["Mustering"], 4
    assert_equal cards["Last Days of Summer"], 1
    assert_equal cards["Winter is Coming"], 1
  end
end
