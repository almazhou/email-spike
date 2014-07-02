require 'date'
module ExtractMailHelper
	def self.extract_name(email_subject_string)
		substrings = split_name(email_subject_string)

		return substrings[0].strip
	end

	def self.extract_leave_days(email_subject_string)
		amount_string = split_day(email_subject_string)
		return amount_string[0].strip
	end
	def self.extract_leave_amount(days_string)
		day_str = days_string.split(" ")

		return day_str[0].to_f
	end

	def self.extract_leave_type(email_subject_string)
		result_str = split_day(email_subject_string)
		return split_leave_type(result_str[1])[0].strip
	end
	def self.extract_date_of_leave(email_subject_string)
		split_dates = email_subject_string.split("on")[1]
		dates = split_dates.split(",")
		current_year_dates = dates.map!{|str| 

			Date.parse("2014."+str)
		 }
		return current_year_dates
	end
	def self.split_leave_type(input_str)
		input_str.split("on")
	end

	def self.split_name(email_subject_string)
		email_subject_string.split("will take")
	end

	def self.split_day(input_str)
		amount_string = input_str.split("of")
		return amount_string
	end

	def self.extract_leave_list(email_subject_string)
		name = extract_name(email_subject_string);
		leaves_str = split_name(email_subject_string)
		leave_records = leaves_str[1].split("&&")

		raw_request_list = leave_records.map{
			|record|
			leave_request = Hash.new
			leave_request[:name] = name;

			days_str = extract_leave_days(record)
			leave_request[:amount] = extract_leave_amount(days_str)

			leave_request[:leave_type] = extract_leave_type(record)

			leave_request[:leave_dates] = extract_date_of_leave(record)
			leave_request

		}
		
		return raw_request_list
	end

	def self.extract_single_request(raw_list)
		processed_request_list = Array.new
		raw_list.each{
			|leave_record|
			dates = leave_record[:leave_dates]
			dates.each{
				|leave_date|
				leave_request = Hash.new
				leave_request[:name] = leave_record[:name]
				leave_request[:leave_type] = leave_record[:leave_type]
				if(leave_record[:amount] >= 1)
					durationInHour = 8.0
				else
					durationInHour = leave_record[:amount]*8
				end
				leave_request[:durationInHour] = durationInHour

				leave_request[:from] = leave_date
				leave_request[:to] = leave_date
				processed_request_list.push(leave_request)
			}
		}
		return processed_request_list
	end
end
