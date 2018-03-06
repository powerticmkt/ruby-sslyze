module SSLyze
  class XML
    module Attributes
      #
      # Provides methods for accessing the `title` XML attribute.
      #
      # @since 1.0.0
      #
      module Title
        #
        # The title.
        #
        # @return [String, nil]
        #   The value of the `title` attribute.
        #
        def title
          @title ||= @node['title']
        end

        #
        # The title or an empty String.
        #
        # @return [String]
        #
        def to_s
          title || ''
        end
      end
    end
  end
end
