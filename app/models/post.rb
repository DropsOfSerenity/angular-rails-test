class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  def self.ordered
    order(:created_at => "DESC")
  end
end
