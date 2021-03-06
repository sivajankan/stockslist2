class StocklistsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_stocklist, only: [:show, :edit, :update, :destroy]
  layout "home"
  # GET /stocklists
  # GET /stocklists.json
  def index
    @stocklists = Stocklist.all

    respond_to do |format|
      format.html { render "angular_index" }
      format.json { render json: @stocklists }
    end
  end

  # GET /stocklists/1
  # GET /stocklists/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stocklist }
    end
  end

  # GET /stocklists/new
  # GET /stocklists/new.json
  def new
    @stocklist = Stocklist.new

    # respond_to do |format|
      # format.html # new.html.erb
      # format.json { render json: @stocklist }
    # end
  end

  # GET /stocklists/1/edit
  def edit
  end

  # POST /stocklists
  # POST /stocklists.json
  def create
    @stocklist = Stocklist.new(stocklist_params)
    #@stocklist = Stocklist.new(params[:stocklist])
    #@stocklist = Stocklist.create(stocklist_params)
    @stocklist[:ipoyear] = "#{params[:stocklist][:ipoyear]}-01-01"

    respond_to do |format|
      if @stocklist.save
        format.html { redirect_to @stocklist, notice: 'Stocklist was successfully created.' }
        format.json { render json: @stocklist, status: :created, location: @stocklist }
      else
        format.html { render :new }
        format.json { render json: @stocklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stocklists/1
  # PUT /stocklists/1.json
  def update
    params[:stocklist][:ipoyear] += "-01-01" unless params[:stocklist][:ipoyear].nil?

    respond_to do |format|
      if @stocklist.update(stocklist_params)
        format.html { redirect_to @stocklist, notice: 'Stocklist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @stocklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocklists/1
  # DELETE /stocklists/1.json
  def destroy
    @stocklist.destroy

    respond_to do |format|
      format.html { redirect_to stocklists_url }
      format.json { head :no_content }
    end
  end
  
  private
  def set_stocklist
      @stocklist = Stocklist.find(params[:id])
  end
  
  def stocklist_params
    params.require(:stocklist).permit(:industry, :ipoyear, :marketcap, :name, :sector, :symbol, :stockexchange)
  end  
end
