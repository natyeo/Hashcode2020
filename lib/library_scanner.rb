class LibraryScanner
  def initialize filename
    @filename = filename
    File.open filename do |file|
      @book_number, @lib_number, @days = file.readline.chomp.split(' ').map(&:to_i)
      @books = file.readline.chomp.split(' ').map(&:to_i)
      @libraries = []
      @lib_number.times do
        lib = {}
        lib[:book_number], lib[:sign_up], lib[:books_per_day] =
          file.readline.chomp.split(' ').map(&:to_i)
        lib[:books] = file.readline.chomp.split(' ').map(&:to_i)
        @libraries << lib
      end
    end
  end

  def output
    filename = @filename.gsub('.txt', '_output.txt').gsub('inputs', 'outputs')

    File.open(filename, 'w') do |file|
      file.puts @lib_number
      @libraries.each_with_index do |lib, i|
        file.puts "#{i} #{lib[:books].length}"
        file.puts lib[:books].map(&:to_s).join(' ')
      end
    end
  end
end
