
require 'rails_helper'
require 'spec_helper'
require 'ElevatorMedia/Streamer'
require 'rest-client'
# require 'rspotify'
  @weather = {"coord":{"lon"=>-0.13,"lat"=>51.51},"weather":[{"id"=>800,"main"=>"Clear","description"=>"clear sky","icon"=>"01n"}],"base"=>"stations","main":{"temp"=>280.75,"feels_like"=>278.49,"temp_min"=>279.26,"temp_max"=>282.15,"pressure"=>1020,"humidity"=>81},"visibility"=>10000,"wind":{"speed"=>1.5},"clouds":{"all"=>0},"dt"=>1587611774,"sys":{"type":1,"id"=>1414,"country"=>"GB","sunrise"=>1587617225,"sunset"=>1587669006},"timezone"=>3600,"id"=>2643743,"name"=>"London","cod"=>200}

describe ElevatorMedia::Streamer do
    
    let!(:streamer){ElevatorMedia::Streamer.new}

    # Testing if a first basic test gives back a successful response
    it "a first test to initialize environment" do
        expect(true).to be true
    end

    # Testing if the required getContent method returns "interesting content"
    it "should receive a response from getContent" do
      # p streamer.getContent
        expect(streamer).to respond_to(:getContent)        
    end

    # Testing the required getContent method and what it returns
    describe "getContent behavior" do

        # Testing if the getContent method returns actual html content by expecting a String and a </div> tag
        it "should return a valid html" do    
            result = streamer.getContent()
            expect(result).to be_a(String)
            expect(result).to include('</div>')
        end

        # Testing if the getHtmlFromCloud method returns "interesting" html content described in the tests below
        it "should get interesting html content from internet" do
           expect(streamer).to receive(:getHtmlFromCloud)
           streamer.getContent()
        end

        # Testing if the default type of the getContent method returns 'chuck_norris' type content
        it "default content should be of 'chuck_norris' type" do
            expect(streamer).to receive(:getChuckNorrisQuote).and_return({value: {joke: 'Chuck Norris joke received'}}.to_json) 
            streamer.getContent('chuck_norris')
        end

        # Testing if the getContent method returns 'weather' type data if asked
        it "should be able to fetch weather data" do
            expect(streamer).to receive(:getWeather) {'<div>weather</div>'}
            streamer.getContent('weather')
        end
    end

    # Testing if the Chuck Norris database returns a succesful quote, printing a quote in the console
    it 'got response from Chuck Norris database' do
        json_response = JSON.parse(streamer.getChuckNorrisQuote)
        # p json_response
        expect(json_response["type"]).to eq("success")
    end

    # Testing if the open-weather API gives back a response (expecting a String)
    it 'got open-weather response' do
        current_weather = streamer.getWeather['weather'][0]['main']
        expect(current_weather).to_not eq(nil)
        expect(current_weather).to be_a(String)
    end

    # Testing if asking for a weather forecast gives back a response (expecting a String)
    it 'got open-weather forecast' do
        current_forecast = streamer.getForecast['weather'][0]['main']
        expect(current_forecast).to_not eq(nil)
        expect(current_forecast).to be_a(String)
    end

    it 'should receive a response from getTime' do
    #   p streamer.getTimer
      expect(streamer.getTimer).to_not eq(nil)
      expect(streamer.getTimer).to be_a(String)
      expect(streamer.getTimer).to include(Time.now.year.to_s , Time.now.day.to_s)
    end

  

end