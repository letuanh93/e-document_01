class Permit < ApplicationRecord
  belongs_to :host, class_name: User.name
  belongs_to :guest, class_name: User.name
  belongs_to :document
end
