class PlanetsController < ApplicationController
    def index
        @planets = Planet.all
        render json: @planets, include: [:planet_days]
    end
end
