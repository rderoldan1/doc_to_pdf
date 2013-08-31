require 'nokogiri'
require 'colorize'
desc "Turn rdoc files in a pdf document"
namespace :doc do
  task :pdf do
    if validate_binary
      file_name = ENV['file'] || 'doc'
      clean = ENV["clean"] || "false"
      create(file_name, clean)
    else
      puts "Error!\nPlease install wkhtmltopdf\nThis gem is tested in Mac and Linux".red
    end

  end
end

private

def create(name, clean)
  path = "#{Rails.root}/doc"
  files = get_files(path)
  if clean.eql? "true"
    puts "clean html, this could take a while.".green
    files.each {|file| clean_html(file)}
  end
  if files.empty?
    puts "Documentation not found in doc/ folder, please create it with rake doc:app or rdoc".orange
  else
    `wkhtmltopdf -O Landscape #{files.join(" ")} #{name}.pdf`
  end

end

def get_files(path)
  Dir["#{path}/**/*.htm*"]
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
