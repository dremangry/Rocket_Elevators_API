require 'slack-notifier'

class Elevator < ApplicationRecord
  belongs_to :column, dependent: :destroy
  after_update :statusChange


  def statusChange
    if self.status == "valid"
      puts "This Elevator's status changed to valid"
      slacknotifier = Slack::Notifier.new "https://hooks.slack.com/services/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"
      slacknotifier.ping "Elevator (#{self.id}): Status changed to #{self.status}", channel: "#slack-notifier-api", username: "RocketElevators"

    else self.status == "invalid"
      slacknotifier = Slack::Notifier.new "https://hooks.slack.com/services/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"
      slacknotifier.ping "Elevator (#{self.id}): Status changed to #{self.status}", channel: "#slack-notifier-api", username: "RocketElevators"
      # , icon_emoji: ':rocket:'
    end
  end

end 