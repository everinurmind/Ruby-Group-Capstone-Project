class Genre
  attr_accessor :id, :name, :items

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    items << item
    item.genre = self
  end

  def to_hash
    {
      id: id,
      name: name,
      items: items.map(&:id)
    }
  end

  def self.all_genres(genres)
    puts 'Listing all genres:'
    genres.each do |genre|
      puts "Genre: #{genre.name}"
    end
    puts
  end
end
