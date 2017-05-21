class Newsletter < ApplicationRecord
  has_many :recipients

  def ransack_query
    res_hash = {}
    filters.each do |filter|
      res_hash["#{filter['prop_name']}_#{filter['logic']}".parameterize.underscore.to_sym] = filter['value']
    end
    res_hash
  end
end
