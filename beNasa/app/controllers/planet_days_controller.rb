class PlanetDaysController < ApplicationController
    def index
        @days = PlanetDay.all
        render json: @days
    end

    def show
        @day = PlanetDay.find(params[:id])
        render json: @day
    end
end
