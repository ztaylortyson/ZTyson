class Lawsuit < ApplicationRecord
  belongs_to :user

  has_many :attorney_lawsuits
  has_many :attorneys, through: :attorney_lawsuits

  has_many :client_lawsuits
  has_many :clients, through: :client_lawsuits
  


end
