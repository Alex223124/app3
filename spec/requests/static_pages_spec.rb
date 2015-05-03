require 'rails_helper'

describe "Static pages" do


describe "Home page" do
it "Should have the content 'App3'" do
	visit root_path
	expect(page).to have_content('App3')
  end
 it "Should have the title 'App3'" do
	visit root_path
	expect(page).to have_title("Ruby on Rails Tutorial App3 | Home")
  end
 end

   describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end
    end
   
 describe "Help page" do
 it "should have the content 'Help'" do
 	visit help_path
 	expect(page).to have_content('Help')
 end
 it "Should have the title 'Help'" do
	visit help_path
	expect(page).to have_title("Ruby on Rails Tutorial App3 | Help")
  end
 end


 describe "About page" do
 it "Should have the content 'About Us'" do
 	visit about_path
 	expect(page).to have_content('About Us')
 end
 it "Should have the title 'About Us'" do
	visit about_path
	expect(page).to have_title("Ruby on Rails Tutorial App3 | About Us")
  end
 end
end