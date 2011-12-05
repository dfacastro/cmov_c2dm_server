class PropertyObserver < ActiveRecord::Observer
  
  def before_create(model)
    Registration.all.each do |reg|
      
      # TODO: notify devices
      
    end
  end
  
end
