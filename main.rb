require 'sinatra'
require "sendgrid-ruby"


get "/" do
  erb :home
end

get "/about" do
  erb :about
end

get "/contact" do
  erb :contact
end

post '/email' do
  @name = params["name"]
  @message = params["message"]
  email
  erb :contact
end

def email
  client = SendGrid::Client.new do |c|
    c.api_key = ENV['SENDGRID_API_KEY']
  end

  mail = SendGrid::Mail.new do |m|
    m.to = 'samuelnkrause@gmail.com'
    m.from = 'samuelnkrause@gmail.com'
    m.subject = @name
    m.text = @message
  end

  response = client.send(mail)
end

