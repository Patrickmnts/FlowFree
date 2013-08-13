require 'spec_helper'

describe "Finding gauges" do

  it "should find gauges in AZ" do
    visit '/'
    select('Arizona', :from => "state")
    click_button "Go!"
    expect(page).to have_content('Sites in AZ')
  end

  it "should find gauges that match creek" do
    visit '/'
    fill_in('search', :with => "creek")
    click_button "Search"
    expect(page).to have_content("Nationwide Search for: 'creek'")
  end

  it "should find gauges that match two words" do
    visit '/'
    fill_in('search', :with => "copper r")
    click_button "Search"
    expect(page).to have_content("Nationwide Search for: 'copper r'")
  end

  context "from a state page" do

    before(:each) do
      visit '/'
      select('Arizona', :from => "state")
      click_button "Go!"
    end

    it "should return only gauges that match creek" do
      fill_in('search', :with => "creek")
      click_button "Search"
      expect(page).to have_content("Sites in AZ that match: 'creek'")
    end

    it "should return only gauges that match two words" do
      fill_in('search', :with => "filler ditch")
      click_button "Search"
      expect(page).to have_content("Sites in AZ that match: 'filler ditch'")
    end

  end

end
