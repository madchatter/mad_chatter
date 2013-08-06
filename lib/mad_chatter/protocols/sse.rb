require 'redis'
require 'sinatra/base'

module MadChatter
  module Protocols
    class SSE < Sinatra::Base

      def send_message(json)
        "id: #{Time.now}\n" +
        "data: #{json}" +
        "\r\n\n"
      end

      get '/rooms/:id/subscribe', provides: 'text/event-stream' do
        room_id = params['id']
        stream(:keep_open) do |connection|
          Redis.new.subscribe("madchatter:rooms:#{room_id}") do |on|
            on.message do |channel, json|
              connection << send_message(json)
            end
          end
        end
      end

    end
  end
end