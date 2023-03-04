class User < ApplicationRecord
    validates :name, presence: true, uniqueness: { error: "name Should be unique"}
    validates :password, presence: true, length: {maximum:8}
    validates :email, presence: :true, uniqueness: { error: "name Should be unique"}
end
