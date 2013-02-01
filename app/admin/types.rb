ActiveAdmin.register Type do



  	show do |type|
	   @type = Type.find(params[:id])
			attributes_table do
		        row :id
		        row :gid
		        row :name
		        row :singular
		        row :updated_at
		        row :created_at

	      	end



		
	end
	  
end
