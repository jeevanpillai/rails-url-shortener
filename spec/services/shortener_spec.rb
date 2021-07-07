require "rails_helper"

RSpec.describe Shortener do
	
	it "shortens a given url to a 7 character lookup code" do
		url = "https://www.favouritewebsite.com/articles/how-to-cook"
		shortener = Shortener.new(url)
		expect(shortener.lookup_code.length).to eq(7)
	end

	it "it gives each url it's own lookup code" do
		url = "https://www.favouritewebsite.com/articles/how-to-cook"
		shortener = Shortener.new(url)
		code_1 = shortener.lookup_code

		url = "https://www.favouritewebsite.com/articles/how-to-bake"
		shortener = Shortener.new(url)
		code_2 = shortener.lookup_code

		expect(code_2).not_to eq(code_1)
	end

	it "generates a unique link record with a unique short lookup_code" do 
		url = "https://www.favouritewebsite.com/articles/how-to-cook"
		shortener = Shortener.new(url)
		link = shortener.generate_short_link
		expect(link.valid?).to eq(true)

		link2 = shortener.generate_short_link
		expect(link2.valid?).to be(true)
	end

end