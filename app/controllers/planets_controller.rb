class PlanetsController < ApplicationController
    def index
        @planets = Planet.all
        render json: @planets, include: [:planet_days]
    end

    def show
        @planet = Planet.find(params[:id])
        render json: @planet, include: [:planet_days]
    end
    
end
