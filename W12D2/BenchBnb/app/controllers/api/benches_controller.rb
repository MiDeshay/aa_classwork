class Api::BenchesController < ApplicationController
    skip_before_action :verify_authenticity_token
  
    def index
        @benches = Bench.all
        render :index
    end

    def create
        @bench = Bench.new(bench_params)
        if @bench.save
            redirect_to api_benches
        else
            render json: @bench.full_messages
        end
    end

    private
    def bench_params 
        params.require(:bench).permit(:description, :lat, :lng)
    end
end
