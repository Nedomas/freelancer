module Importer
  class ImportioWrapper
    IMPORT_GUID = '53486538-e372-467f-825a-ba3a78008aa9'
    IMPORT_API_KEY = 'JhC8d+xdlUCgS+yIjQ2MuSWTVUuBhP7LTXnvLi8Ri5kSOHgm1FbjZKr7OwlvlwyfZu44LTuaN4mK0RGLu8w1wA=='

    class << self
      def connect
        @client = Importio.new(IMPORT_GUID, IMPORT_API_KEY)
        @client.connect
      end

      def query(url, guid)
        connect

        @client.query(
          {
            'input' => {
              'webpage/url' => url,
            },
            'connectorGuids' => [guid],
          },
        callback)

        @client.join
        @client.disconnect

        @last_response
      end

      def callback
        # In order to receive the data from the queries we issue, we need to define a callback method
        # This method will receive each message that comes back from the queries, and we can take that
        # data and store it for use in our app
        lambda do |query, message|
          # Disconnect messages happen if we disconnect the client library while a query is in progress
          if message['type'] == 'DISCONNECT'
            puts 'The query was cancelled as the client was disconnected'
          end
          if message['type'] == 'MESSAGE'
            if message['data'].key?('errorType')
              # In this case, we received a message, but it was an error from the external service
              # puts 'Got an error!'
              # puts JSON.pretty_generate(message['data'])
            else
              # We got a message and it was not an error, so we can process the data
              # puts 'Got data!'
              @last_response = message
              # import_data(message)
              # puts JSON.pretty_generate(message['data'])
            end
          end

          if query.finished
            # puts 'Query finished'
          end
        end
      end
    end
  end
end
