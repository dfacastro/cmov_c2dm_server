require "net/http"
require "net/https"

class PropertyObserver < ActiveRecord::Observer  
  def after_create(model)
    
    my_logger.info("******* Added Property no. " + model.id.to_s + " on " + DateTime.now.to_s + " *******")
    
    Registration.all.each do |reg|
      
      # TODO: notify devices      
      #curl "https://www.google.com/accounts/ClientLogin" -X POST -d "accountType=GOOGLE&Email=cmov.c2dm@gmail.com&Passwd=cmov2011&service=ac2dm&source=cmov-cmovc2dm-1.0"

      options = {
        
        registration_id: reg.name,
        collapse_key: "New properties have been added",
        "data.property_kind" => model.kind,
        "data.property_city" => model.city,
        "data.property_id" => model.id        
      }
      
      result = SpeedyC2DM::API.send_notification(options)
      
      if result.body == "Error=MissingRegistration"
        reg.destroy
      end
      
      my_logger.info(result.code + "\t" + result.message + "\t" + result.body.chomp + "\t\t" + reg.name)
     
    end
  end
  
  def my_logger
    @@my_logger ||= Logger.new("#{Rails.root}/log/c2dm.log")
  end
  
end
