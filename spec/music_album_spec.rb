require_relative '../classes/music_album'
RSpec.describe MusicAlbum do
  describe '#to_hash' do
    it 'returns the music album as a hash' do
      album = MusicAlbum.new(Date.new(2022, 1, 1), 'Artist', true, 1)
      album.title = 'Album Title'
      album.genre = double('Genre', id: 1)
      album.archived = true
      hash = album.to_hash
      expect(hash).to be_a(Hash)
      expect(hash[:id]).to eq(1)
      expect(hash[:label]).to be_nil
      expect(hash[:publish_date]).to eq(Date.new(2022, 1, 1))
      expect(hash[:archived]).to eq(true)
      expect(hash[:artist]).to eq('Artist')
      expect(hash[:on_spotify]).to eq(true)
      expect(hash[:genre]).to eq(1)
    end
  end
  describe '#can_be_archived?' do
    context 'when the music album can be archived' do
      it 'returns true' do
        album = MusicAlbum.new(Date.new(2010, 1, 1), 'Artist', true)
        album.on_spotify = true
        expect(album.can_be_archived?).to eq(true)
      end
    end
    context 'when the music album cannot be archived' do
      it 'returns false' do
        album = MusicAlbum.new(Date.new(2022, 1, 1), 'Artist', true)
        album.on_spotify = false
        expect(album.can_be_archived?).to eq(false)
      end
    end
  end
end
