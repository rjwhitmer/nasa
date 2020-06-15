class PlanetDaysController < ApplicationController
    def index
        @days = PlanetDay.all
        render json: @days
    end
end
