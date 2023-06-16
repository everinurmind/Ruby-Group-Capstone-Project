require_relative '../classes/genre'
RSpec.describe Genre do
  describe '#add_item' do
    it 'adds an item to the genre' do
      genre = Genre.new(1, 'Science Fiction')
      item = double('Item')
      expect(item).to receive(:genre=).with(genre)
      genre.add_item(item)
      expect(genre.items).to include(item)
    end
  end
  describe '#to_hash' do
    it 'returns the genre as a hash' do
      genre = Genre.new(1, 'Science Fiction')
      hash = genre.to_hash
      expect(hash).to be_a(Hash)
      expect(hash[:id]).to eq(1)
      expect(hash[:name]).to eq('Science Fiction')
      expect(hash[:items]).to eq([])
    end
  end
  describe '.all_genres' do
    it 'displays all genres' do
      genre1 = Genre.new(1, 'Science Fiction')
      genre2 = Genre.new(2, 'Fantasy')
      genres = [genre1, genre2]
      expect do
        Genre.all_genres(genres)
      end.to output("Listing all genres:\nGenre: Science Fiction\nGenre: Fantasy\n\n").to_stdout
    end
  end
end 