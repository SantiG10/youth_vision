class OffersController < InheritedResources::Base

  def index
    option = params[:option]
    if option.present?
      @offers = Offer.where(type_offer: option)
    else
      @offers = Offer.all
    end
  end

  def apply

  end

  def apply_save
    apply = UserOffer.new(offer_id: params[:id], user_id: current_user.id)
    if apply.save
      flash[:notice] = "Aplicaste a la oferta correctamente"
    end
    redirect_to apply_path
  end

  private

    def offer_params
      params.require(:offer).permit(:title, :description, :salary, :type_offer, :url, :requirements, :location)
    end
end
