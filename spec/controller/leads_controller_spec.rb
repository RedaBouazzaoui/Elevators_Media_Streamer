
require 'rails_helper'
require 'spec_helper'
require './app/controllers/leads_controller'

RSpec.describe "LeadsControllers", :type => :controller do
     let!(:lead){Lead.new}
    
    # Testing if the leads controller returns a succesful HTTP response
    it"should give back a 200 succesful HTTP response" do
        expect(@response.status).to eq (200)
    end

    # Testing if the leads controller returns successful response and an actual lead object 
    # (uncomment the 'p lead line' to see it in the console)
    it "leads controller should succesfully return an lead object " do
        expect(lead).to_not eq(nil)
        #p lead
    end
end
