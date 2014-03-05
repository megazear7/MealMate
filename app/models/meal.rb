class Meal < ActiveRecord::Base
  has_many :options
  belongs_to :plan
  accepts_nested_attributes_for :options, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
