class Article < ActiveRecord::Base
  validates :title, presence: true,
                    length: {minimum: 5}
  # If you delete an article, its associated comments will also need to be deleted, otherwise they would simply occupy space in the database. Rails allows you to use the dependent option of an association to achieve this.
  has_many :comments, dependent: :destroy               
end
