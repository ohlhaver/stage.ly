ActiveAdmin.register Category do

	index do
	  	column :id, :sortable => 'id'
		column "Name", :sortable => 'name' do |category|
	      link_to category.name, admin_category_path(category) 
	    end
	    column :updated_at
	    default_actions

  	end

  	show do |category|
  		@category = Category.find(params[:id])
  			attributes_table do
		        row :id
		        row :name
		        row :updated_at
		        row :created_at
	      	end

	  	table_for @category.affinities do
			h5 "Affinities"
			column :title do |affinity|
		      link_to affinity.title, admin_affinity_path(affinity) 
		    end
	    end

	end
  
end
