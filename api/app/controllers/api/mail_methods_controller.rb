class Api::MailMethodsController < Api::BaseController
	def testmail
		p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
		 if TestMailer.test_email(@mail_method, current_user).deliver
		   	respond_to do |f|
			f.json {render :json=>{:response=>:sucess}}
    end
		end
		end
end
