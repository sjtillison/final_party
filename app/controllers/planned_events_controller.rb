class PlannedEventsController < ApplicationController
  def index
    @planned_events = PlannedEvent.all

    render("planned_events/index.html.erb")
  end

  def show
    @planned_event = PlannedEvent.find(params[:id])

    render("planned_events/show.html.erb")
  end

  def new
    @planned_event = PlannedEvent.new

    render("planned_events/new.html.erb")
  end

  def create
    @planned_event = PlannedEvent.new

    @planned_event.party_id = params[:party_id]
    @planned_event.activity_id = params[:activity_id]

    save_status = @planned_event.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/planned_events/new", "/create_planned_event"
        redirect_to("/planned_events")
      else
        redirect_back(:fallback_location => "/", :notice => "Planned event created successfully.")
      end
    else
      render("planned_events/new.html.erb")
    end
  end

  def edit
    @planned_event = PlannedEvent.find(params[:id])

    render("planned_events/edit.html.erb")
  end

  def update
    @planned_event = PlannedEvent.find(params[:id])

    @planned_event.party_id = params[:party_id]
    @planned_event.activity_id = params[:activity_id]

    save_status = @planned_event.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/planned_events/#{@planned_event.id}/edit", "/update_planned_event"
        redirect_to("/planned_events/#{@planned_event.id}", :notice => "Planned event updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Planned event updated successfully.")
      end
    else
      render("planned_events/edit.html.erb")
    end
  end

  def destroy
    @planned_event = PlannedEvent.find(params[:id])

    @planned_event.destroy

    if URI(request.referer).path == "/planned_events/#{@planned_event.id}"
      redirect_to("/", :notice => "Planned event deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Planned event deleted.")
    end
  end
end
