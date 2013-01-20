class Comment < ActiveRecord::Base

  belongs_to :post

  attr_accessible :body

  rails_admin do
    configure :body, :text do
      ckeditor true
    end
  end
end
