class Plan < ActiveRecord::Base
  belongs_to :user
  has_many :meals
  accepts_nested_attributes_for :meals#, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
