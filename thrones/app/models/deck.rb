class Deck
  attr_reader :cards
  attr_reader :discarded_cards

  def initialize(deck_class)
    @cards = []
    case deck_class
    when "Westeros1"
      Westeros1.all.each do |c|
        if c.descriptor == "Mustering" || c.descriptor == "Supply"
          4.times { @cards << c }
        else
          @cards << c
        end
      end
    end
    @discarded_cards = []
  end
  
  def draw(discard = false)
    card = @cards.shift
    @cards.push card
    if discard and card
      @discarded_cards << @cards.pop
    end
    card
  end
  
  def shuffle
    @cards = @cards + @discarded_cards
    @discarded_cards = []
    @cards.shuffle
  end
end
