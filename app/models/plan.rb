class Plan < ActiveRecord::Base
  has_many :meals
  accepts_nested_attributes_for :meals#, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
