json.members do
	json.array!(@members) do |member|
		json.first_name member.id.to_s + ' - ' + member.first_name + ' ' + member.last_name
		json.url member_path(member)
	end
end
json.children do
	json.array!(@children) do |child|
		json.first_name child.id.to_s + ' - ' + child.first_name + ' ' + child.last_name
		json.url child_path(child)
	end
end
