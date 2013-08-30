require 'rspec'
require 'spec_helper'

describe 'wkhmtltopdf' do

  it 'should validate wkhtmltopdf requirement' do
   which = `which wkhtmltopdf`
   $?.success?.to_s.class.should be String
  end
end