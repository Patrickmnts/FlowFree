require 'spec_helper'

describe "Home page" do
  it "should have the title FlowFree" do
    visit '/'
    expect(page).to have_title('FlowFree')
  end
  it "should have content 'Search for...'" do
    visit '/'
    expect(page).to have_content("Search current flows")
  end
  # it "should have a register button" do
  #   visit '/'
  #   expect(page).to have_link('Register')
  # end
  it "should have a sign-in button" do
    visit '/'
    expect(page).to have_link('Sign In')
  end
  it "should have a drop-down menu of states" do
    visit '/'
    expect(page).to have_field('state')
  end
  it "should have a state submit button" do
    visit '/'
    expect(page).to have_button('Go!')
  end
  it "should have a search bar" do
    visit '/'
    expect(page).to have_field('search')
  end
  it "should have a search submit button" do
    visit '/'
    expect(page).to have_button('Search')
  end
end
