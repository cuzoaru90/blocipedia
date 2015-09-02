include ApplicationHelper

class Wiki < ActiveRecord::Base
  belongs_to :user

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
