require 'spec_helper'

RSpec.describe ServiceMonster::Client::Reminders do
  
  before do
    @client = ServiceMonster.client({api_key: "Q0xfQVBJVVNFUjoyYnNtYkU1ZjJONHNOUGo="})
  end

  describe '#reminders' do

    before do
      stub_get("reminders").to_return(
      body: fixture('reminders.json'), 
      :headers => {
            :content_type => "application/json; charset=utf-8", 
            authorization: 'Basic Q0xfQVBJVVNFUjoyYnNtYkU1ZjJONHNOUGo='}
      )
    end

    it 'should return a list of reminders' do
      @client.reminders
      expect(a_get("reminders")).to have_been_made
    end
  end
  
  describe '#reminders_filter' do
    before do
      stub_get("reminders?wField=endDateTime&wOperator=gt&wValue=2015-05-19").to_return(
        body: fixture('reminders_filtered.json'),
        :headers => {
           :content_type => "application/json; charset=utf-8",
           authorization: 'Basic Q0xfQVBJVVNFUjoyYnNtYkU1ZjJONHNOUGo=' }
      )
    end
    
    it 'should return a list of filtered reminders' do
      @client.reminders({wField: "endDateTime", wOperator: "gt", wValue: "2015-05-19"})
      expect(a_get("reminders?wField=endDateTime&wOperator=gt&wValue=2015-05-19")).to have_been_made
    end
  end

end
