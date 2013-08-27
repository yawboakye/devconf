class Notifier < ActionMailer::Base
  default from: 		'devcongress@gmail.com',
  				reply_to: 'devcongress@gmail.com',
					to: Proc.new { Attendee.pluck :email }

  def comments_updated(comment)
  	@comment = comment
  	email_with_name = "#{@comment.title.submitter_name} <#{@comment.title.submitter_email}>"
  	mail to: email_with_name, subject: "[DevCongress 24.08.13] New comment on your title, #{@comment.title.title}"
  end

	def thank_you
		mail(subject: 'Thank you for making DevCongress successful. You\'re awesome!')
	end


end
