class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    @microposts = Micropost.all.paginate(page: params[:page], per_page: 8)
    render "static_pages/index"
  end

  def create
    @micropost = current_user.microposts.create(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 8)
      render "static_pages/home"
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "delete Micropost success!"
    redirect_to root_url
  end

  def edit
    @micropost = current_user.microposts.find_by(id: params[:id])
    render "static_pages/edit"
  end

  def update
    @micropost = current_user.microposts.find_by(id: params[:id])
    if @micropost.update(micropost_params)
      flash[:success] = "Micropost update success"
      redirect_to root_url
    else
      flash[:error] = "Micropost update error"
      render "static_pages/edit"
    end
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :title)
  end

  def correct_user  
    redirect_to root_url if @micropost.nil?
  end
end
