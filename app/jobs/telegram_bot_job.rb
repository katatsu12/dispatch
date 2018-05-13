require 'telegram/bot'

class TelegramBotJob < ApplicationJob
  queue_as :default

  TOKEN = ENV['TELEGRAM_BOT_TOKEN']
  CHANNEL = ENV['TELEGRAM_BOT_CHANNEL']

  def perform_async_create(*args)
    puts TOKEN
    puts CHANNEL

    Telegram::Bot::Client.run(TOKEN) do |bot|
        bot.api.send_message(chat_id: CHANNEL, text: "Hello task was successful create")
    end
  end
end
