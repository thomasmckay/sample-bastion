module SampleBastionPlugin
  module Authorization
    module SampleModel
      extend ActiveSupport::Concern

      include Authorizable

      def readable?
        authorized?(:view_sample_models)
      end

      def editable?
        authorized?(:edit_sample_models)
      end

      def deletable?
        authorized?(:destroy_sample_models)
      end

      module ClassMethods
        def readable
          authorized(:view_sample_models)
        end

        def readable?
          User.current.can?(:view_sample_models)
        end

        def editable
          authorized(:edit_sample_models)
        end

        def deletable
          authorized(:destroy_sample_models)
        end

        def any_editable?
          authorized(:edit_sample_models).count > 0
        end
      end
    end
  end
end
