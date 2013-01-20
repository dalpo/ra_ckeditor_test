class Comment < ActiveRecord::Base

  belongs_to :post

  attr_accessible :body

  rails_admin do
    configure :body, :text do
      ckeditor true
      ckeditor_base_location '/assets/ckeditor-custom/'
    end
  end
end
