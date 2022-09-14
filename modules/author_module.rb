require_relative '../models/author'
require_relative '../item'

module AuthorModule
  def list_authors
    if @authors.empty?
      puts 'No author in the catalog'
      return
    end
    puts "\n"

    @authors.each_with_index do |author, i|
      puts "#{i + 1}) #{author.first_name} #{author.last_name}"
    end
  end

  def add_author
    puts '<= Add new author =>'
    print 'Creator\'s first name: '
    first_name = gets.chomp

    print 'Creator\'s last name: '
    last_name = gets.chomp

    author = Author.new(first_name, last_name)
    @authors.push(author)
    puts 'New author added successfully'
  end
end
