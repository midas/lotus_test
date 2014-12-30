class UserForm

	include Lotus::Form

	attribute :name, presence: true

protected

	def collection
		:users
	end

end
