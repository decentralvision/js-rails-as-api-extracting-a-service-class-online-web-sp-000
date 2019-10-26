class SightingsController < ApplicationController
    def show
        @sighting = Sighting.find(params[:id])
        render json: SightingSerializer.new(sightings).to_serialized_json
    end
    def index
      sightings = Sighting.all
      render json: sightings.to_json(:include => {
        :bird => {:only => [:name, :species]},
        :location => {:only => [:latitude, :longitude]}
      }, :except => [:updated_at])
    end
end
