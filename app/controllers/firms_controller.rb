class FirmsController < ApplicationController
  before_action :valid_user?, except: ['icon']

    def index
        @firms = Firm.where(:user_id => current_user.id.to_i) 
    end

    def show
        @firm = Firm.find(params[:id])
    end
    def new
        @firm = Firm.new
    end

    def create 
        @firm = Firm.new(firm_params)
        @firm.user_id = current_user.id.to_i
        @firm.icon = params[:firm][:icon].read
        @firm.icon_content_type = params[:firm][:icon].content_type
        @firm.parse_string = key_str

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

    def icon
      @firm = Firm.find(params[:id])
      send_data(@firm.icon, type: @firm.icon_content_type, disposition: :inline)
    end

    def destroy
        @firm = Firm.find(params[:id]).destroy
        redirect_to firms_url
    end

    def card
        render 'card'
    end

    def valid_user?
        redirect_to root_path if !signed_in?
    end

    private
    def firm_params
        params.require(:firm).permit(:name, :address, :telephone,:business, :note, :president)
    end

    def key_str
      SecureRandom.urlsafe_base64(5)
    end
end
