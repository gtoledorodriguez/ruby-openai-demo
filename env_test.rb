require "dotenv/load"

puts ENV.fetch("OPENAI_API_KEY")
