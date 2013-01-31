ActiveAdmin.register Work do

	form do |f|
	    f.inputs "Work" do
	      f.input :name
	      f.input :category

	    end
	    f.inputs "Composers" do
	      
	      f.input :composers
	    end
	    f.buttons
  	end

  	show do |work|
	   @work = Work.find(params[:id])
			attributes_table do
		        row :id
		        row :name
		        row :category
		        row :updated_at
		        row :created_at
	      	end

	    table_for @work.composers do
			h5 "Composers"
			column :title do |composer|
		      link_to composer.name, admin_artist_path(composer) 
		    end
	    end
	end
  
end
