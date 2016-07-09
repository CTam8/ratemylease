module ApplicationHelper

    #Returns the full page title to the tab on a per-page basis
    def full_title(page_title = '')
            base_title = "Rate My Lease"
        if page_title.empty?
            return base_title
        else
            return "#{page_title} | #{base_title}"
        end
    end
end
