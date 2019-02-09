class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end
