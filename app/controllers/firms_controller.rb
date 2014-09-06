class FirmsController < ApplicationController
    def index
        @firms = Firm.all
    end

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

    def edit
        @firm = Firm.find(params[:id])
    end

    def update
        @firm = Firm.find(params[:id])
        if @firm.update_attributes(firm_params)
            flash[:success] = "Profile changed"
            redirect_to @firm
        else
            render 'edit'
        end
    end

    def destroy
        @firm = Firm.find(params[:id]).destroy
        redirect_to firms_url
    end

    def card
        render 'card'
    end

    private
    def firm_params
        params.require(:firm).permit(:name, :address, :telephone,:business, :note, :president_id)
    end
end
