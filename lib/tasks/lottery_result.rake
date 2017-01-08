desc "Fetch product prices"
task :fetch_lottery => :environment do

    require 'nokogiri'
    require 'open-uri'
    
    lottery_page  = []
    
    url = "http://vietlott.vn/vi/trung-thuong/ket-qua-trung-thuong/mega-6-45/winning-numbers/"
    doc = Nokogiri::HTML(open(url))
    
    doc.css(".pagination-sm li:nth-child(4) a , .pagination-sm .active+ li a , .pagination-sm .active a").each do |page|
      lottery_page.insert(0, page.text)
    end
    
    lottery_page.each do |page|
      
      url = "http://vietlott.vn/vi/trung-thuong/ket-qua-trung-thuong/mega-6-45/winning-numbers/?p=#{page}"
      doc = Nokogiri::HTML(open(url))
      
      
      lottery_result = []
      lottery_date  = []
      
      
      # Get lottery result number
      doc.css("td+td").each do |result|
        lottery = result.text.split
        lottery = lottery.join(" ")
        lottery_result << lottery
      end
      
      # Get lottery result date
      doc.css("td:nth-child(1)").each do |date|
        lottery = date.text
        lottery = lottery.strip
        lottery_date << lottery
      end
      
      # Initial database value, uncomment it if run it in first time
      index_size = lottery_date.size - 1
      lottery_date.each_with_index do |date, index|
        if Lottery.find_by_result_date(lottery_date[index_size - index]).nil?
          Lottery.create(:result_date => lottery_date[index_size - index], :result_no => lottery_result[index_size - index])
          #puts "#{lottery_date[index_size - index]} - #{lottery_result[index_size - index]}"
        end
      end
      
  
      #lottery_date.each_with_index do |date, index|
      #  if Lottery.find_by_result_date(lottery_date[index]).nil?
      #    # If the result is null -> create database
      #    Lottery.create(:result_date => lottery_date[index], :result_no => lottery_result[index])
      #  else 
      #    # Future usage
      #  end
      #end
  end
end