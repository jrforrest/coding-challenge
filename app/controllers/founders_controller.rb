class FoundersController < ApplicationController
  def create
    @founder = Founder.new(founder_params)
    if @founder.save
      flash[:success] = 'Founder added!'
      redirect_to company_path(@founder.company)
    else
      @company = @founder.company
      render :new
    end
  end

  private

  def founder_params
    params.require(:founder).permit(:company_id, :full_name, :position)
  end
end
