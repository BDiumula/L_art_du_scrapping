require 'nokogiri'
require 'open-uri'
require 'pry'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))


def array_names(page, crypto_array_names)
	
	page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody/tr/td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]').each do |symbol|
		symbol = symbol.text
		crypto_array_names << [symbol]
	end 
	return crypto_array_names
end



def array_price (page,crypto_array_price)
	
	page.xpath('//*[@id="__next"]/div/div[2]/div[1]/div[2]/div[2]/div[2]/div[3]/div/table/tbody/tr/td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]').each do |price|
		price = price.text
		crypto_array_price << [price]
	end
	return crypto_array_price
end


crypto_array_names =[ ]
crypto_array_price =[ ]

array_names(page, crypto_array_names)
array_price(page,crypto_array_price)
cryptos = crypto_array_names.zip(crypto_array_price).to_h

puts cryptos
