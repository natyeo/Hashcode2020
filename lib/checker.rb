
class Checker

  def score(input, submission)
    book_scores = IO.readlines(input)[1].split.map(&:to_i)
    submission_books
    submission.each do |book|
      IO.readlines(submission)[2].split.map(&:to_i)
    end
    # submission_1 = IO.readlines(submission)[2].split.map(&:to_i)
    # submission_2 = IO.readlines(submission)[4].split.map(&:to_i)
    array_1 = submission_1.map do |book|
      book_scores[book]
    end
    array_2 = submission_2.map do |book|
      book_scores[book]
    end
    array_1.reduce(:+) + array_2.reduce(:+)
  end
end
