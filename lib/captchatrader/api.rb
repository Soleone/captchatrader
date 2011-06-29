module Captchatrader
  module API
    extend self
    
    BASE_URL = "http://api.captchatrader.com"
    SUBMIT_TYPES = [:url, :file]
    
    attr_accessor :username, :password, :api_key
    
    def submit(image, type, match = nil)
      raise ArgumentError, "type must be one of #{SUBMIT_TYPES.join(', ')}" unless SUBMIT_TYPES.include?(type.to_sym)

      params = {
        :value    => image,
        :type     => type,
        :api_key  => API.api_key,
        :username => API.username,
        :password => API.password
      }
      params[:match] = match if match
      
      response = post("#{BASE_URL}/submit", params)
      parse_response(response, :submit, :image => image)
    end
    
    def respond(ticket, correct)
      params = {
        :ticket     => ticket,
        :is_correct => correct,
        :username   => API.username,
        :password   => API.password
      }
      response = post("#{BASE_URL}/respond", params)
      parse_response(response, :respond)
    end
    
    def credits
      response = get("#{BASE_URL}/get_credits/username:#{API.username}/password:#{API.password}/")
      parse_response(response, :credits)
    end
    
    
    private
    
    def get(url)
      url = URI.parse(url)
      response = Net::HTTP.start(url.host, url.port) do |http|
        http.get(url.request_uri)
      end
      response.body
    end
    
    def post(url, params)
      url = URI.parse(url)
      post = Net::HTTP::Post.new(url.request_uri)
      post.set_form_data(params)
      response = Net::HTTP.start(url.host, url.port) do |http|
        http.request(post)
      end
      response.body
    end
    
    def parse_response(response, type, options = {})
      raise API::Error, "Unexpected response from captchatrader: #{response}" unless response =~ /\A\[.+\]\z/ 
      
      code, details = response[1..-2].split(/ *, */)
      raise API::Error, details.to_s[1..-2] if code.to_i == -1
      
      case type
      when :credits
        details.to_i
      when :submit
        Submission.new(details.to_s[1..-2], code.to_i, options[:image])
      when :respond
        code.to_i == 0
      end
    end
  end
end