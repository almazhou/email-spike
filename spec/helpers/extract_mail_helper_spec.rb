require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ExtractMailHelper. For example:
#
# describe ExtractMailHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ExtractMailHelper, :type => :helper do
  describe "extrace message from email" do
  	it "extract name" do 
  		name = ExtractMailHelper.extract_name("zhou xuan will take one day annual leave on [7.2]")
  		expect(name).to eq("zhou xuan")
  	end
  end
end
