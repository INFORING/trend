module ApplicationHelper
	def get_admin(params = "")
	  !params.blank? ? YAML.load(File.open("config/admin.yml"))[params] : YAML.load(File.open("config/admin.yml"))
	end

	def change_admin(params = {})
		current_params = get_admin
		params.each do |key, value|
			current_params[key] = value
		end
		File.open("config/admin.yml", "w") { |f| f.write(current_params.to_yaml) }
	end
	
	def sign_in
		remember_token = SecureRandom.urlsafe_base64
		cookies.permanent[:remember_token] = remember_token
		change_admin("token" => remember_token)
	end

	def is_admin?
		remember_token = get_admin("token")
		if cookies[:remember_token].nil? or cookies[:remember_token] != remember_token
			false
		else
			true
		end
	end

	def admin_user
 		raise ActionController::RoutingError.new('Not Found') unless is_admin?
 	end
end
