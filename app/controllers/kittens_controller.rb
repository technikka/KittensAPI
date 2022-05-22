class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to @kitten
      flash.notice = 'You have successfully added a kitten'
    else
      render :new, status: :unprocessable_entity
      flash.alert = 'We cannot accept your kitten'
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    if @kitten.update(kitten_params)
      redirect_to @kitten
      flash.notice = 'You have successfully updated your kitten'
    else
      render :edit, status: :unprocessable_entity
      flash.alert = 'We cannot accept your kitten'
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy
    redirect_to root_path, status: 303
    flash.notice = 'You have successfully deleted your kitten'
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
