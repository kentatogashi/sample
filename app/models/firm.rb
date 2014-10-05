class Firm < ActiveRecord::Base
  validates :name, :presence => true
  validates :president, :presence => true
  validates :icon, :presence => true
  validates :address, :presence => true
  validates :telephone, :presence => true
  validates :business, :presence => true
  validates :note, :presence => true
end
