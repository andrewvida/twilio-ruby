##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Conversations
      class V1 < Version
        ##
        # Initialize the V1 version of Conversations
        def initialize(domain)
          super
          @version = 'v1'
          @conversations = nil
        end
        
        def conversations(sid=:unset)
          if sid == :unset
            @conversations ||= ConversationList.new self
          else
            ConversationContext.new sid
          end
        end
        
        ##
        # Provide a user friendly representation
        def to_s
          #<Twilio::REST::Conversations::V1>
        end
      end
    end
  end
end