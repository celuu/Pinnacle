# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  fname           :string           not null
#  lname           :string           not null
#  username        :string           not null
#  email           :string           not null
#  password_digest :string
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  admin           :boolean
#
class User < ApplicationRecord
    has_secure_password

    validates :session_token, presence: true, uniqueness: true
    validates :username, length: {minimum:3, maximum:30}, format: { without: URI::MailTo::EMAIL_REGEXP, message: "Can't be an email" }, uniqueness: true 
    validates :email, length: {minimum:3, maximum:255}, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
    validates :password, length: { in: 6..20}, allow_nil: true 
    validates :fname, :lname, :username, :email, :password_digest, :session_token, presence: true

    before_validation :ensure_session_token 

    has_many :reservations, 
        dependent: :destroy

    has_many :reviews, 
        dependent: :destroy    

    def self.find_by_credentials(credential, password)
        if credential.include?('@') 
            user = User.find_by(email: credential )
            return user if user && user.authenticate(password)
        else 
            user = User.find_by(username: credential )
            return user if user && user.authenticate(password)
        end 
        nil 
    end 

    def reset_session_token! 
        self.session_token = generate_unique_session_token
        self.save!
        self.session_token
    end 

    private 

    def ensure_session_token 
        self.session_token ||= generate_unique_session_token
    end 

    def generate_unique_session_token
        while true 
            token = SecureRandom::urlsafe_base64 
            return token unless User.exists?(session_token: token)
        end   
    end 
end
