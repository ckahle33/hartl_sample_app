# testing to see that all helpers are accessible 
module UtilHelper
	def printUser
		user = User.find_by(email: "nice@wow.com")
		user.email
	end
end