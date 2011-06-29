module Captchatrader
  module API

    # Holds responses for captcha submissions
    class Submission < Struct.new(:value, :ticket, :image)
      def to_s
        value
      end
    end
    
  end
end