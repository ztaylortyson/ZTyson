class Attorney < ApplicationRecord

	has_many :attorney_lawsuits
	has_many :lawsuits, through: :attorney_lawsuits

end
