class StocksController < ApplicationController
helper :all
  # GET /stocks
  # GET /stocks.json
  def index
    @stocks = Stock.all

    respond_to do |format|
      format.html
      format.rss
      format.xls { send_data @stocks.to_xls, content_type: 'application/vnd.ms-excel', filename: 'stocks.xls' }
    end
  end

  def export
   respond_to do |format|
      render "export"
      #format.html # index.html.erb
      #format.json { render json: @stocks }
      #format.xls { send_data @stocks.to_xls, content_type: 'application/vnd.ms-excel', filename: 'stocks.xls' }
    end
end

  # GET /stocks/1
  # GET /stocks/1.json
  #def show
   # @stock = Stock.find(params[:id])

    #respond_to do |format|
     # format.html # show.html.erb
     # format.json { render json: @stock }
    #end
  #end

  # GET /stocks/new
  # GET /stocks/new.json
  def new
    @stock = Stock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stock }
    end
  end

  # GET /stocks/1/edit
  def edit
    @stock = Stock.find(params[:id])
  end

  # POST /stocks
  # POST /stocks.json
  def create
    @stock = Stock.new(params[:stock])

    respond_to do |format|
      if @stock.save
        format.html { redirect_to new_stock_path, notice: 'Stock was successfully created.' }
        format.json { render json: @stock, status: :created, location: @stock }
      else
        format.html { render action: "new" }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stocks/1
  # PUT /stocks/1.json
  def update
    @stock = Stock.find(params[:id])

    respond_to do |format|
      if @stock.update_attributes(params[:stock])
        format.html { redirect_to @stock, notice: 'Stock was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy

    respond_to do |format|
      format.html { redirect_to stocks_url }
      format.json { head :no_content }
    end
  end
end
