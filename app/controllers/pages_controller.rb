class PagesController < ApplicationController
  def about
  end

  def contact
    @popular = Post.order('num_likes DESC').limit(3)
    @contact = Contact.new
  end

  def send_contact_email
    ContactMailer.contact_email(params[:contact]).deliver
    render :contact
  end

  def resources
  end
end
