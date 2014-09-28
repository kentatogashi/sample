class Card < ActiveRecord::Base
  def to_param
    return parse_string
  end
end
