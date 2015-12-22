module ApplicationHelper
    
    def nav_link(link_text, link_path)
        content_tag(:li, class: ('current' if link_path == url_for(only_path: true)) ) do
            link_to link_text, link_path
        end
    end
    
    def localize_datetime(d)
        #I18n.localize(d.to_s.to_datetime, :format => '%e de %B del %Y a las %I:%M %p')
        I18n.localize(d.to_s.to_datetime, :format => '%d/%m/%Y %I:%M %p')
    end
end