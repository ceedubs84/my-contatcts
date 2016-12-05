class ContactsController < ApplicationController
  def index
    if current_user
      @contacts = current_user.contacts
      render "index.html.erb"
    else
      flash[:warning] = 'You must be logged in to see this page!'
      redirect_to '/login'
    end
  end

  def new
    @contact = Contact.new
    render "new.html.erb"
  end

  def create
    @contact = Contact.new(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      bio: params[:bio],
      phone_number: params[:phone_number],
      user_id: current_user.id
      )
    if @contact.save
      flash[:success] = "Contact Created Successfully!!"
      redirect_to "/contacts/#{@contact.id}"
    else
      render 'new.html.erb'
    end
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
    @contact_id = params[:id]
    @contact = Contact.find_by(id: contact_id)
    @contact.first_name = params[:first_name]
    @contact.middle_name = params[:middle_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.bio = params[:bio]
    @contact.phone_number = params[:phone_number]
    if @contact.save
      flash[:success] = "Contact Edited Successfully!!"
      redirect_to "/contacts/#{contact.id}"
    else
      render 'edit.html.erb'
    end
  end

  def destroy
    contact_id = params[:id]
    contact = Contact.find_by(id: contact_id)
    contact.destroy
    flash[:success] = "Contact Destroyed Successfully!!"
    redirect_to "/contacts"
  end

  def search
    search_term = params[:search]
    @contacts = Contact.where("name LIKE ?", '%' + search_term + '%')
    render 'index.html.erb'
  end
  
end