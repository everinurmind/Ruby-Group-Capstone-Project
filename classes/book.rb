require_relative 'item'
require 'date'

class Book < Item
  attr_accessor :title, :publisher, :cover_state, :archived

  def initialize(publish_date, publisher, cover_state, id = nil)
    super(publish_date, id)
    @publisher = publisher
    @cover_state = cover_state
    @title = nil
    @archived = false
  end

  def to_hash
    {
      id: @id,
      label: @label,
      publish_date: @publish_date,
      archived: @archived,
      publisher: @publisher,
      cover_state: @cover_state
    }
  end

  def can_be_archived?
    return true if cover_state == 'bad'

    (Date.today - @publish_date).to_i >= 3652
  end
end
