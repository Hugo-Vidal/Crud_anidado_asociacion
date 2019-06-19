class Employee < ApplicationRecord
    belongs_to :area
    belongs_to :company
end
