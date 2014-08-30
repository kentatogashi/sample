class PresidentsController < ApplicationController
    #before_action :index, :icon
    
    def index
        @presidents = President.all
    end

    def show
        @president = President.find(params[:id])
    end

    def new
        @president = President.new
    end

    def create 
        @president = President.new(president_params)
        @president.icon = params[:president][:icon].read
        @president.icon_content_type = params[:president][:icon].content_type

        if @president.save
            flash[:success] = "Welcome to the sample App!!"
            redirect_to @president
        else
            render 'new'
        end
    end

    def edit
        @president = President.find(params[:id])
    end

    def update
        @president = President.find(params[:id])
        if @president.update_attributes(president_params)
            flash[:success] = "Profile changed"
            redirect_to @president
        else
            render 'edit'
        end
    end

    def icon
        @president = President.find(params[:id])
        send_data(@president.icon, type: @president.icon_content_type, disposition: :inline)
    end

    private
    def president_params
        params.require(:president).permit(:name)
    end
end
