class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    contact = Contact.new(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      bio: params[:bio],
      phone_number: params[:phone_number]
      )
    contact.save
    flash[:success] = "Contact Created Successfully!!"
    redirect_to "/contacts/#{contact.id}"
  end

  def show
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
    render "show.html.erb"
  end

  def edit
    contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
    render "edit.html.erb"
  end

  def update
    contact_id = params[:id]
    contact = Contact.find_by(id: contact_id)
    contact.first_name = params[:first_name]
    contact.middle_name = params[:middle_name]
    contact.last_name = params[:last_name]
    contact.email = params[:email]
    contact.bio = params[:bio]
    contact.phone_number = params[:phone_number]
    contact.save
    flash[:success] = "Contact Edited Successfully!!"
    redirect_to "/contacts/#{contact.id}"
  end

  def destroy
    contact_id = params[:id]
    contact = Contact.find_by(id: contact_id)
    contact.destroy
    flash[:success] = "Contact Destroyed Successfully!!"
    redirect_to "/contacts"
  end





end
