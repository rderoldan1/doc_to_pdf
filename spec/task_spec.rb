require 'rspec'
require 'spec_helper'

describe 'task ' do

  it 'should convert pdf' do
    require 'rake'
    expect {Rake::Task["doc:pdf"].invoke}.to raise_error
  end
end