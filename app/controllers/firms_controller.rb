class FirmsController < ApplicationController
    def show
        @firm = Firm.find(params[:id])
    end
    def new
        @firm = Firm.new
    end

    def create 
        @firm = Firm.new(firm_params)
        if @firm.save
            flash[:success] = "Welcome to the sample App!!"
            redirect_to @firm
        else
            render 'new'
        end
    end

    private
    def firm_params
        params.require(:firm).permit(:name, :president, :phone,:email)
    end
end
