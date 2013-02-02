ActiveAdmin.register Venue do

    action_item do
      link_to "New event", :controller =>"events", :action => "new"
    end

  index do
  	column :id, :sortable => 'id'
	column "Name", :sortable => 'name' do |venue|
      link_to venue.name, admin_venue_path(venue) 
    end
    column :url, :sortable => 'url'
    column :address, :sortable => 'address'
    column :updated_at
    default_actions

  end

	show do |venue|
	   @venue = Venue.find(params[:id])
			attributes_table do
		        row :id
		        row :name
		        row :address
		        row :url
		        row :updated_at
		        row :created_at

	      	end



	table_for @venue.events do
		h5 "Events"
		column :title do |event|
	      link_to event.title, admin_event_path(event) 
	    end
	    column "Artists" do |event|
    	table_for event.artists do 
    		column do |artist|
    			link_to artist.name, admin_artist_path(artist) 
    		end
    	end 
    end

    
    end


  end
  
end
