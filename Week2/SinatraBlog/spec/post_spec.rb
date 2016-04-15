#Rspec para blog.rb
require File.expand_path '../spec_helper.rb', __FILE__

RSpec.describe "Post" do
  let(:subject) {Post.new("hola_a", "2008/05/12", "aaaaaaa")}

	it "stores title for new post" do
    expect(subject.title).to eq("hola_a")
	end

	it "stores date for new post" do
    expect(subject.date).to eq("2008/05/12")
	end

    it "stores text for new post" do
    expect(subject.text).to eq("aaaaaaa")
  end
end


