module Dbl
  class ClientException < Exception
    getter response : HTTP::Client::Response

    delegate status_code, status_message, body, to: @response

    def initialize(@response : HTTP::Client::Response)
    end

    def message
      "#{@response.status_code} #{@response.status_message}"
    end
  end
end
