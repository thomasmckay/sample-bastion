# TODO: is this copy of katello validators really needed?

module Apipie
  module Validator
    class TypeValidator
      def description
        @type.name
      end
    end
  end
end

module Apipie
  module Validator
    class HashValidator
      def description
        "Hash"
      end
    end
  end
end

module SampleBastionPlugin
  module Apipie
    module Validators
      class UndefValidator < ::Apipie::Validator::BaseValidator
        def validate(_value)
          true
        end

        def self.build(param_description, argument, _options, _block)
          if argument == :undef
            self.new(param_description)
          end
        end

        def description
          nil
        end
      end

      class NumberValidator < ::Apipie::Validator::BaseValidator
        def validate(value)
          value.to_s =~ /^(0|[1-9]\d*)$/
        end

        def self.build(param_description, argument, _options, _block)
          if argument == :number
            self.new(param_description)
          end
        end

        def error
          "Parameter #{param_name} expecting to be a number, got: #{@error_value}"
        end

        def description
          "number."
        end
      end

      class IdentifierValidator < ::Apipie::Validator::BaseValidator
        def validate(value)
          value = value.to_s
          value =~ /\A[\w| |_|-]*\Z/ && value.strip == value && (2..128).include?(value.length)
        end

        def self.build(param_description, argument, _options, _block)
          if argument == :identifier
            self.new(param_description)
          end
        end

        def error
          "Parameter #{param_name} expecting to be an identifier, got: #{@error_value}"
        end

        def description
          "string from 2 to 128 characters containing only alphanumeric characters, "\
          "space, '_', '-' with no leading or trailing space.."
        end
      end

      class BooleanValidator < ::Apipie::Validator::BaseValidator
        def validate(value)
          %w(true false True False).include?(value.to_s)
        end

        def self.build(param_description, argument, _options, _block)
          if argument == :bool
            self.new(param_description)
          end
        end

        def error
          "Parameter #{param_name} expecting to be a boolean value, got: #{@error_value}"
        end

        def description
          "boolean"
        end
      end
    end
  end
end
