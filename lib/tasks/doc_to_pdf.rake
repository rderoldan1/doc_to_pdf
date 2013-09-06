require 'nokogiri'
require 'colorize'
require 'httparty'

desc "Turn rdoc files in a pdf document"
namespace :doc do
  task :pdf do
    if validate_binary
      if ARGV.include?("help")
        puts help
        exit
      else
        file_name = ENV['file'] || 'doc'
        clean = ENV["clean"] || "false"
        css = ENV["css"] || "false"
        create(file_name, clean, css)
      end
    else
      puts "Error!\nPlease install wkhtmltopdf\nThis gem is tested in Mac and Linux".red
    end

  end
end

private

def create(name, clean, css)
  path = "#{Rails.root}/doc"
  files = get_files(path, "html")
  if clean.eql? "true"
    puts "clean html, this could take a while.".green
    files.each {|file| clean_html(file)}
  end
  if css.eql? "true"
    pretty_css
  end
  if files.empty?
    puts "Documentation not found in doc/ folder, please create it with rake doc:app or rdoc".orange
  else
    puts "Creating PDF documentation.".green
    `wkhtmltopdf -q -t --footer-center [page]/[topage] -O Landscape #{files.join(" ")} #{name}.pdf`
  end

end

def get_files(path, ext)
  Dir["#{path}/**/*.#{ext}*"]
end

def pretty_css
  puts "Changing default css created, this could take a while.".green
  path = "#{Rails.root}/doc"
  css = HTTParty.get("https://gist.github.com/rderoldan1/6396578/raw/110f829f59a6e8569ff3a2257187b1f35698be9a/rdoc.css").body
  css_file = get_files(path, "css")
  File.open(css_file.first, 'w'){|f| f.puts(css)}
end

def validate_binary
  which = `which wkhtmltopdf`
  $?.success?
end



def clean_html(path)
  doc = Nokogiri::HTML(open(path))
  doc.search("#classindex-section").try(:remove)
  doc.search("#project-metadata").try(:remove)
  doc.search("#home-metadata").try(:remove)
  doc.search("#search-section").try(:remove)
  doc.search("#home-section").try(:remove)

  File.open(path, "w"){|f| f.puts(doc)}
end

def help
  puts <<-EOF
Usage: rake doc:pdf <options>
    options:
      --file=yourName: change default pdf output name
      --clean=true,false: default is false, this delete "unnecessary" hmtl, like menu and search, please be careful, this option modify doc html files
      --css=tue,false: default false, this change default css for a prettier one
      --help, show this message
  EOF
end

