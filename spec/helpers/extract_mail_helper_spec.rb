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
  		name = ExtractMailHelper.extract_name("zhou xuan will take 1 day of annual leave on [7.2]")
  		expect(name).to eq("zhou xuan")
  	end

  	it "extract day" do 
  		result = ExtractMailHelper.extract_leave_amount("zhou xuan will take 1 day of annual leave on [7.2]")
  		expect(result).to eq("1 day")
  	end
  end
end
