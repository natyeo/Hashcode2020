require 'checker'

describe Checker do
  let(:checker) { described_class.new }

  it 'takes example input files and returns score of 21' do
    expect(checker.score("./inputs/a_example.txt", "./submissions/example_submission.txt")).to eq 21
  end

  it 'takes example 2 file and returns score of 16' do
    expect(checker.score("./inputs/a_example.txt", "./submissions/example2.txt")).to eq 16
  end
end
