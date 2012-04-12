require 'refinerycms-core'

module Refinery
  autoload :SmartPagesGenerator, 'generators/refinery/smart_pages_generator'

  module SmartPages
    require 'refinery/smart_pages/engine'

    Refinery::Pages.config.types.register :standard do |standard|
      standard.parts = ["Body", "Side Body"]
    end
    Refinery::Pages.config.view_template_whitelist = ["standard"]
    Refinery::Pages.config.use_view_templates = true

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
