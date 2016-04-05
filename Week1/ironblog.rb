#Ironblog
require 'colorize'

class Blog
	attr_reader :posts
	def initialize
		@posts = []
		@present_page = 0
	end

	def add_post(post)
		@posts.push(post)
	end

	def order_date
		@posts.sort {|post1, post2| post2.date <=> post1.date}
	end

	def changing_pages
		option_of_change = gets.chomp
		if option_of_change == "Next" && @present_page!=total_num_of_pages-1
			@present_page +=1
		elsif option_of_change == "Prev" && @present_page!=0
			@present_page -=1
		else
			puts "Incorrect, type again!"
			changing_pages
		end
		publish_front_page
	end

	def total_num_of_pages
		if @posts.length%3!=0
			total_pages = @posts.length/3+1
		else
			total_pages = @posts.length/3
		end
		total_pages
	end

	def printing_num_of_pages
		(1..total_num_of_pages).each do|page| 
			if page == @present_page+1
				print "#{page}  ".yellow
			else
				print "#{page}  "
			end
		end
	end

	def printing_previous_next
		if @present_page==0
			puts "\n> Next"
		elsif @present_page==total_num_of_pages-1
			puts "\nPrev <"
		else
			puts "\nPrev < > Next"
		end
	end

	def publish_front_page

		posts_by_date = order_date
		posts_by_date_page = posts_by_date.slice(@present_page*3, 3)

		posts_by_date_page.each do |post|
			if post.sponsored
				puts "******#{post.title}******\n**************"
				puts "#{post.text}\n----------------"
			else
				puts "#{post.title}\n**************"
				puts "#{post.text}\n----------------"
			end
		end

		printing_num_of_pages

		if total_num_of_pages!=1
			printing_previous_next
			changing_pages
		end		
	end
end

class Post
	attr_reader :title, :date, :text, :sponsored
	def initialize(title, date, text, sponsored) 
		@title = title
		@date = date
		@text = text
		@sponsored = sponsored
	end
end

blog1 = Blog.new
blog1.add_post Post.new("hola_a", "2008/05/12", "aaaaaaa", false)
blog1.add_post Post.new("hola_b", "2009/07/12", "bbbbbbb", true)
blog1.add_post Post.new("hola_c", "2008/05/10", "ccccccc", false)
blog1.add_post Post.new("hola_d", "2008/02/11", "dddddddd", false)
blog1.add_post Post.new("hola_e", "2011/02/12", "eeeeeee", true)
blog1.add_post Post.new("hola_f", "2001/08/12", "ffffffff", false)
blog1.add_post Post.new("hola_g", "2008/09/02", "ggggggg", true)
blog1.add_post Post.new("hola_h", "2015/11/12", "hhhhhhh", false)

blog1.publish_front_page

