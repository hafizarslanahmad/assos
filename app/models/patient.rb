class Patient < ApplicationRecord
    has_one :doctor
end
