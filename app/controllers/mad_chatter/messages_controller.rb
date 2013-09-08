require_dependency "mad_chatter/application_controller"

module MadChatter
  class MessagesController < ApplicationController

    before_filter :require_authenticated_user
    
    def index
      @messages = current_room.messages.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @messages }
      end
    end

    def show
      @message = current_room.messages.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @message }
      end
    end

    # def new
    #   @message = current_room.messages.new
  
    #   respond_to do |format|
    #     format.html # new.html.erb
    #     format.json { render json: @message }
    #   end
    # end

    # def edit
    #   @message = current_room.messages.find(params[:id])
    # end

    def create
      @message = current_room.messages.new(message_params[:message])
      @message.author = current_user

      respond_to do |format|
        if @message.save
          format.html { render :show, notice: 'Message was successfully created.' }
          format.json { render json: @message, status: :created }
        else
          format.html { render action: "new" }
          format.json { render json: @message.errors, status: :unprocessable_entity }
        end
      end
    end

    # def update
    #   @message = current_room.messages.find(params[:id])
  
    #   respond_to do |format|
    #     if @message.update_attributes(params[:message])
    #       format.html { redirect_to @message, notice: 'Message was successfully updated.' }
    #       format.json { head :no_content }
    #     else
    #       format.html { render action: "edit" }
    #       format.json { render json: @message.errors, status: :unprocessable_entity }
    #     end
    #   end
    # end

    # def destroy
    #   @message = current_room.messages.find(params[:id])
    #   @message.destroy
  
    #   respond_to do |format|
    #     format.html { redirect_to room_messages_url(current_room) }
    #     format.json { head :no_content }
    #   end
    # end

  private

    def current_room
      @room ||= Room.find(params[:room_id])
    end

    def message_params
      params.permit(message: [:text, :html])
    end

  end
end
