ActiveAdmin.register Performance do
  menu false
  index do
  	column :id, :sortable => 'id'
	column "Title", :sortable => 'title' do |performance|
      link_to performance.title, admin_performance_path(performance) 
    end
  	column :artist, :sortable => 'id'
    column :event, :sortable => 'id'
    column :updated_at
    default_actions

  end
  
end
