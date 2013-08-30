require 'rubygems'
require 'bundler/setup'
require 'coveralls'

Coveralls.wear! 'rails'
require 'rails'

require File.expand_path('../../lib/doc_to_pdf', __FILE__)



RSpec.configure do |config|
end
