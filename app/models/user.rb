class User < ApplicationRecord

    has_many :hospitals
    has_many :doctors
    has_many :patients

    
    has_secure_password

    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}

    ROLES = %w{admin}


    def admin?
        role == "admin"
    end
    
    
end
