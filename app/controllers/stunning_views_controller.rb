class StunningViewsController < ApplicationController
  before_action :authorized, only: [:create, :update, :edit, :new, :destroy]
  before_action :set_stunning_view, only: [:show, :edit, :update, :destroy]

  def index
    params[:sort] ||= 'created_at'
    order_by = "stunning_views.#{params[:sort]} DESC"
    if params[:city_id].present?
      @stunning_views = City.find_by(id: params[:city_id]).stunning_views.order created_at: :desc
    elsif params[:longitude].present? && params[:latitude].present?
      flash.now[:info] = 'Showing views near you.'
      @stunning_views = StunningView.near([params[:latitude], params[:longitude]], 50).order created_at: :desc
    else
      @stunning_views = StunningView.all.order order_by
    end
  end

  def show
    if logged_in?
      @review = Review.new
      @review.stunning_view_id = @stunning_view.id
    else
      @review = nil
    end
    @reviews = @stunning_view.reviews.order created_at: :desc
  end

  def new
    @stunning_view = StunningView.new
  end

  # GET /stunning_views/1/edit
  def edit
  end

  # POST /stunning_views
  # POST /stunning_views.json
  def create
    @stunning_view = StunningView.new(stunning_view_params.merge(user_id: current_user.id))
    respond_to do |format|
      if @stunning_view.save
        format.html do
          redirect_to @stunning_view
          flash[:success] = 'Stunning view was successfully created.'
        end
        format.json { render :show, status: :created, location: @stunning_view }
      else
        format.html { render :new }
        format.json { render json: @stunning_view.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stunning_views/1
  # PATCH/PUT /stunning_views/1.json
  def update
    respond_to do |format|
      if @stunning_view.update(stunning_view_params)
        format.html { redirect_to @stunning_view, notice: 'Stunning view was successfully updated.' }
        format.json { render :show, status: :ok, location: @stunning_view }
      else
        format.html { render :edit }
        format.json { render json: @stunning_view.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stunning_views/1
  # DELETE /stunning_views/1.json
  def destroy
    if @stunning_view.city.stunning_views.length == 1
      @stunning_view.city.destroy
    else
      @stunning_view.destroy
    end
    respond_to do |format|
      format.html { redirect_to stunning_views_url, notice: 'Stunning view was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @stunning_views = StunningView.where(search_params)
    render 'index'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_stunning_view
    @stunning_view = StunningView.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def authorized
    if !logged_in?
      redirect_to root_path
    elsif !current_user.admin?
      flash[:danger] = 'You are not authorized to access this page.'
      redirect_to root_path
    end
  end

  # Only allow a list of trusted parameters through.
  def stunning_view_params
    params.require(:stunning_view).permit(:title, :description, :car_access, :latitude, :longitude, :free_access, :overlooking, :serviced, :family_friendly, :user_id, :thumbnail, images: [])
  end

  # Remove false and empty tags
  def search_params
    # TODO: This is hacky and buggy. Wrap the relevent stuff inside a hash within params.
    params.permit(:city_id, :overlooking, :car_access, :serviced, :family_friendly, :free_access).delete_if { |_, value| value.empty? || value == 'false' }.except(:controller, :commit, :action)
  end
end
