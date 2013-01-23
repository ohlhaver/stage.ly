ActiveAdmin.register Artist do

  index do
  	column :id, :sortable => 'id'
	column "Name", :sortable => 'name' do |artist|
      link_to artist.name, admin_artist_path(artist) 
    end
    column :updated_at
    default_actions

  end

	show do |artist|
	   @artist = Artist.find(params[:id])
			attributes_table do
		        row :id
		        row :name
		        row :updated_at
		        row :created_at
	      	end



	table_for @artist.affinities do
		h5 "Affinities"
		column :title do |affinity|
	      link_to affinity.title, admin_affinity_path(affinity) 
	    end
    end

    table_for @artist.performances do
		h5 "Performances"
		column :title do |performance|
	      link_to performance.title, admin_performance_path(performance) 
	    end
    end


  end
  
end
