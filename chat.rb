require "http"
require "json"
require "dotenv/load"
require "openai"

pp "howdy"

client = OpenAI::Client.new(api_key: ENV.fetch("OPENAI_API_KEY"))

# Prepare an Array of previous messages
message_list = [
  {
    "role" => "system",
    "content" => "You are a helpful assistant,"
  }
]

input = ""

while input != "bye"
  puts "Hello! How can I help you today?"
  puts "--------------------------------------------------"

  input = gets.chomp

  if input != "bye"
    message_list.push({
      "role" => "user",
      "content" => input
    })

    
  end
end

# Call the API to get the next message from GPT
api_response = client.chat(
  parameters: {
    model: "gpt-3.5-turbo",
    messages: message_list
  }
)

pp api_response
