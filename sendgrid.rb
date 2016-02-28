require 'sendgrid-ruby'

client = SendGrid::Client.new do |c|
  c.api_key = ENV['SENDGRID_API_KEY']
end

mail = SendGrid::Mail.new do |m|
  m.to = 'samuelnkrause@gmail.com'
  m.from = 'samuelnkrause@gmail.com'
  m.subject = 'Hello Sam!'
  m.text = 'SendGrid works like a charm!'
end

response = client.send(mail)

puts response.code
puts response.body
