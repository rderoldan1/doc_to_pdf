desc "Turn rdoc files in a pdf document"
namespace :doc do
  task :pdf do
    if validate_binarie
      file_name = ENV['file'] || 'doc'
      create(file_name)
    else
      puts "Error!\nPlease install wkhtmltopdf\nThis gem is tested in Mac and Linux"
    end

  end
end

private

def create(name)
  path = "#{Rails.root}/doc"
  files = get_files(path)
  if files.empty?
    puts "Documentation not found in doc/ folder, please create it with rake doc:app or rdoc"
  else
    `wkhtmltopdf -O Landscape #{files} #{name}.pdf`
  end

end

def get_files(path)
  Dir["#{path}/**/*.htm*"].join(" ")
end

def validate_binarie
  which = `which wkhtmltopdf`
  $?.success?
end
