require 'rails_helper'
require 'date'

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
  		result = ExtractMailHelper.extract_leave_days("1 day of annual leave on [7.2]")
  		expect(result).to eq("1 day")
  	end

  	it "extract exact amount of days" do
  		result = ExtractMailHelper.extract_leave_amount("1 day")
  		expect(result).to be(1.0)
  	end

  	it "extract exact amount of days" do
  		result = ExtractMailHelper.extract_leave_amount("0.5 day")
  		expect(result).to be(0.5)
  	end

  	it "extract leave type" do
  		result = ExtractMailHelper.extract_leave_type("1 day of annual leave on [7.2]")
  		expect(result).to eq("annual leave")	
  	end

  	it "extract date of leave" do
  		result = ExtractMailHelper.extract_date_of_leave("1 day of annual leave on 7.2")

  		expect(result.length).to be(1)
  		expect(result.at(0)).to eq(Date.parse("2014.7.2"))

  	end


  	it "extract date of leave" do
  		result = ExtractMailHelper.extract_date_of_leave("1 day of annual leave on 7.2,7.3,7.5")

  		expect(result.length).to be(3)
  		expect(result.at(1)).to eq(Date.parse("2014.7.3"))
		expect(result.at(2)).to eq(Date.parse("2014.7.5"))
  	end


  end
end
