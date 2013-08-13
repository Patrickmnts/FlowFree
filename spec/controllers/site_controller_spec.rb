require 'spec_helper'

describe "Site pages" do
  describe "Home page" do
    it "should go to sign-up page" do
      visit '/'
      within(:css, '.button-group.right') do
        click_link 'Register'
      end
      expect(page).to have_content("devise/registrations:new")
    end
    it "should go to sign-up page" do
      visit '/'
      within(:css, '.button-group.right') do
        click_link 'Register'
      end
      current_path.should == '/users/sign_up'
    end
    it "should go to sign-up page" do
      visit '/'
      click_link 'Register Now!'
      current_path.should == '/users/sign_up'
    end
    it "should go to sign-in page" do
      visit '/'
      within(:css, '.button-group.right') do
        click_link 'Sign In'
      end
      expect(page).to have_content("devise/sessions:new")
    end
    it "should go to sign-in page" do
      visit '/'
      within(:css, '.button-group.right') do
        click_link 'Sign In'
      end
      current_path.should == '/users/sign_in'
    end
    it "should go to rivers page of Alaska" do
      visit '/'
      select('Alaska', :from => 'state')
      click_button 'Go!'
      current_path.should == '/rivers/by_state/ak'
    end
    it "should go to rivers page of Oregon" do
      visit '/'
      select('Oregon', :from => 'state')
      click_button 'Go!'
      current_path.should == '/rivers/by_state/or'
    end
    it "should go to rivers page of chosen river" do
      visit '/'
      fill_in 'search', :with => "Willamette"
      click_button 'Search'
      current_path.should == '/rivers/by_name/Willamette'
    end
    it "should go to rivers page of chosen river" do
      visit '/'
      fill_in 'search', :with => "Mississippi"
      click_button 'Search'
      current_path.should == '/rivers/by_name/Mississippi'
    end
  end
  describe "Register page" do
    it "should go to the welcome page after creating a new user" do
      visit '/users/sign_up'
      fill_in 'user_email', :with => 'johns@example.com'
      fill_in 'user_password', :with => 'masterparty'
      fill_in 'user_password_confirmation', :with => 'masterparty'
      click_button 'Sign Up'
      expect(page).to have_content("Welcome!")
    end
    it "should go to the welcome page after creating a new user" do
      visit '/users/sign_up'
      fill_in 'user_email', :with => 'johnp@example.com'
      fill_in 'user_password', :with => 'masterparty'
      fill_in 'user_password_confirmation', :with => 'masterparty'
      click_button 'Sign Up'
      expect(page).to have_content("site:index")
    end
    it "should go back to the home page" do
      visit '/users/sign_up'
      click_link 'FlowFree'
      current_path.should == '/'
    end
    it "should go back to the home page" do
      visit '/users/sign_up'
      click_link 'FlowFree'
      expect(page).to have_content("site:index")
    end
    it "should go to the forgot your password page" do
      visit '/users/sign_up'
      click_link "Forgot your password?"
      current_path.should == '/users/password/new'
    end
    it "should go to the forgot your password page" do
      visit '/users/sign_up'
      click_link "Forgot your password?"
      expect(page).to have_content("devise/passwords:new")
    end
    it "should go to the sign-in page" do
      visit '/users/sign_up'
      within(:css, '.button-group.right') do
        click_link 'Sign In'
      end
      current_path.should == '/users/sign_in'
    end
    it "should go to the sign-in page" do
      visit '/users/sign_up'
      within(:css, '.button-group.right') do
        click_link 'Sign In'
      end
      expect(page).to have_content("devise/sessions:new")
    end
  end
end
