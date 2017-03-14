class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = 'Company saved!'
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def company_params
    params
      .require(:company)
      .permit(:name, :city, :state, :description, :founded_at)
  end
end
