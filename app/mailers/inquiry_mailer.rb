class InquiryMailer < ApplicationMailer
  default from: 'sample@email.com'

  def inquiry_mail(inquiry)
    @inquiry = inquiry
    mail(to: @inquiry.email, subject: "#{@inquiry.inquiry_title}の件")
  end
end
