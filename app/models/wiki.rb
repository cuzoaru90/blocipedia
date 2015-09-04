include ApplicationHelper

class Wiki < ActiveRecord::Base


  has_many :collaborators
  has_many :users, through: :collaborators


  #after_initialize :make_public
  ## Method causes problems when making wikis private

  default_scope { order('title ASC') }


  def private?
   self.private == true
  end

  def markdown_title
    markdown_to_html (self.title)
  end

  def markdown_body
    markdown_to_html (self.body)
  end

  private

  def make_public
    self.private = false
  end



end
