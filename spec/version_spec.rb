require 'rspec'
require 'spec_helper'

describe 'VersionTest' do

  it 'should be the version number' do
    DocToPdf::VERSION
  end
end