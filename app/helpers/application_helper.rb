module ApplicationHelper

	def signup_link
		return if current_user.nil?
		if current_user.role_user.role.name.eql?("Admin")
			text = link_to 'Sign up', new_user_registration_path
        	content_tag('li', text) 
        end
    end

    def link_to_add_fields(name, f, type)
	    new_object = f.object.send "build_#{type}"
	    id = "new_#{type}"
	    fields = f.send("#{type}_fields", new_object, child_index: id) do |builder|
	      render(type.to_s + "_fields", f: builder)
	    end
	    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  	end
end
