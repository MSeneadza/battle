class TagBattlesController < ApplicationController
  before_action :set_tag_battle, only: [:show, :edit, :update, :destroy]

  autocomplete :hashtag, :name

  # GET /tag_battles
  # GET /tag_battles.json
  def index
    @tag_battles = TagBattle.all
  end

  # GET /tag_battles/1
  # GET /tag_battles/1.json
  def show
  end

  # GET /tag_battles/new
  def new
    @tag_battle = TagBattle.new
  end

  # GET /tag_battles/1/edit
  def edit
  end

  # POST /tag_battles
  # POST /tag_battles.json
  def create
    user = current_user
    #tag_battle = TagBattle.new(tag_battle_params)

    @tag_battle = TagBattle.create_battle(user, tag_battle_params[:tag1], tag_battle_params[:tag2], tag_battle_params[:description])

    respond_to do |format|
      if @tag_battle.save
        format.html { redirect_to @tag_battle, notice: 'Tag battle was successfully created.' }
        format.json { render :show, status: :created, location: @tag_battle }
      else
        format.html { render :new }
        format.json { render json: @tag_battle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tag_battles/1
  # PATCH/PUT /tag_battles/1.json
  def update
    respond_to do |format|
      if @tag_battle.update(tag_battle_params)
        format.html { redirect_to @tag_battle, notice: 'Tag battle was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag_battle }
      else
        format.html { render :edit }
        format.json { render json: @tag_battle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_battles/1
  # DELETE /tag_battles/1.json
  def destroy
    @tag_battle.destroy
    respond_to do |format|
      format.html { redirect_to tag_battles_url, notice: 'Tag battle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag_battle
      @tag_battle = TagBattle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_battle_params
      params.require(:tag_battle).permit(:tag1, :tag2, :description)
    end
end
