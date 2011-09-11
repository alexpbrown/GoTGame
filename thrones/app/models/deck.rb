Class Deck
  def initialize(deck_type)
    @deck = []
    case deck_type
    when "westeros1"
      for Card.find_by_card_type(deck_type).each do |c|
        if c.descriptor == "Mustering" || c.descriptor == "Supply"
          4.times { @deck << c }
        else
          @deck << c
        end
      end
    end

  end
end
