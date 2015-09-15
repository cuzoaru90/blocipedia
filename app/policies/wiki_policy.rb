class WikiPolicy < ApplicationPolicy

# DRY scope implementation does not work properly with design of my app
# class Scope
#      attr_reader :user, :scope
 
#      def initialize(user, scope)
#        @user = user
#        @scope = scope
#      end
 
#      def resolve
#        wikis = []
#        if user.role == 'admin'
#          wikis = scope.all # if the user is an admin, show them all the wikis
#        elsif user.role == 'premium'
#          all_wikis = scope.all
#          all_wikis.each do |wiki|
#            if wiki.users.include?(user)
#              wikis << wiki # if the user is premium, only show them public wikis, or that private wikis they created, or private wikis they are a collaboration on
#            end
#          end
#        else # this is the lowly standard user
#          all_wikis = scope.all
#          wikis = []
#          all_wikis.each do |wiki|
#            if wiki.public? || wiki.users.include?(user)
#              wikis << wiki # only show standard users public wikis and private wikis they are a collaboration on
#            end
#          end
#        end
#        wikis # return the wikis array we've built up
#      end
#    end

 def update?
   user.present?
 end


 def destroy?
  (user.present? && user == record.collaborations.first.user)
 end


end