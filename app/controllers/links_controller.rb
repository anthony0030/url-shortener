class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :check_if_editable, only: [:edit, :update, :destroy]

  def index
    @links = Link.recent_first
    @link ||= Link.new
  end

  def show
  end

  def create
    @link = Link.new(link_params.with_defaults(user: current_user))

    if @link.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.turbo_stream do
          render turbo_stream: turbo_stream.prepend('links', @link)
        end
      end
    else
      index
      render :index, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @link.update(link_params)
      redirect_to @link
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @link.destroy
    redirect_to root_path, notice: "Link has been Deleted"
  end

  rescue_from ActiveRecord::RecordNotFound do
    redirect_to root_path, alert: 'Missing Link!'
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end

  def check_if_editable
    return if @link.editable_by?(current_user)

    redirect_to @link, alert: "You don't have permission to edit this!"
  end
end
