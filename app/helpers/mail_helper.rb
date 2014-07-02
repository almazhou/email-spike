require 'mail'
module MailHelper
	def self.read_mail
	Mail.defaults do
      retriever_method :pop3, :address    => "pop.gmail.com",
      :port       => 995,
      :user_name  => 'almazhou0303@gmail.com',
      :password   => '88534650',
      :enable_ssl => true
    end
    email = Mail.first
    {
    	:from_addrs => email.from_addrs,
    	:to_addrs => email.to_addrs,
    	:subject => email.subject,
    	:body => email.text_part.body.decoded
    }
	end
end
