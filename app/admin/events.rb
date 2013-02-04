ActiveAdmin.register Event do

#	controller do
#		belongs_to :artist, :polymorphic => true, :optional => true
#	end
    action_item do
      link_to "New event", :controller =>"events", :action => "new"
    end

  index do
  	column :id, :sortable => 'id'
	column "Title", :sortable => 'title' do |event|
      link_to event.title, admin_event_path(event) 
    end
    column "Artists" do |event|
    	table_for event.artists do 
    		column do |artist|
    			link_to artist.name, admin_artist_path(artist) 
    		end
    	end 
    end

  	column :time, :sortable => 'time'
    column :price, :sortable => 'price'
    column :url, :sortable => 'url'
    column :updated_at
    default_actions

  end


	show do |event|
	   @event = Event.find(params[:id])
			attributes_table do
		        row :id
		        row :type
		        row :title
		        row :venue
		        row :time
		        row :price
		        row :url
		        row :updated_at
		        row :created_at

	      	end



	table_for @event.performances do
		h5 "Performanes"
		column :title do |performance|
	      link_to performance.title, admin_performance_path(performance) 
	    end

    
    end

 


  end

    form do |f|
	    f.inputs "Event" do
	      f.input :type
	      f.input :worktitle
	      f.input :artisttitle
	      f.input :venue
	      f.input :time, :minute_step => 15
	      f.input :price
	      f.input :url
	    end

	    f.inputs "direct Composers" do 
	      f.input :direct_composers
	    end

	    f.inputs "direct Categories" do 
	      f.input :categories
	    end

	    f.inputs "direct Subcategories" do 
	      f.input :subcategories
	    end

	    f.inputs "Artists" do 
	      f.input :artists
	    end

	    f.inputs "Works" do 
	      f.input :works
	    end
	    f.buttons
  	end
  
end
