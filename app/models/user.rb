class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

# app/models/user.rb
class User < ApplicationRecord
  # ニックネームのバリデーション
  validates :username, presence: true

  # メールアドレスのバリデーション
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # パスワードのバリデーション
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :password_confirmation, presence: true

  # パスワードの確認が一致することを確認
  validate :password_match

  # 本名のバリデーション
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }

  # 本名カナのバリデーション
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }

  # 生年月日のバリデーション
  validates :birth_date, presence: true

  private

  # パスワードとパスワード（確認）が一致しているかをチェックするカスタムバリデーションメソッド
  def password_match
    return if password == password_confirmation

    errors.add(:password_confirmation, 'とパスワードが一致しません')
  end
end
