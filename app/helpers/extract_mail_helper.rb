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
		return split_leave_type(result_str[1])
	end
	
	def self.split_leave_type(input_str)
		input_str.split("on")[0].strip
	end

	def self.split_name(email_subject_string)
		email_subject_string.split("will take")
	end

	def self.split_day(email_subject_string)
		substrings = split_name(email_subject_string)

		amount_string = substrings[1].split("of")
		return amount_string
	end
end
