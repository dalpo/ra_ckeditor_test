class Post < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true

  attr_accessible :body, :title, :comments_attributes

  rails_admin do
    configure :body, :text do
      ckeditor true
    end
  end

end
