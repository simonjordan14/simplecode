class ContactsController < ApplicationController
  def new
          @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
      #if customer succesfully signs up, he will receive an email using the below code.
        name = params[:contact][:name]
        email = params[:contact][:email]
        body = params[:contact][:comments]
      
      
      ContactMailer.contact_email(name, email, body).deliver
      
      #customer will receive notification using flash if succesfully or not.
      flash[:success] = 'Message Sent'
      redirect_to new_contact_path
    else
      flash[:danger] = 'Error Occured, Message not sent.'
      redirect_to new_contact_path
    end
    
  end
  
    private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
    
end