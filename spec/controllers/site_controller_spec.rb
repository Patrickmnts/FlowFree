require 'spec_helper'

describe "Site pages" do
  describe "Home page" do
    it "should go to sign-up page" do
      visit '/'
      within(:css, '.button-group.right') do
        click_link 'Register'
      end
      expect(page).to have_content("Sign Up")
    end
    # it "should go to sign-up page" do
    #   visit '/'
    #   click_link 'Register'
    #   current_path.should == '/users/sign_up'
    # end
    # it "should go to sign-up page" do
    #   visit '/'
    #   click_link 'Register Now!'
    #   current_path.should == '/users/sign_up'
    # end
    # it "should go to sign-in page" do
    #   visit '/'
    #   click_link 'Sign In'
    #   expect(page).to have_content("Sign In")
    # end
    # it "should go to sign-in page" do
    #   visit '/'
    #   click_link 'Sign In'
    #   current_path.should == '/users/sign_in'
    # end
    # it "should go to rivers page" do
    #   visit '/'
    #   click_button 'Go!'
    #   puts current_url
    #   current_path.should == '/rivers/by_state/'
    # end
    # it "should go to rivers page of Arizona" do
    #   visit '/'
    #   select('Arizona', :from => 'state')
    #   click_button 'Go!'
    #   current_path.should == '/rivers/by_state/az'
    # end
    # it "should go to rivers page of Oregon" do
    #   visit '/'
    #   select('Oregon', :from => 'state')
    #   click_button 'Go!'
    #   current_path.should == '/rivers/by_state/or'
    # end
    # it "should go to rivers page of chosen river" do
    #   visit '/'
    #   fill_in 'search', :with => "Willamette"
    #   click_button 'Search'
    #   current_path.should == '/rivers/by_name/Willamette'
    # end
    # it "should go to rivers page of chosen river" do
    #   visit '/'
    #   fill_in 'search', :with => "Mississippi"
    #   click_button 'Search'
    #   current_path.should == '/rivers/by_name/Mississippi'
    # end
  end
  describe "Register page" do
    it "should " do
      visit '/users/sign_up'
      fill_in 'user_email', :with => 'johns@example.com'
      fill_in 'user_password', :with => 'masterparty'
      fill_in 'user_password_confirmation', :with => 'masterparty'
      click_button 'Sign Up'
      expect(page).to have_content("Welcome!")
    end
  end
end
