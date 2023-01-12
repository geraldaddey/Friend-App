class FriendsController < ApplicationController
  before_action :set_friend, only: %i[ show edit update destroy ]

  # GET /friends or /friends.json
  def index
    @friends = Friend.all
  end

  # GET /friends/1 or /friends/1.json
  def show 
  end

  # GET /friends/new
  def new
    @friend = Friend.new
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends or /friends.json
  def create
    @friend = Friend.new(friend_params)

    if @friend.save
      redirect_to @friend, notice: "Friend was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /friends/1 or /friends/1.json
  def update
    if @friend.update(friend_params)
      redirect_to @friend, notice: "Friend was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /friends/1 or /friends/1.json
  def destroy
    @friend.destroy
    redirect_to friends_url, notice: "Friend was successfully deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_params
      params.require(:friend).permit(:first_name, :last_name, :email, :phone, :twitter)
    end
end
