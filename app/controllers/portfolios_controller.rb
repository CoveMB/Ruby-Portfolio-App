class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  access all: [:show, :index, :data_engineering], user: {except: [:destroy, :new, :update, :edit]}, site_admin: :all
  layout 'portfolio'

  def index
    @portfolios = Portfolio.with_attached_image.by_position
    @page_title = 'Things I did'
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position] )
    end
    render nothing: true
  end

  def data_engineering
    @portfolios = Portfolio.data_engineering
  end

  def new
    @portfolio = Portfolio.new
    3.times { @portfolio.technologies.build }
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @page_title = @portfolio.title
  end

  def edit
    3.times { @portfolio.technologies.build }
  end

  def update
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(
                                        :title,
                                        :subtitle,
                                        :body,
                                        :image,
                                        technologies_attributes: [:name]
                                      )
    end
end
