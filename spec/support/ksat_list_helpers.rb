module KsatListHelpers
	def visit_ksat_list(list)
		visit "/ksat_lists"
		within dom_id_for(list) do
			click_link "List Items"
		end
	end
end