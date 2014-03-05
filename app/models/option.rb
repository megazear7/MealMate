class Option < ActiveRecord::Base
  has_many :foods
  belongs_to :meal
  accepts_nested_attributes_for :foods, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
