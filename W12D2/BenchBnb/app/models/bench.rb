class Bench < ApplicationRecord
    validates :description, :lat, :lng, presence: true

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
