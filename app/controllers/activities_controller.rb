class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all

    render("activities/index.html.erb")
  end

  def show
    @planned_event = PlannedEvent.new
    @activity = Activity.find(params[:id])

    render("activities/show.html.erb")
  end

  def new
    @activity = Activity.new

    render("activities/new.html.erb")
  end

  def create
    @activity = Activity.new

    @activity.title = params[:title]
    @activity.notes = params[:notes]
    @activity.cost_pp = params[:cost_pp]
    @activity.city_id = params[:city_id]
    @activity.website = params[:website]

    save_status = @activity.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/activities/new", "/create_activity"
        redirect_to("/activities")
      else
        redirect_back(:fallback_location => "/", :notice => "Activity created successfully.")
      end
    else
      render("activities/new.html.erb")
    end
  end

  def edit
    @activity = Activity.find(params[:id])

    render("activities/edit.html.erb")
  end

  def update
    @activity = Activity.find(params[:id])

    @activity.title = params[:title]
    @activity.notes = params[:notes]
    @activity.cost_pp = params[:cost_pp]
    @activity.city_id = params[:city_id]
    @activity.website = params[:website]

    save_status = @activity.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/activities/#{@activity.id}/edit", "/update_activity"
        redirect_to("/activities/#{@activity.id}", :notice => "Activity updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Activity updated successfully.")
      end
    else
      render("activities/edit.html.erb")
    end
  end

  def destroy
    @activity = Activity.find(params[:id])

    @activity.destroy

    if URI(request.referer).path == "/activities/#{@activity.id}"
      redirect_to("/", :notice => "Activity deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Activity deleted.")
    end
  end
end
