module ExtractMailHelper
	def self.extract_name(email_subject_string)
		substrings = email_subject_string.split("will take")

		return substrings[0].strip
	end
end
