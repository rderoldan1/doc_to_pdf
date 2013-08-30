# DocToPdf
[![Gem Version](https://badge.fury.io/rb/doc_to_pdf.png)](http://badge.fury.io/rb/doc_to_pdf)
[![Code Climate](https://codeclimate.com/github/rderoldan1/doc_to_pdf.png)](https://codeclimate.com/github/rderoldan1/doc_to_pdf)
[![Code Climate](https://codeclimate.com/github/rderoldan1/doc_to_pdf.png)](https://codeclimate.com/github/rderoldan1/doc_to_pdf)

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'doc_to_pdf'

if you like it works only in your dev env, include in your dev group in Gemfile:

    group :development do
       gem 'doc_to_pdf'
    end

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install doc_to_pdf

## Usage

First create rdoc documetation with rdoc as you actually do:

    #all your app
    rdoc

    #only app/ folder
    rake doc:app

The gem include a rake task under `doc` namespace

    rake doc:pdf

If you like to change the default name "doc.pdf" call the programm with file param:

    rake doc:pdf file=myNewName

## Tested with


##### OS
Mac OS - Mountain Lion
Ubuntu - 12.04

#### Ruby env
Ruby 1.9.3
Rails 3.2.13

#### Binaries
wkhtmltopdf 0.0.9



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
