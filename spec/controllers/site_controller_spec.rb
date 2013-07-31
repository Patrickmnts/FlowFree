require 'spec_helper'

describe "Site pages" do
  subject { page }

  describe "Home page" do
    before { visit '/' }

    it { should have_title('FlowFree') }
    it { should have_selector('h1', :text => "River Flows By State") }

  end
end
