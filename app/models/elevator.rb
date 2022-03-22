class Elevator < ApplicationRecord
  belongs_to :column, dependent: :destroy

  after_update :printTest

  def printTest
    puts "----------------------------------------------THE PROCESS START-------------------------------------------------------"
    isItDown
  end
  
  def isItDown
    puts "----------------------------------------------isItDown Function START-------------------------------------------------------"
    if self.status == "Intervention"
      send_texto
    end
  end

  def send_texto
    puts "----------------------------------------------send_texto Function START-------------------------------------------------------"
    account_sid = ENV["account_sid"]
    auth_token = ENV["auth_token"]
    @client = Twilio::REST::Client.new(account_sid, auth_token) 

    message = @client.messages.create( 
                         body: 'An elevator is down Perry, could you take a look!', 
                         from: '+19362431788', 
                         messaging_service_sid: 'MGcce2abc02811ce660f3aac244eda0d2f',      
                         to: '4505014090' 
                       ) 
    puts message.sid
  end
end
