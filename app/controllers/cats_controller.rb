class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render json: @cats
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save 
      render json: @cat
    else
      render error: {error: 'Unable to create cat'}, status: :bad_request
    end
  end

  def show
    @cat = Cat.find(params[:id])
    render json: @cat
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      redirect_to @cat
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cat = Cat.find(params[:id])
    @cat.destroy

    render:status=>204
  end

  private
  def cat_params 
    params.permit(:name, :color) 
  end

end
