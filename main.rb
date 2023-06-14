require_relative 'item'
def print_menu
  puts 'Select an option:'
  puts '1. Create a new item'
  puts '2. Archive an item'
  puts '3. Quit'
  print 'Enter your choice: '
end
def create_item
  print 'Enter the publish date (YYYY-MM-DD): '
  publish_date = gets.chomp
  item = Item.new(Date.parse(publish_date))
  puts "Item with ID #{item.id} created."
end
def archive_item
  print 'Enter the publish date of the item to be archived (YYYY-MM-DD): '
  publish_date = gets.chomp
  item = Item.new(Date.parse(publish_date))
  item.move_to_archive
end