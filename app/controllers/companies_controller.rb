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

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      flash[:success] = 'Company updated!'
      redirect_to company_url(@company)
    else
      render :edit
    end
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

  def destroy
    Company.find(params[:id]).destroy
    flash[:success] = 'Company destroyed!'
    redirect_to root_url
  end

  private

  def company_params
    params
      .require(:company)
      .permit(:name, :city, :state, :description, :founded_at)
  end
end
