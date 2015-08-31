class Wiki < ActiveRecord::Base
  belongs_to :user

  #after_initialize :make_public
  ## Method causes me problems when making wikis private

  default_scope { order('title ASC') }


  def private?
   self.private == true
  end

  private

  def make_public
    self.private = false
  end

end
