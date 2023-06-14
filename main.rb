require_relative './classes/item'

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

loop do
  print_menu
  choice = gets.chomp.to_i
  case choice
  when 1
    create_item
  when 2
    archive_item
  when 3
    puts 'Exiting the app. Goodbye!'
    break
  else
    puts 'Invalid choice. Please try again.'
  end
  puts '-' * 20
end
