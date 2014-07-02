module ExtractMailHelper
	def self.extract_name(email_subject_string)
		substrings = split_name(email_subject_string)

		return substrings[0].strip
	end

	def self.extract_leave_amount(email_subject_string)
		amount_string = split_day(email_subject_string)
		return amount_string[0].strip
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
