require_relative '../lib/app'

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

describe "the names_crypto method" do
  it "should give at least 15 names" do
    expect((names_crypto(page)).length).to be > 15
  end
end

describe "the names_method" do
  it "should not raise errors" do
    expect{names_crypto(page)}.to_not raise_error(StandardError)
  end
end

describe "the values_crypto method" do
  it "should give at least 15 values" do
    expect((values_crypto(page)).length).to be > 15
  end
end
