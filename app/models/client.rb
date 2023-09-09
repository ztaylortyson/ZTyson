class Client < ApplicationRecord
  belongs_to :user

  enum status: [:active, :inactive]

  has_many :client_lawsuits
  has_many :lawsuits, through: :client_lawsuits

end
