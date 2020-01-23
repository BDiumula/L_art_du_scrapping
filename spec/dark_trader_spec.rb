require_relative '../lib/dark_trader'


page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
crypto_array_names =[ ]
crypto_array_price =[ ]

describe "the array_names method" do
  it "extrat an array of crypto names" do
    expect(array_names(page, crypto_array_names)).not_to be_nil
  end
end

describe "the array_price method" do
  it "extrat an array of crypto prices" do
    expect(array_price(page,crypto_array_price)).not_to be_nil
  end
end