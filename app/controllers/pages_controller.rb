class PagesController < ApplicationController
	before_action :admin_user, only: [:admin_session_destroy, :admin_change_password]

	def home
		@categories = Category.all
	end

	def feedback
		if params[:commit] == "Ok"
			unless params[:email].blank?
				Mailer.feedback(params[:email]).deliver 
				redirect_to root_path(:anchor => "footer")
			end
		else
			unless params.has_value?("")
				Mailer.feedback(params[:email], params[:name], params[:phone], params[:text]).deliver
				redirect_to contact_path
			end
		end
	end

	def order
	end

	def send_order
		Mailer.order(params[:email], params[:phone], params[:name], params[:text]).deliver unless params.has_value?("")
		redirect_to order_path
	end

	def admin_signin
	end

	def admin_session_create
		if params[:pass] == get_admin("password")
			sign_in 
			redirect_to root_path
		else
			redirect_to admin_signin_path
		end
	end

	def admin_session_destroy
		cookies.delete(:remember_token)
		redirect_to root_path unless redirect_to :back
	end

	def admin_change_password
		admin_change("password" => params[:new_password]) if params[:current_password] == admin_get("password")
		redirect_to root_path unless redirect_to :back
	end

end
