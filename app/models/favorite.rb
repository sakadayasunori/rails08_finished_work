class Favorite < ApplicationRecord
  belongs_to :user
  # すでにtopicsモデルはuser,モデルに属しているので上記のuserがなくても良い。
end
