require 'spec_helper'

describe "SubMoods" do
  describe "GET /sub_moods" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get sub_moods_path
      response.status.should be(200)
    end
  end
end
