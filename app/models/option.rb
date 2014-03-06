class Option < ActiveRecord::Base
  belongs_to :meal
  has_many :foods
  accepts_nested_attributes_for :foods#, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
