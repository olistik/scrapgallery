require 'json'

module Transloadit

  class TemplateRepository
    TEMPLATES_PATH = "#{Rails.root}/lib/transloadit/templates"

    class << self

      def find(name)
        begin
          ::Transloadit::Template.new load(name)
        rescue Errno::ENOENT => e
          raise "The template '#{name}' is not available in the repository '#{TEMPLATES_PATH}'"
        end
      end

      private

      def load(name)
        JSON.parse(File.read(template_path(name)))
      end

      def template_path(name)
        "#{TEMPLATES_PATH}/#{name}.json"
      end

    end
  end

end
