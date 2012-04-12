module Refinery
  module SmartPages
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::SmartPages

      engine_name :refinery_smart_pages

      initializer "register refinerycms_smart_pages plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "smart_pages"
          plugin.pathname = root
          plugin.hide_from_menu = true
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::SmartPages)
      end

      config.to_prepare do
        Refinery::Page.class_eval do
          after_save :reorganise_parts
          after_update :reorganise_parts

          private

          def reorganise_parts
            new_parts = Refinery::Pages.default_parts_for(self)

            parts.each do |part|
              part.destroy unless new_parts.include?(part.title)
            end

            new_parts.each_with_index do |part, index|
              unless parts.map(&:title).include?(part)
                self.parts << Refinery::PagePart.new(:title => part, :position => index)
              end
            end
          end
        end

        Refinery::PagePart.class_eval do
          def to_i18n_key
            title.downcase.gsub(/\W/, '_')
          end
        end
      end
    end
  end
end
