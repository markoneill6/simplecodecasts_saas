class ContactsController < ApplicationController
  def new # this is the form called after the get action redirection from the index !
    @contact = Contact.new
  end

  def create # this is coming from the post action !
    @contact = Contact.new(contact_params)
    if @contact.save #committing into the database
      name = params[:contact][:name] # from here, getting the data from the db to be sent by the email below...
      email = params[:contact][:email]
      body = params[:contact][:comments]
      ContactMailer.contact_mail(name, email, body).deliver # ... sending data to our email
      flash[:success] = "Message sent."
      redirect_to root_path
      #redirect_to new_contact_path, notice: "Message sent." # OJO: redirection is into contact_new...
    else
      flash[:danger] = "Error ocurred, message not sent."
      redirect_to new_contact_path
      #redirect_to new_contact_path, notice: "Error occured."
    end

  end

  private # a new, important addition to rails ! security !!
  def contact_params # "white-listing" parameters...
    params.require(:contact).permit(:name, :email, :comments)
  end
end