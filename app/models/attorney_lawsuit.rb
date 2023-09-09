class AttorneyLawsuit < ApplicationRecord
  belongs_to :Attorney
  belongs_to :Lawsuit
end
