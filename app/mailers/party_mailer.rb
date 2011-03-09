class PartyMailer < ActionMailer::Base
  default :from => "272partymanager@gmail.com"
    
  def registration_confirmation(user)  
    @user = user 
    mail(:to => user.email, :subject => "Party Manager Registration")  
  end 
end
