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
  p name
  p Rails.root
end

def get_files

end

def validate_binarie
  which = `which wkhtmltopdf`
  $?.success?
end
