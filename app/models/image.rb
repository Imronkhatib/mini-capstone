class Image < ApplicationRecord

  def as_json
    {
      url: url
    }
  end
end
