class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_photo.subject
  #
  def sendmail_photo(photo)
    @photo = photo

    mail to: "t-nakai@nttpc.co.jp",
         subject: '【EXAM2】photoが投稿されました'
  end
end
