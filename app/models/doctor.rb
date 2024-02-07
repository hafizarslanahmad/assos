class Doctor < ApplicationRecord
    has_many :patients, dependent: :destroy
    belongs_to :user
end
