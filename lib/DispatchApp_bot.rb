require 'telegram/bot'

token = ENV['TELEGRAM_BOT_TOKEN']
Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "I greeting traveler: #{message.from.first_name}")
    when '/github'
      bot.api.send_message(chat_id: message.chat.id, text: "Hey, our GitHub: https://github.com/katatsu12/dispatch")
    when '/good_bye'
      bot.api.send_message(chat_id: message.chat.id, text: "I hope to see you soon..")
    end
  end
end
