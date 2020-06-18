class PlanetsController < ApplicationController
    def index
        # if params["name"]
        #     @planets = Planet.where("name LIKE ?", "%#{params["name"]}%")
        #     render json: @planets, include: [:planet_days]
        # else
            @planets = Planet.all
            render json: @planets, include: [:planet_days]

        # end
       
    end

    def show
        @planet = Planet.find(params[:id])
        render json: @planet, include: [:planet_days]
    end
    
end
