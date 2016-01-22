module SampleBastionPlugin
  module Authorization
    module Sample
      extend ActiveSupport::Concern

      include Authorizable

      def readable?
        authorized?(:view_samples)
      end

      def editable?
        authorized?(:edit_samples)
      end

      def deletable?
        authorized?(:destroy_samples)
      end

      module ClassMethods
        def readable
          authorized(:view_samples)
        end

        def readable?
          User.current.can?(:view_samples)
        end

        def editable
          authorized(:edit_samples)
        end

        def deletable
          authorized(:destroy_samples)
        end

        def any_editable?
          authorized(:edit_samples).count > 0
        end
      end
    end
  end
end
