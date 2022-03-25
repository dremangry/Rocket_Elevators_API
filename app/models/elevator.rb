require 'slack-notifier'

class Elevator < ApplicationRecord
  belongs_to :column, dependent: :destroy

  after_update :printTest

  def printTest
    isItDown
  end
  
  def isItDown
    if self.status == "Intervention"
      send_texto
    end
  end

  def send_texto
    account_sid = ENV["account_sid"]
    auth_token = ENV["auth_token"]
    @client = Twilio::REST::Client.new(account_sid, auth_token) 

    message = @client.messages.create( 
                         body: 'An elevator is down Perry, could you take a look!', 
                         from: '+19362431788', 
                         messaging_service_sid: 'MGcce2abc02811ce660f3aac244eda0d2f',      
                         to: '5142390177' 
                       ) 
    puts message.sid
  end
  # after_update :statusChange

  before_update do
    if self.status_changed? == true
      @old_status = self.status_was
      statusChange
    end
  end

  def statusChange
    if self.status == "valid"
      puts "This Elevator's status changed to valid"
      slacknotifier = Slack::Notifier.new(ENV["SLACK_NOTIFIER_URL"])
      slacknotifier.ping "The Elevator #{self.id} with Serial Number #{self.serial_number} changed status from #{@old_status} to #{self.status}", channel: "#slack-notifier-api", username: "RocketElevators"

    else self.status == "invalid"
      slacknotifier = Slack::Notifier.new(ENV["SLACK_NOTIFIER_URL"])
      slacknotifier.ping "The Elevator #{self.id} with Serial Number #{self.serial_number} changed status from #{@old_status} to #{self.status}", channel: "#slack-notifier-api", username: "RocketElevators"
    end
  end

end 
