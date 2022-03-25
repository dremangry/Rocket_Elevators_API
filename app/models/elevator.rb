require 'slack-notifier'

class Elevator < ApplicationRecord
  belongs_to :column, dependent: :destroy

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