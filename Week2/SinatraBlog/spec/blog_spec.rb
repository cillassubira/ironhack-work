#Rspec para blog.rb
require File.expand_path '../spec_helper.rb', __FILE__

RSpec.describe "Blog" do
	before(:each) do
		@sample_blog = Blog.new
		@sample_blog.add_post Post.new("hola_a", "2008/05/12", "aaaaaaa")
		@sample_blog.add_post Post.new("hola_b", "2009/07/12", "bbbbbbb")
		@sample_blog.add_post Post.new("hola_c", "2008/05/10", "ccccccc")
  end

  describe ".add_post" do
    it "stores an array of posts" do
      expect(@sample_blog.posts).to be_kind_of(Array)
    end
    it "checks the length of the array of posts equals num of posts added" do
      expect(@sample_blog.posts.length).to eq(3)
    end
    it "checks the length of the array of posts equals num of posts added" do
      expect(@sample_blog.posts[2].text).to eq("ccccccc")
    end
  end

  describe ".latest_posts" do
    it "orders newer to older the posts on the blog" do
      expect(@sample_blog.latest_posts[0].title).to eq("hola_b")
    end
  end
end
