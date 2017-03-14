module ApplicationHelper
  def date(date)
    date.strftime("%B #{date.day.ordinalize} %Y")
  end

  def company_location(company)
    "#{company.city}, #{company.state}"
  end
end
