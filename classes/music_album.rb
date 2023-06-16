class MusicAlbum < Item
  attr_accessor :title, :artist, :on_spotify, :genre, :archived, :label
  def initialize(publish_date, artist, on_spotify, id = nil)
    super(publish_date, id)
    @title = nil
    @artist = artist
    @on_spotify = on_spotify
    @genre = nil
    @archived = false
    @label = nil
  end
  def to_hash
    {
      id: @id,
      label: @label,
      publish_date: @publish_date,
      archived: @archived,
      artist: @artist,
      on_spotify: @on_spotify,
      genre: @genre&.id
    }
  end
  def can_be_archived?
    (Date.today - @publish_date).to_i >= 3652 && @on_spotify
  end
end
