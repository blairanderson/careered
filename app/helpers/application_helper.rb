module ApplicationHelper
  def title
    ENV["TITLE"] ||= "Careered."
  end
end
