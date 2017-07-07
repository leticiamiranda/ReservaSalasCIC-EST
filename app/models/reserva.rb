require 'google/apis/calendar_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'

require 'fileutils'
require 'date'

class Reserva < ActiveRecord::Base
    
    
    @@OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
    @@APPLICATION_NAME = 'Reserva de Salas CIC/EST'
    @@CLIENT_SECRETS_PATH = File.absolute_path('./') + '/config/client_secret.json'
    @@CREDENTIALS_PATH = File.join(Dir.pwd, '.credentials',
                                 "reservasalascicest.yaml")
    @@SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR
    

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
      credentials
    end
    
    def self.initialize_google_calendar_api
        @service = Google::Apis::CalendarV3::CalendarService.new
        @service.client_options.application_name = @@APPLICATION_NAME
        @service.authorization = Reserva.authorize
        @calendar_id = 'primary'
    end
    
    def self.fetch_next_reservas
        initialize_google_calendar_api
        response = @service.list_events(@calendar_id,
                               single_events: true,
                               order_by: 'startTime',
                               time_min: Time.now.iso8601)
        response
    end
    
    def self.make_reservation(datahoraInicio,datahoraFim,sala,professor)
        initialize_google_calendar_api
        event = Google::Apis::CalendarV3::Event.new({
            summary: "Reserva de sala: #{sala}",
            location: sala,
            description: "Reserva para: #{professor}",
            start: {
                date_time: (DateTime.strptime(datahoraInicio, '%Y-%m-%dT%H:%M').to_time + 3.hours).to_datetime.rfc3339,
                time_zone: 'America/Sao_Paulo',
            },
            end: {
                date_time: (DateTime.strptime(datahoraFim, '%Y-%m-%dT%H:%M').to_time + 3.hours).to_datetime.rfc3339,
                time_zone: 'America/Sao_Paulo',
            },
        })
        @service.insert_event(@calendar_id, event)
    end
end
