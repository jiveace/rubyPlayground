require 'ostruct'

class Author
  attr_accessor :first_name, :last_name, :genre

  def author
    OpenStruct.new(first_name: first_name, last_name: last_name, genre: genre)
  end

  def method_missing(method_name, *arguments, &block)
    if method_name.to_s =~ /author_(.*)/
      author.send($1, *arguments, &block)
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    method_name.to_s.start_with?('author') || super
  end

  genres = %w(fiction coding history)

  genres.each do |genre|
    define_method("#{genre}_details") do |arg|
      puts genre
      puts arg
      puts genre.object_id
    end
  end
end

author = Author.new
author.first_name="Will"
author.last_name="Riker"
author.genre="Sci-Fi"

p author.author_genre
p author.respond_to?("author_isbn")
p author.coding_details("Uncle Bob")
