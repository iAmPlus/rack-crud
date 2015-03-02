class Response
  class << self
    def ok
      Rack::Response.new '', 200
    end

    def ok_for body
      Rack::Response.new body, 200
    end

    def not_found_for body
      Rack::Response.new body, 404
    end

    def unprocessable_entity_for body
      Rack::Response.new body, 422
    end
  end
end