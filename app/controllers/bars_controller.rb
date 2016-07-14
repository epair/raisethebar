class BarsController < ApplicationController

  def index
    @bars = Bar.all
  end

  def create
    @bar = Bar.new(params_bar)
    @bar.user = current_user
    if @bar.save
      flash[:notice] = 'Bar successfully added!'
      redirect_to bar_path(@bar)
    else
      flash[:error] = @bar.errors.full_messages.join(', ')
      render :new
    end
  end

  def search
    if params[:q].blank?
      flash[:error] = "Search Criteria Cannot Be Blank"
      redirect_to bars_path
    else
      @results = Bar.where("name ILIKE ?", "%#{params[:q]}%")
      render :search
    end
  end

  def update
    @bar = Bar.find(params[:id])
    if @bar.update(params_bar)
      flash[:success] = 'Bar successfully updated'
      redirect_to bar_path(@bar)
    else
      flash[:errors] = @bar.errors.full_messages.join(', ')
      render :edit
    end
  end

  def new
    @bar = Bar.new
  end

  def show
    @bar = Bar.find(params[:id])
    @reviews = @bar.reviews
    @review = Review.new
  end

  def edit
    @bar = Bar.find(params[:id])
  end

  def destroy
    @bar = Bar.find(params[:id])
    @bar.destroy
    redirect_to bars_path
  end

  private

  def params_bar
    params.require(:bar).permit(:name, :address, :city, :state, :zip, :description, :photo_url)
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
