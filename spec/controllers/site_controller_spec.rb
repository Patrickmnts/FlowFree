require 'spec_helper'

describe "Site pages" do
  describe "Home page" do
    it "should go to sign-up page" do
      visit '/'
      click_link 'Register'
      expect(page).to have_button('Sign up')
    end
    it "should go to sign-in page" do
      visit '/'
      click_link 'Sign in'
      expect(page).to have_button('Sign in')
    end
    it "should go to rivers page" do
      visit '/'
      click_button 'Go!'
      puts current_url
      current_path.should == '/rivers/by_state/'
    end
    it "should go to rivers page of Arizona" do
      visit '/'
      select('Arizona', :from => 'state')
      click_button 'Go!'
      current_path.should == '/rivers/by_state/az'
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
      it "should "
      fill_in 'user_name', :with => 'Abc Xyz'
      fill_in 'user_password', :with => 'prasad'
      fill_in 'user_password_confirmation', :with => 'prasad'

  end
end
