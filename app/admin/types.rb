ActiveAdmin.register Type do



  	show do |type|
	   @event = Event.find(params[:id])
			attributes_table do
		        row :id
		        row :name
		        row :singular
		        row :updated_at
		        row :created_at

	      	end



		table_for @event.categories do
			h5 "Categories"
			column :title do |category|
		      link_to category.name, admin_category_path(category) 
		    end
	    end
	end
	  
end
