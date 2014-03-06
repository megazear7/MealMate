class Meal < ActiveRecord::Base
  belongs_to :plan
  has_many :options
  accepts_nested_attributes_for :options#, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
