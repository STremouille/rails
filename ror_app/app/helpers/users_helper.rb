module UsersHelper
	def join_userTypes(user)
		user.userTypes.map {|t| t.name}.join(", ")
	end
end
