class Contact < MailForm::Base
    
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :subject,   :validate => true

  attribute :message, :validate => true
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "#{APP_NAME} : #{subject}",
      :to => "jalvarez@itri.org.tw",
      :from => %("#{name}" <#{email}>)
    }
  end
    
end
