require_relative '../classes/label'
require_relative '../classes/book'

RSpec.describe Label do
  describe '#add_item' do
    it 'adds the item to the collection of items' do
      label = Label.new(1, 'Label', 'Red')
      book = Book.new(Date.today, 'Publisher', 'good')
      label.add_item(book)
      expect(label.items).to include(book)
    end

    it 'sets the label property of the item object' do
      label = Label.new(1, 'Label', 'Red')
      book = Book.new(Date.today, 'Publisher', 'good')
      label.add_item(book)
      expect(book.label).to eq(label)
    end
  end
end
