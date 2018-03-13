class TypesController < ApplicationController
  def index
    @q = Type.ransack(params[:q])
    @types = @q.result(:distinct => true).includes(:parties).page(params[:page]).per(10)

    render("types/index.html.erb")
  end

  def show
    @party = Party.new
    @type = Type.find(params[:id])

    render("types/show.html.erb")
  end

  def new
    @type = Type.new

    render("types/new.html.erb")
  end

  def create
    @type = Type.new

    @type.event_type = params[:event_type]

    save_status = @type.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/types/new", "/create_type"
        redirect_to("/types")
      else
        redirect_back(:fallback_location => "/", :notice => "Type created successfully.")
      end
    else
      render("types/new.html.erb")
    end
  end

  def edit
    @type = Type.find(params[:id])

    render("types/edit.html.erb")
  end

  def update
    @type = Type.find(params[:id])

    @type.event_type = params[:event_type]

    save_status = @type.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/types/#{@type.id}/edit", "/update_type"
        redirect_to("/types/#{@type.id}", :notice => "Type updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Type updated successfully.")
      end
    else
      render("types/edit.html.erb")
    end
  end

  def destroy
    @type = Type.find(params[:id])

    @type.destroy

    if URI(request.referer).path == "/types/#{@type.id}"
      redirect_to("/", :notice => "Type deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Type deleted.")
    end
  end
end
