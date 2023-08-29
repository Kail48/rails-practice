class CrewsController < ApplicationController
    def show
        @crews=Crew.all
    end
end