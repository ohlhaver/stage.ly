ActiveAdmin.register Affinity do

  index do
  	column :id
	column "Title", :sortable => 'title' do |affinity|
      link_to affinity.title, admin_affinity_path(affinity) 
    end
  	column :artist, :sortable => 'artist_id'
    column :category, :sortable => 'category_id'
    column :updated_at
    default_actions

  end
  
end
