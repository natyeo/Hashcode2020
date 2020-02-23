class LibraryScanner
  def initialize filename
    @filename = filename
    File.open filename do |file|
      @book_number, @lib_number, @days = file.readline.chomp.split(' ').map(&:to_i)
      @books = file.readline.chomp.split(' ').map(&:to_i)
      @libraries = []
      @lib_number.times do |i|
        lib = {index: i}
        lib[:book_number], lib[:sign_up], lib[:books_per_day] =
          file.readline.chomp.split(' ').map(&:to_i)
        lib[:books] = file.readline.chomp.split(' ').map(&:to_i)
        @libraries << lib
      end
    end
  end

  def run
    sort_libraries
    sort_books
    remove_dups
    output
  end

  def output
    filename = @filename.gsub('.txt', '_output.txt').gsub('inputs', 'outputs')

    File.open(filename, 'w') do |file|
      file.puts @libraries.length
      @libraries.each do |lib|
        file.puts "#{lib[:index]} #{lib[:books].length}"
        file.puts lib[:books].map(&:to_s).join(' ')
      end
    end
  end

  def sort_books
    @libraries.each { |lib| lib[:books].sort! { |a, b| @books[b] <=> @books[a] } }
  end

  def sort_libraries
    @libraries.sort! do |a, b|
      [a[:sign_up], b[:book_number] ] <=> [ b[:sign_up], a[:book_number]]
    end
  end

  def remove_dups
    books = {}
    @libraries.each do |lib|
      lib[:books].select! do |book|
        book_exists(books, book)
      end
    end

    @libraries.select! do |lib|
      lib[:books].length > 0
    end
  end

  def book_exists(books, book)
    unless books[book]
      books[book] = true
      return true
    end
    false
  end
end
