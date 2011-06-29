require 'net/http'

$LOAD_PATH.unshift(File.dirname(__FILE__) + "/captchatrader")

require 'error'
require 'submission'
require 'api'

module Captchatrader
  VERSION = File.read(File.dirname(__FILE__) + "/../version.txt")
end