captchatrader
=============

Ruby bindings for the captchatrader.com API. Submit captcha images and retrieve the text as a string.


Features
--------

* Submit capture images and retrieve the text
* Notify server if text is correct to prevent charging credits on incorrectly detected captchas
* Retrieve amount of credits left

Usage
--------

    Captchatrader::API.username = "your-username"
    Captchatrader::API.password = "your-password-or-passkey"
    Captchatrader::API.api_key  = "your-applications-api-key"

    # Submit a capture image to retrieve the text
    captcha = Captchatrader::API.submit("http://example.com/link-to-image.jpg", :url)
    puts captcha.value  # => "capture text"
  
    # Tell the server that this captcha has been detected incorrectly (prevent charging credits)
    Captchatrader::API.respond(captcha.ticket, false)  # true
  
    # Credits left for this username
    Captchatrader::API.credits  # => 90

Install
-------

    gem install capturetrader
  
Requirements
------------

* None (only Mocha for running tests)

License
-------

The MIT License

Copyright (c) 2011 Dennis Theisen

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
