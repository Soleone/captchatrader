
begin
  require 'bones'
rescue LoadError
  abort '### Please install the "bones" gem ###'
end

task :default => 'test:run'
task 'gem:release' => 'test:run'

Bones {
  name     'captchatrader'
  authors  'Dennis Theisen'
  email  'dennis@shopify.com'
  url  'http://github.com/Soleone/captchatrader'
  ignore_file  '.gitignore'
}

