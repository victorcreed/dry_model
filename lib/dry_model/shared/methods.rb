require 'active_support/concern'
module DryModel
  module Shared
    module Methods
      extend ActiveSupport::Concern
      class_methods do

        def def_has_many(value, options={})
          has_many value, options
          accepts_nested_attributes_for value, reject_if: :all_blank, allow_destroy: true
        end

        def def_has_many_through(value, options={})
          def_has_many(options.fetch(:through))
          def_has_many(value, options)
        end
        def def_func(func_name, &block)
          define_method(func_name, &block)
        end
        %w(extra_columns blocked_columns).each do |col_name|
          attr_accessor col_name
          define_method "#{col_name}_list" do |list|
            instance_variable_set("@#{col_name}", list)
          end
          define_method col_name do 
            instance_variable_get("@#{col_name}") || []
          end
        end
        def whitelist_columns
          (column_names - blocked_columns) + extra_columns
        end
      end
    end
  end
end
