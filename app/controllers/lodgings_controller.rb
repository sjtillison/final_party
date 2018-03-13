class LodgingsController < ApplicationController
  def index
    @lodgings = Lodging.all

    render("lodgings/index.html.erb")
  end

  def show
    @party = Party.new
    @lodging = Lodging.find(params[:id])

    render("lodgings/show.html.erb")
  end

  def new
    @lodging = Lodging.new

    render("lodgings/new.html.erb")
  end

  def create
    @lodging = Lodging.new

    @lodging.name = params[:name]
    @lodging.url = params[:url]
    @lodging.address = params[:address]
    @lodging.city_id = params[:city_id]
    @lodging.cost_night = params[:cost_night]

    save_status = @lodging.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/lodgings/new", "/create_lodging"
        redirect_to("/lodgings")
      else
        redirect_back(:fallback_location => "/", :notice => "Lodging created successfully.")
      end
    else
      render("lodgings/new.html.erb")
    end
  end

  def edit
    @lodging = Lodging.find(params[:id])

    render("lodgings/edit.html.erb")
  end

  def update
    @lodging = Lodging.find(params[:id])

    @lodging.name = params[:name]
    @lodging.url = params[:url]
    @lodging.address = params[:address]
    @lodging.city_id = params[:city_id]
    @lodging.cost_night = params[:cost_night]

    save_status = @lodging.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/lodgings/#{@lodging.id}/edit", "/update_lodging"
        redirect_to("/lodgings/#{@lodging.id}", :notice => "Lodging updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Lodging updated successfully.")
      end
    else
      render("lodgings/edit.html.erb")
    end
  end

  def destroy
    @lodging = Lodging.find(params[:id])

    @lodging.destroy

    if URI(request.referer).path == "/lodgings/#{@lodging.id}"
      redirect_to("/", :notice => "Lodging deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Lodging deleted.")
    end
  end
end
