# request_faker.rb
class RequestFaker
  attr_reader :params, :content_length, :body, :remote_ip, :original_url, :user_agent, :cookies, :referer, :headers,
              :cookie_jar

  def initialize(**options)
    @params = options[:params] || {}
    @headers = options[:headers] || {}
    @content_length = options[:content_length] || 10
    @body = options[:body] || StringIO.new('fake')
    @remote_ip = options[:remote_ip] || '1.1.1.1'
    @original_url = options[:original_url] || '/'
    @user_agent = options[:user_agent] || 'Agent/Fake'
    @cookies = options[:cookies] || {}
    @cookie_jar = options[:cookie_jar] || {}
    @referer = options[:referer] || 'example.com'

    @options = options
  end
end
