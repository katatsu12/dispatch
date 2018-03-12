class ApplicationMailer < ActionMailer::Base
  default from: 'dispatch.rails@localhost.com'
  layout 'mailer'
end
