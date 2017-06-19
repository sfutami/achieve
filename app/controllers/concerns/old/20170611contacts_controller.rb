class ContactsController < ApplicationController
  def new
    if params[:back]
      @contact = Contact.new(contacts_params)
    else
      @contact = Contact.new
    end
  end

  def create
    @contact = Contact.new(contacts_params)
    if @contact.save
      redirect_to new_contact_path, notice: "お問い合わせ頂き誠にありがとうございます！"
    else
      render action: 'new'
    end
  end
  
  def confirm
    @contact = Contact.new(contacts_params)
    render :new if @contact.invalid?
  end

  private
    def contacts_params
      params.require(:contact).permit(:name, :email,:content)
    end
end
#  def create
#  end

#  def new
#  end

#  def create
#  end