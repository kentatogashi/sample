class FirmsController < ApplicationController
    def show
        @firm = Firm.find(params[:id])
    end
    def new
    end
end
