require 'date'
module ExtractMailHelper
	def self.extract_name(email_subject_string)
		email_subject_string =~ /^(.*) will take/
		$1
	end

	def self.extract_leave_days(email_subject_string)
		email_subject_string =~ /^(.*) of/
		$1
	end
	def self.extract_leave_amount(days_string)
		days_string =~ /^(.*) /
		$1.to_f
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
		"test name will take 2 days of annual leave on 7.2,7.6 && 0.5 day of sick leave on 7.5"
		name = extract_name(email_subject_string);
		leaves_str = split_name(email_subject_string)
		leave_records = leaves_str[1].split("&&")

		leave_records.map do |record|
			extract_date_of_leave(record).map do |date|
				durationInHour = [extract_leave_amount(extract_leave_days(record)), 1].min * 8.0
				{name: name, durationInHours: durationInHour,
				leave_type: extract_leave_type(record), from: date, to: date
				}
			end
		end.flatten
	end

	def self.extract_single_request(raw_requests)
		raw_requests.map do |raw_request|
			raw_request[:leave_dates].map do |leave_date|
				{name: raw_request[:name], leave_type: raw_request[:leave_type],
					durationInHours: [raw_request[:amount], 1].min * 8.0,
					from: leave_date, to: leave_date
				}	
			end
		end.flatten
	end
end
