class Wiki < ActiveRecord::Base
  belongs_to :user

  default_scope { order('title ASC') }

end