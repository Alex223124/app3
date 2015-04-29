require 'rails_helper'

describe "Static pages" do
describe "Home page" do
it "Should have the content 'App3'" do
	visit '/static_pages/home'
	expect(page).to have_content('App3')
  end
 it "Should have the title 'App3'" do
	visit '/static_pages/home'
	expect(page).to have_title("Ruby on Rails Tutorial App3 | Home")
  end
 end


 describe "Help page" do
 it "should have the content 'Help'" do
 	visit '/static_pages/help'
 	expect(page).to have_content('Help')
 end
 it "Should have the title 'Help'" do
	visit '/static_pages/help'
	expect(page).to have_title("Ruby on Rails Tutorial App3 | Help")
  end
 end


 describe "About page" do
 it "Should have the content 'About Us'" do
 	visit '/static_pages/about'
 	expect(page).to have_content('About Us')
 end
 it "Should have the title 'About Us'" do
	visit '/static_pages/about'
	expect(page).to have_title("Ruby on Rails Tutorial App3 | About Us")
  end
 end
end