require 'rspec'
require 'spec_helper'

describe 'task ' do

  it 'should convert pdf' do
    require 'rake'
    Rake::Task["doc:pdf"].invoke
  end
end