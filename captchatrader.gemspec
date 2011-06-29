Gem::Specification.new do |s|
  s.platform     = Gem::Platform::RUBY
  s.name         = 'captchatrader'
  s.version      = '0.1.0'
  s.summary      = 'Ruby bindings for the captchatrader.com API.'
  s.description  = 'Submit captcha images and retrieve the text as a string.'

  s.author = 'Dennis Theisen'
  s.email = 'soleone@gmail.com'
  s.homepage = 'http://github.com/Soleone/captchatrader'
  
  s.files = Dir['Changelog.md', 'README.md', 'version.txt', 'lib/**/*']
  s.require_path = 'lib'
  
  s.has_rdoc = true if Gem::VERSION < '1.7.0'
end
