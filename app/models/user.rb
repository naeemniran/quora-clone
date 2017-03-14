class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_many :questions
	has_secure_password
	validates :email, presence: true
end
