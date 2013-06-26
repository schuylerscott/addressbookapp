class Post < ActiveRecord::Base.send(:include, ActiveModel::ForbiddenAttributesProtection)
  attr_accessible :title, :text
  validates :title, presence: true,
                    length: { minimum: 5 }
end