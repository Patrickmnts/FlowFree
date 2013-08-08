require 'spec_helper'

describe "Site pages" do
  describe "Home page" do
    # this might be more appropriate under spec/site/index
    it "should have the title FlowFree" do
      visit '/'
      expect(page).to have_title('FlowFree')
    end
    it "should have a h1 header 'Search for...'" do
      visit '/'
      expect(page).to have_selector('h1', :text => "Search for River Flows By State")
    end
    # ///////////////////////////////////////////////////////////
    it "should go to sign-up page" do
      visit '/'
      click_link 'signup link....'
      expect(page).to have_content('Sign up')
    end
    # it "should go to rivers page" do
    #   visit '/'
    #   click_button 'Go!'
    #   current_url.include?('rivers/index') == true
    # end
  end
end
