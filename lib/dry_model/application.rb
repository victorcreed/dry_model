require 'dry_model/helpers/settings'
require 'dry_model/shared/methods'

module DryModel
  class Application
    include Settings
    include Settings::Inheritance
    setting :load_paths, [Rails.root.join("app", "dry_models")]

    def setup!
      files.each { |file| load(file) }
    end
    def files
      load_paths.flatten.compact.uniq.flat_map { |path| Dir["#{path}/**/*.rb"] }
    end

    def register(model, &block)
      model.send(:include, DryModel::Shared::Methods)
      model.class_eval(&block)
    end
  end
end
