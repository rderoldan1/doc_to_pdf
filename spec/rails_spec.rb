require 'rspec'
require 'spec_helper'

describe 'rails_included' do
  it 'should validate if is included in rails' do
    Rails.class.should be Module
  end
end