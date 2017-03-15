class TagsController < ApplicationController
  def create
    if interactor.add_tag
      flash[:success] = 'Tag added!'
    else
      flash[:failure] = "Tag save failed.  Ensure it has a name and is not "\
        "a duplicate."
    end

    redirect_to company_path(company)
  end

  private

  def interactor
    @interactor ||= AddTagInteractor.new(
      company: company,
      tag_params: params.require(:tag).permit(:name)
    )
  end

  def company
    @company ||= Company.find(params[:company_id])
  end
end
