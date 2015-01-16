require 'open-uri'

module HeroPicker
  module Command
    class Fetcher
      def initialize(url)
        @url = valid_url(url)
      end

      def fetched_data
        open(@url, "Accept-Language" => "en-US,en;q=0.8,vi;q=0.6").read
      end

      protected
      def valid_url(url)
        URI.extract(url).first.tap do |u|
          raise ArgumentError.new("Invalid URL: #{url}") if u.nil?
        end
      end
    end
  end
end
