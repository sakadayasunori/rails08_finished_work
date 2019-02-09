class User < ApplicationRecord
  validates :name, presence: true
  # nameに空白制限をかける
  validates :name, length: { maximum:15}

  validates :email, presence: true
  # メールアドレスの正規表現を追加して下さい。
  validates :email, format: {with:/([a-zA-Z\d.])+@([a-zA-Z\d])+[.][(a-zA-Z0-9).]/i}
  # tuby05課題　パスワードの文字数制限
  validates :password, length: {minimum:8, maximum:23}
  # ruby05課題　パスワードをアルファベット、数字の混合
  validates :password, presence: true
  validates :password, format: {with:/([a-zA-Z\d])+/i}

  # available :password, numericality: fals


  has_secure_password

  has_many :topics
  # １つのユーザーモデルtopicモデルを負数所持していて、モデルと突飛区を繋げるために書いている。

  has_many :favorites
  has_many :favorite_topics, through: :favorites, source:"topic"

  has_many :comments
  has_many :comment_topics, through: :comments, source:"topic"


end
