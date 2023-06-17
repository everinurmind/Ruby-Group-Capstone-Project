require 'json'
require_relative 'item'
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(id, genre, author, multiplayer, last_played_at)
    super(id)
    @genre = genre
    @author = author
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    last_played_days_ago = (Date.today - @last_played_at).to_i
    last_played_days_ago >= 365 * 2
  end

  def to_hash
    {
      id: @id,
      genre: @genre,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at.to_s
    }
  end
end
