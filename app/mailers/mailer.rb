class Mailer < ActionMailer::Base
  def feedback(email, name = "" , phone = "", text = "")
  	@email = email
  	if name.blank?
  		template = "contact"
  	else
  		@name = name
  		@phone = phone
  		@text = text
  		template = "feedback"
  	end
  	mail(to: "nameless7345@gmail.com", 
  			 subject: "Обратная связь",	
  			 template_name: template)
  end

  def order(email, name, phone, text)
  	@name = name
  	@email = email
  	@phone = phone
  	@text = text
  	mail(to: "nameless7345@gmail.com", subject: "Заказ")
  end
end
