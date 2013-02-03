ActiveAdmin.register Work do

	    action_item do
      link_to "New event", :controller =>"events", :action => "new"
    end

	form do |f|
	    f.inputs "Work" do
	      f.input :name
	    end
	    f.inputs "Composers" do  
	      f.input :composers
	    end

	    f.inputs "Categories" do 
	      f.input :categories
	    end

	    f.inputs "Subcategories" do 
	      f.input :subcategory
	    end


	    f.buttons
  	end

  	show do |work|
	   @work = Work.find(params[:id])
			attributes_table do
		        row :id
		        row :name
		        row :updated_at
		        row :created_at
	      	end

	    table_for @work.composers do
			h5 "Composers"
			column :title do |composer|
		      link_to composer.name, admin_artist_path(composer) 
		    end
	    end

	    table_for @work.categories do
			h5 "Categories"
			column :title do |category|
		      link_to category.name, admin_category_path(category) 
		    end
	    end
	end
  
end
