module ApplicationHelper
    
    def nav_link(link_text, link_path)
        content_tag(:li, class: ('current' if link_path == url_for(only_path: true)) ) do
            link_to link_text, link_path
        end
    end
end
