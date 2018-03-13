class AttendeesController < ApplicationController
  before_action :current_user_must_be_attendee_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_attendee_user
    attendee = Attendee.find(params[:id])

    unless current_user == attendee.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @attendees = Attendee.all

    render("attendees/index.html.erb")
  end

  def show
    @attendee = Attendee.find(params[:id])

    render("attendees/show.html.erb")
  end

  def new
    @attendee = Attendee.new

    render("attendees/new.html.erb")
  end

  def create
    @attendee = Attendee.new

    @attendee.user_id = params[:user_id]
    @attendee.party_id = params[:party_id]

    save_status = @attendee.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/attendees/new", "/create_attendee"
        redirect_to("/attendees")
      else
        redirect_back(:fallback_location => "/", :notice => "Attendee created successfully.")
      end
    else
      render("attendees/new.html.erb")
    end
  end

  def edit
    @attendee = Attendee.find(params[:id])

    render("attendees/edit.html.erb")
  end

  def update
    @attendee = Attendee.find(params[:id])
    @attendee.party_id = params[:party_id]

    save_status = @attendee.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/attendees/#{@attendee.id}/edit", "/update_attendee"
        redirect_to("/attendees/#{@attendee.id}", :notice => "Attendee updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Attendee updated successfully.")
      end
    else
      render("attendees/edit.html.erb")
    end
  end

  def destroy
    @attendee = Attendee.find(params[:id])

    @attendee.destroy

    if URI(request.referer).path == "/attendees/#{@attendee.id}"
      redirect_to("/", :notice => "Attendee deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Attendee deleted.")
    end
  end
end
