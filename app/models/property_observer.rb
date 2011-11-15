require "net/http"
require "net/https"

class PropertyObserver < ActiveRecord::Observer
      TEST_EMAIL = "cmov.c2dm@gmail.com"
TEST_PASSWORD = "cmov2011"
TEST_REGISTRATION_ID = "DEVICE_TOKEN_RECEIVED_FROM_PHONE"
  
  def before_create(model)
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
      
      res = SpeedyC2DM::API.send_notification(options)
      
      p "***************** OPTIONS ************"
      p options

      p "***************** RES BODY ************"
      p res.body


      
    end
  end
  
end
