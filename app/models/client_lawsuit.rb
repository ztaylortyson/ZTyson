class ClientLawsuit < ApplicationRecord
  belongs_to :Client
  belongs_to :Lawsuit
end
