class Question < ActiveRecord::Base
  belongs_to :subject
  accepts_nested_attributes_for :subject
end
