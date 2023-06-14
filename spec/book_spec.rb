require_relative '../classes/book'

RSpec.describe Book do
  describe '#can_be_archived?' do
    context 'when the cover_state is "bad"' do
      it 'returns true' do
        publish_date = Date.today - (5 * 365) # 5 years ago
        book = Book.new(publish_date, 'Publisher', 'bad')
        expect(book.can_be_archived?).to be true
      end
    end

    context 'when the cover_state is not "bad" and the publish_date is older than 10 years' do
      it 'returns true' do
        publish_date = Date.today - (11 * 365) # 11 years ago
        book = Book.new(publish_date, 'Publisher', 'good')
        expect(book.can_be_archived?).to be true
      end
    end

    context 'when the cover_state is not "bad" and the publish_date is within 10 years' do
      it 'returns false' do
        publish_date = Date.today - (5 * 365) # 5 years ago
        book = Book.new(publish_date, 'Publisher', 'good')
        expect(book.can_be_archived?).to be false
      end
    end
  end
end
