class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #ユーザー名とパスワードでログインする仕様に変更するため以下17行目までをを追加
  validates :username, presence: true, uniqueness: true, length: {maximum: 50}

  #登録時にメールアドレスを不要とする
  def email_required?
    false
  end

  def email_changed?
    false
  end
end
