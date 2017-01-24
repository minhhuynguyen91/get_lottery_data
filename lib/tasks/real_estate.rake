desc "Fetch real estate data"
task :fetch_real_estate => :environment do
  require 'nokogiri'
  require 'open-uri'
  require 'geocoder'
  prefix_url = "http://batdongsan.com.vn"
  #url = "http://batdongsan.com.vn/ban-nha-rieng"
  url = "http://batdongsan.com.vn/ban-nha-rieng-tp-hcm"
  # Require agent to open the webpage
  doc = Nokogiri::HTML(open(url, "User-Agent" => "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0"))
  
  
  
  # Get the link from each title
  
  doc.css(".p-title a").each do |link_file|
    estate_data = "#{prefix_url}#{link_file["href"]}"
    doc = Nokogiri::HTML(open(estate_data, "User-Agent" => "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0"))
    
    name   = doc.css("#LeftMainContent__productDetail_contactName .right").text.squish
    contact_numer = doc.css("#LeftMainContent__productDetail_contactMobile .right").text.squish
    #email  = doc.css("#LeftMainContent__productDetail_contactEmail > div.right > a").text
    #email  = doc.xpath("//*[@id=\"LeftMainContent__productDetail_contactEmail\"]/div[2]/a")
    
    email = "N/A"
    
    price = doc.css(".mar-right-15 strong").text.squish
    size  = doc.css(".mar-right-15+ .gia-title strong").text.squish
    
    
    address = doc.css(".left-detail div:nth-child(1) .right").text.squish
    
    name   = check_string(name)
    #number = check_string(number) 
    
    #puts estate_data
    
    #puts "#{name} - #{number} - #{address} - #{price} - #{size}"
    if Estate.find_by_url(estate_data).nil?
      Estate.create(:url => estate_data, :name => name, :email => email, :address => address, :number => contact_numer, :price => price, :size => size)
    end
    
    
  end
end

task :sample_uri => :environment do 
  require 'open-uri'
  require 'rest-client'
  
  agent = "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0"
  url = "http://batdongsan.com.vn/ban-nha-rieng-duong-nguyen-van-luong-1-phuong-16-3/go-vap-4ty-tret-lung-lau-doi-dien-lotte-mart-pr11180276"
  accept = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
  #doc = Nokogiri::HTML(open(url, "User-Agent" => agent, "Accept" => accept))
  page = Nokogiri::HTML(RestClient.get(url))
  puts page.class
  
  
end

def check_string (input_string)
  if input_string.to_s == ''
    return 'N/A'
  else
    return input_string
  end
end
