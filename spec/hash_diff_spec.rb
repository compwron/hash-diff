require 'simplecov'
SimpleCov.start do
  coverage_dir 'simplecov'
end
require_relative "../lib/hash_diff"
require 'bigdecimal'
require 'bigdecimal/util'

describe 'Hash' do
  subject { [{1 => val1}.diff({1=> val2}), {1 => val2}.diff({1=> val1})] }

  context "with equal BigDecimals" do
    let(:val1) { 10.to_d }
    let(:val2) { 10.to_d }
    it "has empty diffs" do
      expect(subject).to eq([{}, {}])
    end
  end

  context "with unequal BigDecimals" do
    let(:val1) { 10.to_d }
    let(:val2) { 20.to_d }
    it "has diffs in both directions" do
      expect(subject).to eq([{1=>10.0}, {1=>20.0}])
    end
  end

  context "with BigDecimal and nil" do
    let(:val1) { 10.to_d }
    let(:val2) { nil }
    it "has diffs in both directions" do
      expect(subject).to eq([{1=>10.0}, {1=>nil}])
    end
  end

  context "with BigDecimal and non-BigDecimal" do
    let(:val1) { 10.to_d }
    let(:val2) { "hi" }
    it "has diffs in both directions" do
      expect(subject).to eq([{1=>10.0}, {1=>"hi"}])
    end
  end
end
