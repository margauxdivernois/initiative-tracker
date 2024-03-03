module ApplicationHelper

    # Create a <li> element with a link. Include the 'is-active'
    # class if link corresponds to the current page.
    # Source: https://stackoverflow.com/a/33231994
    def create_tab_link(text, path)
        class_name = current_page?(path) ? 'is-active' : ''

        content_tag(:li, class: class_name) do
          link_to text, path
        end
    end
end
