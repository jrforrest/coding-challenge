class AddTagInteractor
  def initialize(company:, tag_params:)
    @company, @tag_params = company, tag_params
  end

  def add_tag
    company.tags << tag if can_add_tag?
  end

  private
  attr_reader :company, :tag_params

  def can_add_tag?
    tag.valid? and not company.tags.include?(tag)
  end

  def tag
    @tag ||= Tag.find_by(name: tag_params[:name]) || Tag.new(tag_params)
  end
end
