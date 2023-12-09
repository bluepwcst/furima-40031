class User < ApplicationRecord
  has_many :items
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise:database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  # ニックネームのバリデーション
  validates :username, presence: true

  # メールアドレスのバリデーションはDeviseで処理されるため削除

  # パスワードのバリデーション
  # presence: trueはDeviseで処理されるため削除
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  # 本名のバリデーション
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ }

  # 本名カナのバリデーション
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }

  # 生年月日のバリデーション
  validates :birth_date, presence: true

  # パスワードの確認バリデーションとカスタムバリデーションメソッドは削除
end
