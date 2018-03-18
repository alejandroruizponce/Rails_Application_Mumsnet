class Product < ApplicationRecord
    validates :title, presence: true, uniqueness:true
    validates :body, presence: true
    
    has_many :has_categories
    has_many :categories, through: :has_categories
    
    after_create :save_categories
    
    def categories=(value)
        @categories = value
    end
    
    def save_categories
        @categories.each do |category_id|
            HasCategory.create(category_id: category_id, product_id: self.id)
        end
    end
end
