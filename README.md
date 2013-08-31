# DocToPdf
[![Gem Version](https://badge.fury.io/rb/doc_to_pdf.png)](http://badge.fury.io/rb/doc_to_pdf)
[![Code Climate](https://codeclimate.com/github/rderoldan1/doc_to_pdf.png)](https://codeclimate.com/github/rderoldan1/doc_to_pdf)
[![Coverage Status](https://coveralls.io/repos/rderoldan1/doc_to_pdf/badge.png)](https://coveralls.io/r/rderoldan1/doc_to_pdf)
[![Build Status](https://travis-ci.org/rderoldan1/doc_to_pdf.png?branch=master)](https://travis-ci.org/rderoldan1/doc_to_pdf)

GEM to export rdoc in a pdf file using [wkhtmltopdf libary](http://code.google.com/p/wkhtmltopdf/)

## Instalation

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

    $ rake doc:pdf file=myNewFile
    Loading pages (1/5)
    Resolving links (2/5)
    Counting pages (3/5)
    Printing pages (5/5)
    Done

![Imgur](http://i.imgur.com/w8agvbY.png)

In my case the menu based in the left is more than 4 pages, and the links doesn't work.


Also it offer an option to clean the "_innecessary_" html, only pass the param `clean=true (default is false)`

    $ rake doc:pdf clean=true
    clean html, this could take a while.
    Loading pages (1/5)
    Resolving links (2/5)
    Counting pages (3/5)
    Printing pages (5/5)
    Done
    
_WARNING_: This option change your html files    
    

![Imgur](http://i.imgur.com/SOq9nm7.png)

Now it looks cleanner :D

The pdf file is saved in your application root

## Recomendations

* use annotate to comment your models and routes files, [please take a look](https://github.com/ctran/annotate_models)
* I created a css for prettier in order to cusmotize more like gituh, the file is in [this gist](https://gist.github.com/rderoldan1/6396578#file-rdoc-css-L1), if
you like to use it replace the custom css.
 improvements:
 - Code highlight
 - Text formating
 - Fresh colors

How the css looks?

![Imgur](http://i.imgur.com/bQGrVCa.png)

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
