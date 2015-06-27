require 'spec_helper'

RSpec.describe ServiceMonster::Client::Jobs do
  
  before do
    @client = ServiceMonster.client({api_key: "Q0xfQVBJVVNFUjoyYnNtYkU1ZjJONHNOUGo="})
  end

  describe '#jobs' do

    before do
      stub_get("jobs").to_return(
      body: fixture('jobs.json'), 
      :headers => {
            :content_type => "application/json; charset=utf-8", 
            authorization: 'Basic Q0xfQVBJVVNFUjoyYnNtYkU1ZjJONHNOUGo='}
      )
    end

    it 'should return a list of jobs' do
      @client.jobs
      #expect(a_get("jobs")).to have_been_made
      stub_get("jobs").to_return(
      body: fixture('jobs.json'), 
      :headers => {
            :content_type => "application/json; charset=utf-8", 
            authorization: 'Basic Q0xfQVBJVVNFUjoyYnNtYkU1ZjJONHNOUGo='}
      )
      #expect(stub_get("jobs")).to output.to_stdout
    end
  end
  
  describe '#jobs_filter' do
    before do
      stub_get("jobs?wField=actualDateTimeEnd&wOperator=gt&wValue=2015-03-19").to_return(
        body: fixture('jobs_filtered.json'),
        :headers => {
           :content_type => "application/json; charset=utf-8",
           authorization: 'Basic Q0xfQVBJVVNFUjoyYnNtYkU1ZjJONHNOUGo=' }
      )
    end
    
    it 'should return a list of filtered jobs' do
     #@client.jobs({wField: "actualDateTimeEnd", wOperator: "gt", wValue: "2015-03-19"})
     #expect(a_get("jobs?wField=actualDateTimeEnd&wOperator=gt&wValue=2015-03-19")).to have_been_made
    end
  end

end
