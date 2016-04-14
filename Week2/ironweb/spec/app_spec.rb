#Rspec para app.rb
require File.expand_path '../spec_helper.rb', __FILE__

RSpec.describe "The ironweb" do

	describe "index" do
		it "gives status 200 on index page" do
			get('/')
			expect(last_response.status).to be(200)
		end
	end

	describe "enrollment" do
		it "shows form to be filled by new user" do
			get('/enrollment')
			expect(last_response.body).to include("Enroll")		
		end

		it "stores new user info into session" do
			post('/enrollment', {name:"cillas"})
			expect(session[:name]).to include("cillas")
		end
	end

	describe "index user known" do
		it "shows intro to user and link to selected courses" do
			get('/enrollment')
			expect(last_response.status).to be(200)
		end
	end

	describe "show_courses" do
		# it "shows courses to user depending on level of experience" do
		# 	get('/show_courses', session[:advanced]=true, session[:name]="cillas")
		# 		expect(last_response.body).to include("JavaScript")
		# end
		it 'shows courses the user is enrolled in' do
			post('/enrollment')
			# allcourses = [
			# 	{name: "Intro to Rails", advanced: false, id:0},
			# 	{name: "Intro to JavaScript", advanced: true, id:1}]
				expect(last_response.body).to include("show_courses_enrolled")
		end
	end

end