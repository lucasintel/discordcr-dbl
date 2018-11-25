require "raze"

module Dbl
  class Authenticator < Raze::Handler
    def initialize(@authorization : String)
    end

    def call(ctx, done)
      return unless ctx.request.headers["Authorization"] == @authorization
      done.call
    end
  end

  class Server
    def initialize(@authorization : String, @port = 3500)
      post "/", Authenticator.new(@authorization) do |ctx|
        payload = Payload.from_json(ctx.request.body.as(IO))
        @handlers.each(&.call(payload))
      end

      Raze.config.env = "production"
      Raze.config.logging = false
      Raze.config.port = @port

      spawn Raze.run
    end

    @handlers = [] of Payload ->
    def on_vote(&handler : Payload ->)
      @handlers << handler
    end
  end
end
