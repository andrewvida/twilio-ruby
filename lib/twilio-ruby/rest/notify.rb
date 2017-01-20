##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Notify < Domain
      ##
      # Initialize the Notify Domain
      def initialize(twilio)
        super
        
        @base_url = 'https://notify.twilio.com'
        @host = 'notify.twilio.com'
        @port = 443
        
        # Versions
        @v1 = nil
      end
      
      ##
      # Version v1 of notify
      def v1
        @v1 ||= V1.new self
      end
      
      def credentials
        self.v1.credentials
      end
      
      def services
        self.v1.services
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio::REST::Notify>'
      end
    end
  end
end