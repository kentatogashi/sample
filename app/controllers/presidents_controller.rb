class PresidentsController < ApplicationController
    
    def index
        @presidents = President.where(:user_id  => current_user.id.to_i)
        #@presidents = President.all
        p "current_user is:"
        p current_user
        p "current_user is end"
        p "presidents is:"
        p @presidents
        p "presidents is end"
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

    def destroy 
        @president = President.find(params[:id]).destroy
        flash[:success] = "President destroyed"
        redirect_to presidents_url
    end

    private
    def president_params
        params.require(:president).permit(:name, :user_id)
    end
end
