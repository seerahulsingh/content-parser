require 'nokogiri'
require 'open-uri'

class Parser
  def initialize(url)
    @url = url
    @document = Nokogiri::HTML(open(@url))
    @parsable_tags = ["h1", "h2", "h3"]
  end

  def get_contents
    contents = []
    @parsable_tags.each do |tag|
      @document.css(tag).each do |el|
        contents << { tag: tag, text: el.text.strip } if !el.text.blank?
      end
    end

    @document.css('a').each do |el|
      href = el["href"]
      if !href.blank?
        href = prepare_href(href)
        contents << { tag: 'a', text: href } if parsed_href_valid?(href)
      end
    end

    return contents
  end

  def parsed_href_valid?(href)
    href =~ URL_REGEX
  end

  def prepare_href(href)
    host = URI.parse(@url).host

    if (!href.include?("http") || !href.include?("https")) && href =~ /\b(\/\/)?[^\/:]+\/.*/
      href = "http://#{host}" + href
    end

    href
  end
end
