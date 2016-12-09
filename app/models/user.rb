class User < ApplicationRecord
	enum status: [:active, :deleted]
	validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
	validates_uniqueness_of :email, :contact_number
	validates :email, confirmation: true
	validates :email_confirmation, presence: true
end
