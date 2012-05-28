module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Agri Aid"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  def logo
    image_tag("AgriAidLogoV2.png", alt: "Agri Aid", class: "round")
  end
end	