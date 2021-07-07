require 'rails_helper'

RSpec.describe Link, type: :model do

  it "it is valid if it has an original url and a lookup code" do
    link = Link.new(
      original_url: "https://www.favouritewebsite.com/articles/how-to-cook",
      lookup_code: "1234567"
    ) 
    expect(link.valid?).to be(true)
  end

  it "it is invalid if the url is not formatted properly" do
    link = Link.new(
      original_url: "dfglkhsofhsikfd",
      lookup_code: "1234567"
    ) 
    expect(link.valid?).to be(false)
  end

  it "it is invalid if it doesn't have a lookup code" do
    link = Link.new(
      original_url: "https://www.favouritewebsite.com/articles/how-to-cook"
    ) 
    expect(link.valid?).to be(false)
  end

  it "it is invalid if it doesn't have an original_url" do
    link = Link.new(
      lookup_code: "1234567"
    ) 
    expect(link.valid?).to be(false)
  end

  it "is invalid if the lookup code already exists" do
    link = Link.new(
      original_url: "https://www.favouritewebsite.com/articles/how-to-cook",
      lookup_code: "1234567"
    ) 
    link.save

    link_2 = Link.new(
      original_url: "https://www.favouritewebsite.com/articles/how-to-bake",
      lookup_code: "1234567"
    ) 
    
    expect(link_2.valid?).to be(false)   

  end

end
