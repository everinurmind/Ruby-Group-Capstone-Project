require_relative '../classes/game'
require_relative '../classes/item'

RSpec.describe Game do
  let(:author) { Author.new(1, 'John', 'Doe') }
  let(:game_data) do
    [
      { multiplayer: true, last_played_at: (Date.today - 3).to_s },
      { multiplayer: false, last_played_at: (Date.today - 400).to_s }
    ]
  end
  let(:filename) { 'games.json' }

  describe '#can_be_archived?' do
    context 'when last played more than 2 years ago' do
      let(:game) { Game.new(1, 'RPG', 'John', true, Date.today - 730) }

      it 'returns true' do
        expect(game.can_be_archived?).to be true
      end
    end

    context 'when last played less than 2 years ago' do
      let(:game) { Game.new(2, 'FPS', 'Jane', false, Date.today - 400) }

      it 'returns false' do
        expect(game.can_be_archived?).to be false
      end
    end
  end
end
