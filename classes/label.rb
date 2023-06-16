class Label
  attr_accessor :id, :title, :color, :items

  def initialize(id, title, color)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    items << item
    item.label = self
  end

  def to_hash
    {
      id: id,
      title: title,
      color: color,
      items: items.map(&:id)
    }
  end

  def self.all_labels(labels)
    puts 'Listing all labels:'
    labels.each do |label|
      puts "Label: #{label.title}, Color: #{label.color}"
    end
    puts
  end
end
