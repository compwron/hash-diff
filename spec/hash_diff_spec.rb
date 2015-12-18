# require 'spec_helper'
require 'simplecov'
SimpleCov.start do
  coverage_dir 'simplecov'
end
require_relative "../lib/hash_diff"
require 'bigdecimal'
require 'bigdecimal/util'

describe 'Hash' do
  let(:double10) { 10.to_d }
  let(:double20) { 20.to_d }
  it "??" do
    precision = 5
    plain = [nil, double10, double10, double20, 1].combination(2).map {|a, b|
      {a => b}.diff({b => a})
    }
    p plain

    with = [{nil=>double10, double10=>nil}, {nil=>double10, double10=>nil}, {nil=>double20, double20=>nil}, {nil=>1, 1=>nil}, {}, {double10=>double20, double20=>double10}, {double10=>1, 1=>double10}, {double10=>double20, double20=>double10}, {double10=>1, 1=>double10}, {double20=>1, 1=>double20}]
    expect(plain).to eq with
  end
end
