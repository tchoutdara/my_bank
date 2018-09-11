class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates_presence_of :first_name, :last_name, :gender, :age
         validates_inclusion_of :gender, in: %w(Male Female M F Other O)
         validates :age, numericality: {
           greater_than_or_equal_to: 16,
           less_than_or_equal_to: 120
         }
end
