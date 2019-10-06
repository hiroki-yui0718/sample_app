class User < ApplicationRecord # =3
    attr_accessor :remember_token #一時的なDB
    # before_save [self.email = email.downcase]
    has_secure_password
    validates :name,presence:true,length:{maximum:50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email,presence:true,length:{maximum:50},
               format:{with:VALID_EMAIL_REGEX}
    validates :password,presence:true,length:{maximum:8}

  # 永続セッションのためにユーザーをデータベースに記憶する
  # remember_digestを更新(digestはハッシュ値)
  # データベース関係のメソッド
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  # ハッシュ化
  def remember
    self.remember_token = SecureRandom.urlsafe_base64
    self.update_attribute(:remember_digest,
      User.digest(remember_token))
  end
  # 認証
  # 渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(self.remember_digest).is_password?(remember_token)
  end
end
