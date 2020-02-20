class Checker
  def score(input, submission)
    book_scores = IO.readlines(input)[1].split.map(&:to_i)
    line_count = `wc -l "#{submission}"`.strip.split(' ')[0].to_i
    line_number = 2
    submissions_books = []
    while line_number < line_count
      submissions_books << IO.readlines(submission)[line_number].split.map(&:to_i)
      line_number += 2
    end
    array = submissions_books.flatten.uniq.map do |book|
      book_scores[book]
    end
    array.reduce(:+)
  end
end
