class ArtworkSharesController < ApplicationController

    def create
        artwork_share = ArtworkShare.new(artwork_shares_params)
        artwork_share.save
        render json: artwork_share
    end

    def destroy
        artwork_share = ArtworkShare.find(params[:id])
        artwork_share.destroy
        render json: artwork_share

    end

    private
    def artwork_shares_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
        # params.(:artwork_share).permit(:artwork_id, :viewer_id)

    end


end