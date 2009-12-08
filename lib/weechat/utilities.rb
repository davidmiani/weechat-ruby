module Weechat
  module Utilities
    def self.evaluate_call
      begin
        yield
      rescue Weechat::Exception::WEECHAT_RC_OK
        return Weechat::WEECHAT_RC_OK
      rescue Weechat::Exception::WEECHAT_RC_OK_EAT
        return Weechat::WEECHAT_RC_OK_EAT
      rescue Weechat::Exception::WEECHAT_RC_ERROR
        return Weechat::WEECHAT_RC_ERROR
      end

      return Weechat::WEECHAT_RC_OK
    end
    def self.apply_transformation(property, value, transformations)
      transformation = transformations.find {|properties, transformation|
        properties.include?(property.to_sym)
      }

      if transformation
        transformation[1].call(value)
      else
        value
      end
    end
  end
end
