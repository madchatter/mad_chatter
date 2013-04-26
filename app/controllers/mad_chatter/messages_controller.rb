require_dependency "mad_chatter/application_controller"

module MadChatter
  class MessagesController < ApplicationController

    before_filter :require_authenticated_user
    
    # GET /messages
    # GET /messages.json
    def index
      @messages = current_room.messages.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @messages }
      end
    end
  
    # GET /messages/1
    # GET /messages/1.json
    def show
      @message = current_room.messages.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @message }
      end
    end
  
    # GET /messages/new
    # GET /messages/new.json
    def new
      @message = current_room.messages.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @message }
      end
    end
  
    # GET /messages/1/edit
    def edit
      @message = current_room.messages.find(params[:id])
    end
  
    # POST /messages
    # POST /messages.json
    def create
      @message = current_room.messages.new(params[:message])
      @message.author = current_user

      respond_to do |format|
        if @message.save
          client = Faye::Client.new('http://localhost:4000/mad_chatter/faye')
          client.publish "/rooms/#{current_room.id}", {
            text: @message.text,
            html: @message.html,
            author_username: @message.author.username
          }
          format.html { redirect_to room_path(current_room) }
          format.json { render json: @message, status: :created, location: @message }
        else
          format.html { render action: "new" }
          format.json { render json: @message.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /messages/1
    # PUT /messages/1.json
    def update
      @message = current_room.messages.find(params[:id])
  
      respond_to do |format|
        if @message.update_attributes(params[:message])
          format.html { redirect_to @message, notice: 'Message was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @message.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /messages/1
    # DELETE /messages/1.json
    def destroy
      @message = current_room.messages.find(params[:id])
      @message.destroy
  
      respond_to do |format|
        format.html { redirect_to room_messages_url(current_room) }
        format.json { head :no_content }
      end
    end

    def current_room
      @room ||= Room.find(params[:room_id]) # TODO: only if current user can actually do anything in this room
    end
  end
end
