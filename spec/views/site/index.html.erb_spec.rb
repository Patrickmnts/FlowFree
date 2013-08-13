require 'spec_helper'

describe "Site pages" do
  describe "Home page" do
    before :each do
      visit '/'
    end
    it "should have the title FlowFree" do
      expect(page).to have_title('FlowFree')
    end
    it "should have content 'Search for...'" do
      expect(page).to have_content("Search current flows")
    end
    it "should have a register button in the top right corner" do
      within(:css, '.button-group.right') do
        expect(page).to have_link('Register')
      end
    end
    it "should have a sign-in button in the top right corner" do
      within(:css, '.button-group.right') do
        expect(page).to have_link('Sign In')
      end
    end
    it "should have a drop-down menu of states" do
      expect(page).to have_field('state')
    end
    it "should have a state submit button" do
      expect(page).to have_button('Go!')
    end
    it "should have a search bar" do
      expect(page).to have_field('search')
    end
    it "should have a search submit button" do
      expect(page).to have_button('Search')
    end
  end
end