##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Notify < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          class UserList < ListResource
            ##
            # Initialize the UserList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The service_sid
            # @return [UserList] UserList
            def initialize(version, service_sid: nil)
              super(version)

              # Path Solution
              @solution = {
                  service_sid: service_sid
              }
              @uri = "/Services/#{@solution[:service_sid]}/Users"
            end

            ##
            # Retrieve a single page of UserInstance records from the API.
            # Request is executed immediately.
            # @param [String] identity The identity
            # @param [String] segment The segment
            # @return [UserInstance] Newly created UserInstance
            def create(identity: nil, segment: :unset)
              data = Twilio::Values.of({
                  'Identity' => identity,
                  'Segment' => segment,
              })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              UserInstance.new(
                  @version,
                  payload,
                  service_sid: @solution[:service_sid],
              )
            end

            ##
            # Lists UserInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [String] identity The identity
            # @param [String] segment The segment
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #                   guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
            #  the default value of 50 records.  If no page_size is                      defined
            #  but a limit is defined, stream() will attempt to read                      the
            #  limit with the most efficient page size,                      i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(identity: :unset, segment: :unset, limit: nil, page_size: nil)
              self.stream(
                  identity: identity,
                  segment: segment,
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams UserInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [String] identity The identity
            # @param [String] segment The segment
            # @param [Integer] limit Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to                      read the
            #  limit with the most efficient page size,                       i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(identity: :unset, segment: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  identity: identity,
                  segment: segment,
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields UserInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [String] identity The identity
            # @param [String] segment The segment
            # @param [Integer] limit Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when                       not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to read the
            #                       limit with the most efficient page size, i.e. min(limit, 1000)
            def each
              limits = @version.read_limits

              page = self.page(
                  page_size: limits[:page_size],
              )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of UserInstance records from the API.
            # Request is executed immediately.
            # @param [String] identity The identity
            # @param [String] segment The segment
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of UserInstance
            def page(identity: :unset, segment: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'Identity' => identity,
                  'Segment' => segment,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              UserPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of UserInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of UserInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              UserPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Notify.V1.UserList>'
            end
          end

          class UserPage < Page
            ##
            # Initialize the UserPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @param [String] service_sid The service_sid
            # @return [UserPage] UserPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of UserInstance
            # @param [Hash] payload Payload response from the API
            # @return [UserInstance] UserInstance
            def get_instance(payload)
              UserInstance.new(
                  @version,
                  payload,
                  service_sid: @solution[:service_sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Notify.V1.UserPage>'
            end
          end

          class UserContext < InstanceContext
            ##
            # Initialize the UserContext
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The service_sid
            # @param [String] identity The identity
            # @return [UserContext] UserContext
            def initialize(version, service_sid, identity)
              super(version)

              # Path Solution
              @solution = {
                  service_sid: service_sid,
                  identity: identity,
              }
              @uri = "/Services/#{@solution[:service_sid]}/Users/#{@solution[:identity]}"

              # Dependents
              @bindings = nil
              @segment_memberships = nil
            end

            ##
            # Deletes the UserInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Fetch a UserInstance
            # @return [UserInstance] Fetched UserInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              UserInstance.new(
                  @version,
                  payload,
                  service_sid: @solution[:service_sid],
                  identity: @solution[:identity],
              )
            end

            ##
            # Access the bindings
            # @return [UserBindingList] if a(n) UserBindingList object was created.
            # @return [UserBindingContext] if a(n) UserBindingContext object was created.
            def bindings(sid=:unset)
              if sid != :unset
                return UserBindingContext.new(
                    @version,
                    @solution[:service_sid],
                    @solution[:identity],
                    sid,
                )
              end

              unless @bindings
                @bindings = UserBindingList.new(
                    @version,
                    service_sid: @solution[:service_sid],
                    identity: @solution[:identity],
                )
              end

              @bindings
            end

            ##
            # Access the segment_memberships
            # @return [SegmentMembershipList] if a(n) SegmentMembershipList object was created.
            # @return [SegmentMembershipContext] if a(n) SegmentMembershipContext object was created.
            def segment_memberships(segment=:unset)
              if segment != :unset
                return SegmentMembershipContext.new(
                    @version,
                    @solution[:service_sid],
                    @solution[:identity],
                    segment,
                )
              end

              unless @segment_memberships
                @segment_memberships = SegmentMembershipList.new(
                    @version,
                    service_sid: @solution[:service_sid],
                    identity: @solution[:identity],
                )
              end

              @segment_memberships
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Notify.V1.UserContext #{context}>"
            end
          end

          class UserInstance < InstanceResource
            ##
            # Initialize the UserInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The service_sid
            # @param [String] identity The identity
            # @return [UserInstance] UserInstance
            def initialize(version, payload, service_sid: nil, identity: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'account_sid' => payload['account_sid'],
                  'service_sid' => payload['service_sid'],
                  'identity' => payload['identity'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'segments' => payload['segments'],
                  'url' => payload['url'],
                  'links' => payload['links'],
              }

              # Context
              @instance_context = nil
              @params = {
                  'service_sid' => service_sid,
                  'identity' => identity || @properties['identity'],
              }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @param [Version] version Version that contains the resource
            # @return [UserContext] UserContext for this UserInstance
            def context
              unless @instance_context
                @instance_context = UserContext.new(
                    @version,
                    @params['service_sid'],
                    @params['identity'],
                )
              end
              @instance_context
            end

            def sid
              @properties['sid']
            end

            def account_sid
              @properties['account_sid']
            end

            def service_sid
              @properties['service_sid']
            end

            def identity
              @properties['identity']
            end

            def date_created
              @properties['date_created']
            end

            def date_updated
              @properties['date_updated']
            end

            def segments
              @properties['segments']
            end

            def url
              @properties['url']
            end

            def links
              @properties['links']
            end

            ##
            # Deletes the UserInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Fetch a UserInstance
            # @return [UserInstance] Fetched UserInstance
            def fetch
              context.fetch
            end

            ##
            # Access the bindings
            # @return [bindings] bindings
            def bindings
              context.bindings
            end

            ##
            # Access the segment_memberships
            # @return [segment_memberships] segment_memberships
            def segment_memberships
              context.segment_memberships
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Notify.V1.UserInstance #{values}>"
            end
          end
        end
      end
    end
  end
end