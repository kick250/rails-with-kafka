class Category < ActiveRecord::Base

  def to_hash
    {
      id: self.id,
      label: self.label
    }
  end
end