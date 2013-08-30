require 'doc_to_pdf'
require 'rails'

module DocToPdf
  class Railtie < Rails::Railtie
    railtie_name :doc_to_pdf

    rake_tasks do
      load "tasks/doc_to_pdf.rake"
    end
  end
end