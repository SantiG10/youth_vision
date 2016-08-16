class OffersController < InheritedResources::Base

  private

    def offer_params
      params.require(:offer).permit(:title, :description, :salary, :type_offer, :url, :requirements, :location)
    end
end

