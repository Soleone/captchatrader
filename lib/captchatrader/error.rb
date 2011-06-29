module Captchatrader
  module API

    class Error < StandardError
      # submit
      API_KEY_DISABLED     = "The API key has been disabled, likely because it is not responding to CAPTCHAs correctly or is submitting too quickly"
      INSUFFICIENT_CREDITS = "The account provided does not have enough credits to complete the request"
      INTERNAL_ERROR       = "The server encountered an unexpected situation and the request was aborted"
      INVALID_API_KEY      = "The API key provided was not registered"
      INVALID_PARAMETERS   = "The request was not submitted correctly"
      INVALID_TYPE         = "The type argument was invalid"
      INVALID_USER         = "The username/password combination was incorrect"
      USER_NOT_VALIDATED   = "The user has not been validated or is banned"
      NOT_AN_IMAGE         = "The file or url uploaded was not detected to be a valid image"
      SUBMISSION_ERROR     = "An error occurred in the file upload"
      
      # respond
      INCORRECT_REPORTS    = "Too many negative responses were submitted in a short time frame"
      INVALID_TICKET       = "The type argument was invalid"
    end

  end
end