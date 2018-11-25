require "http/client"
require "json"

module Dbl
  class Client
    BASE = URI.parse("https://discordbots.org")

    def initialize(authorization_token : String, bot : Discord::Client)
      @client = HTTP::Client.new(BASE)
      @cache = bot.cache.as(Discord::Cache)

      @client.before_request do |req|
        req.headers["Authorization"] = authorization_token
        req.headers["content-type"] = "application/json"
      end

      bot.on_ready do |payload|
        spawn(start)
      end
    end

    private def start
      loop do
        @client.post("/api/bots/stats", body: {server_count: @cache.guilds.size}.to_json)
        sleep 1800
      end
    end
  end
end
