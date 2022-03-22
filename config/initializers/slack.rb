require 'slack-notifier'

SLACK_NOTIFIER = Slack::Notifier.new "https://hooks.slack.com/services/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", 
channel: "#slack-notifier-api", username: "RocketElevators"

SLACK_NOTIFIER.ping "", channel: "#slack-notifier-api", icon_emoji: ':rocket:'

# message = "[check](https://www.google.ca) it <a href='https://www.google.ca'>out</a>", channel: "#slack-notifier-api"
# Slack::Notifier::Util::LinkFormatter.format(message)
# message2 = "<!slack-notifier-api> Posting on slack channel"
# SLACK_NOTIFIER.ping message2