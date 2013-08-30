require 'rspec'
require 'spec_helper'

describe 'wkhmtltopdf' do

  it 'should validate wkhtmltopdf requirement' do
   which = `which wkhtmltopdf`
   $?.success?.should be true|false
  end
end