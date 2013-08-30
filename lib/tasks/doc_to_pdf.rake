desc "Turn rdoc files in a pdf document"
namespace :doc do
  app :pdf do
    file_name = ENV['file'] || 'doc'
    create(file_name)
  end
end

private

def create(name)
  p name
end
