require 'active_support/core_ext'

module DryModel
  autoload :VERSION, 'dry_model/version'
  autoload :Application, 'dry_model/application'

  class << self
    attr_accessor :application
    def application
      @application ||= DryModel::Application.new
    end
    def setup
      
      puts "Its here"
      application.setup!
      yield application
    end
    delegate :register, to: :application
  end
end
