require 'google/apis/calendar_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'

require 'fileutils'



class Reserva < ActiveRecord::Base
    
    
    @@OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
    @@APPLICATION_NAME = 'Reserva de Salas CIC/EST'
    @@CLIENT_SECRETS_PATH = File.absolute_path('./') + '/config/client_secret.json'
    @@CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                                 "reservasalascicest.yaml")
    @@SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY
    

    ##
    # Ensure valid credentials, either by restoring from the saved credentials
    # files or intitiating an OAuth2 authorization. If authorization is required,
    # the user's default browser will be launched to approve the request.
    #
    # @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
    def self.authorize
      FileUtils.mkdir_p(File.dirname(@@CREDENTIALS_PATH))
    
      client_id = Google::Auth::ClientId.from_file(@@CLIENT_SECRETS_PATH)
      token_store = Google::Auth::Stores::FileTokenStore.new(file: @@CREDENTIALS_PATH)
      authorizer = Google::Auth::UserAuthorizer.new(
        client_id, @@SCOPE, token_store)
      user_id = 'default'
      credentials = authorizer.get_credentials(user_id)
      if credentials.nil?
        url = authorizer.get_authorization_url(
          base_url: @@OOB_URI)
        puts "Open the following URL in the browser and enter the " +
             "resulting code after authorization"
        puts url
        code = gets
        credentials = authorizer.get_and_store_credentials_from_code(
          user_id: user_id, code: code, base_url: @@OOB_URI)
      end
      credentials
    end
    
    def self.initialize_google_calendar_api
        @service = Google::Apis::CalendarV3::CalendarService.new
        @service.client_options.application_name = @@APPLICATION_NAME
        @service.authorization = Reserva.authorize
        @calendar_id = 'primary'
    end
    
    def self.fetch_10_upcoming_events
        initialize_google_calendar_api
        response = @service.list_events(@calendar_id,
                               max_results: 10,
                               single_events: true,
                               order_by: 'startTime',
                               time_min: Time.now.iso8601)
        response
    end
    
    # def self.make_reservation(sala, datetime)
    #     initialize_google_calendar_api
    #     event = Google::Apis::CalendarV3::Event.new{
    #         summary: 'Reserva de sala: #{sala}',
    #         location: sala,
    #         description: '',
    #         start: {
    #             date_time: datetime,
    #             time_zone: 'America/Sao_Paulo',
    #         },
    #         end: {
    #             date_time: data,
    #             time_zone: 'America/Sao_Paulo',
    #         },
    #         recurrence: [
    #             'RRULE:FREQ=DAILY;COUNT=2'
    #         ],
    #         attendees: [
    #             {email: 'reservasalascic.est@gmail.com'},
    #         ],
    #         reminders: {
    #             use_default: false,
    #             overrides: [
    #                 {method' => 'email', 'minutes: 24 * 60},
    #                 {method' => 'popup', 'minutes: 10},
    #             ],
    #         },
    #     }
            
    #     response = @service.insert_event('primary', event)
    #     # puts "Event created: #{result.html_link}"
    #     response
    # end
end
