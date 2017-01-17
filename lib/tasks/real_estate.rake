desc "Fetch real estate data"
task :fetch_real_estate => :environment do
  require 'nokogiri'
  require 'open-uri'
  url = "http://batdongsan.com.vn/nha-dat-ban-tp-hcm"
  prefix_url = "http://batdongsan.com.vn"
  # Require agent to open the webpage
  doc = Nokogiri::HTML(open(url, "User-Agent" => "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0"))
  
  
  
  # Get the link from each title
  
  doc.css(".p-title a").each do |link_file|
    #puts "#{prefix_url}#{link_file["href"]}"
    estate_data = "#{prefix_url}#{link_file["href"]}"
    doc = Nokogiri::HTML(open(estate_data, "User-Agent" => "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0"))
    puts doc.css("#LeftMainContent__productDetail_project+ div .right").text
    
  end
end
