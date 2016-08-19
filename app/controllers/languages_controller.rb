class LanguagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @language = Language.new
  end

  def create
    @language = Language.new(language_params)
    if @language.save
      # LanguagesUsers.create(user_id: current_user.id, language_id: @language.id)
      flash[:notice] = "Idioma añadido correctamente"
      redirect_to profile_path(current_user)
    else
      redirect_to profile_path(current_user)
    end
  end

  def destroy
    @language = Language.find(params[:id])
    @language.destroy
    redirect_to profile_path(current_user)
  end

  private

  def language_params
    params.require(:language).permit(:language)
  end
end
