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
    output
  end

  def output
    filename = @filename.gsub('.txt', '_output.txt').gsub('inputs', 'outputs')

    File.open(filename, 'w') do |file|
      file.puts @lib_number
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
end
