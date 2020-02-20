require 'checker'

describe Checker do
  let(:checker) { described_class.new }

  it 'takes input files and returns score' do
    expect(checker.score("./inputs/a_example.txt", "./submissions/example_submission.txt")).to eq 21
  end
end
