class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.sign_up.subject
  #
  def sign_up(admi)
    @admi = admi

    mail to: "urmila.murali@altiussolution.com"
  end
end
