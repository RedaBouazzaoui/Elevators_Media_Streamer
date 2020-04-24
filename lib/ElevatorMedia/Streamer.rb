require 'open_weather'
require 'rest-client'
# require 'rspotify'
# require './spec/rails_helper.rb'


module ElevatorMedia
  class Streamer

      # method initialozing the sources or API keys for the API calls below
      def initialize
          @chuck_norris = 'http://api.icndb.com/jokes/random'
          @open_weather = ENV['open_weather_api']
          @Timer = 'http://worldtimeapi.org/api/timezone/America/Montreal'
      end

      # required method from week 10 Codeboxx file that renders interesting HTML content to the elevator's screens
      def getContent(type='weather')
          getHtmlFromCloud(type)
      end

      # method that returns a specific html depending on the "type" asked in the getContent method, is 'chuck_norris' by default
      def getHtmlFromCloud(type)
        if type == 'chuck_norris'  
          return "<div class='elevator-media-streamer-content'>#{JSON.parse(self.getChuckNorrisQuote)['value']['joke']}</div>"  
        end 
        if type == 'weather'  
          return "<div class='elevator-media-streamer-content'>#{self.getWeather}</div>"  
        end 
        if type == 'Timer'  
            html="<div class='elevator-media-streamer-content'>#{self.getTimer}</div>"  
            return html
          end 
      end

      # method that gets a random Chuck Norris quote/joke 
      def getChuckNorrisQuote
          @response = RestClient::Request.execute(method: :get, url: @chuck_norris, header: {})
      end

      # method that gets the weather for a specific city, Quebec in this case
      def getWeather
          options = { units: "metric", APPID: @open_weather }
          OpenWeather::Current.city(6077243, options)
      end

      # method that gets the weather forecast for a selected city, in this case Quebec city
      def getForecast
          options = { units: "metric", APPID: @open_weather }
          OpenWeather::Current.city(6077243, options)
      end

       # method that gets a Time 
       def getTimer
            @response = RestClient::Request.execute(method: :get, url: @Timer, header: {})
            return JSON.parse(@response)['datetime']
        end

      
     
      
  end
end