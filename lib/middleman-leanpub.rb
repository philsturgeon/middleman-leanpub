require "middleman-core"
require "json"
require "net/http"
require "uri"

class LeanpubExtension < ::Middleman::Extension
  option :api_key, nil, 'LeanPub API Key to get private data'
  option :book, nil, 'Book to download data for'

  class HttpError < StandardError; end

  def initialize(app, options_hash={}, &block)
    super
  end

  def after_configuration
    uri = URI.parse("https://leanpub.com/#{options.book}.json?api_key=#{options.api_key}")

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)

    raise HttpError, response.body unless response.code.to_i == 200

    # Gimme dat JSON
    result = JSON.parse(response.body)
    
    filepath = File.join(app.root_path, app.config.data_dir, 'leanpub.yml')
    file = File.open(filepath, 'w') do |f|
      f.write("reader_count: #{result['total_copies_sold'].to_i}")
    end
  rescue HttpError
    puts "Shit did not go well with LeanPub"
  end
end

::Middleman::Extensions.register(:leanpub, LeanpubExtension)
