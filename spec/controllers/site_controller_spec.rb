  require 'spec_helper'

describe "Site pages" do
  describe "Home page" do
    # this might be more appropriate under spec/site/index
    it "should have the title FlowFree" do
      visit '/'
      expect(page).to have_title('FlowFree')
    end
    it "should have a h2 header 'Search for...'" do
      visit '/'
      expect(page).to have_selector('h2', :text => "Search for River Flows By State")
    end
    # ///////////////////////////////////////////////////////////
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
      select("Arizona", :from => "state")
      click_button 'Go!'
      current_path.should == '/rivers/by_state/az'
    end
    it "should go to rivers page of Oregon" do
      visit '/'
      select("Oregon", :from => "state")
      click_button 'Go!'
      current_path.should == '/rivers/by_state/or'
    end
  end
end
