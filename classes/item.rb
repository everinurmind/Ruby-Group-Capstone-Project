require 'date'

class Item
  attr_reader :id, :archived
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(publish_date, id = nil)
    @id = id || Random.rand(1..300)
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    publish_date <= 10.years.ago.to_date
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
      puts 'Item has been archived'
    else
      puts 'Item cannot be archived'
    end
  end
end
