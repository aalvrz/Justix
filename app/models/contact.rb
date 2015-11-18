class Contact < MailForm::Base
    
  attribute :nombre,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :asunto,   :validate => true

  attribute :mensaje, :validate => true
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "#{APP_NAME} : #{asunto}",
      :to => "jalvarez@itri.org.tw",
      :from => %("#{name}" <#{email}>)
    }
  end
    
end
