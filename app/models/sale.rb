class Sale < ApplicationRecord
    validates :cod, uniqueness: true
    validates :detail, presence: true
    validates :category, inclusion: {in: [1, 2, 3, 4, 5]}
    validates :value, numericality: { only_integer: true, greater_than: 0}
    validates :discount, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 40 }

end
