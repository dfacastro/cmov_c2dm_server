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
      
      #auth = "DQAAAIgAAADrNZJl5IQShdGdWROfUI2aZA-cK0MMZ1j9ZPEJ9v2NdipFEbP-NebWttloT0xIQwfQ7EaYhLYYAaGBKjx6xL1Hyo0M7s-d5lQZTI18MlmoAUQKZY0GsSO_acF7tcN53hJMW7gCb_i066jxPCIndTCVx3A2thohulBHYk_budshXzO2W5XJYuxgiI5z0CIFzms"
      #auth ="DQAAAIkAAABcMKeSYJaEmbMqZ8Vb9FoV9YrChy8fVnJyew0hCLoWZR0UfY4tV1jOU0cyWvPTnQs43IXDfbID363qoLl0QE354gJZSP4cAlqrCZ3LpD3UoMuGe2uJJpWSTjTOzp9SDndpUBa83Xr5EQT3mJ3F5GznZ6Y6XajHGT_dyvbes6TmZGqkmosKV-j9wHXQlt0cpx0"
      params = {
        
        registration_id: reg.name,
        collapse_key: "New properties have been added",
        "data.property_kind" => model.kind,
        "data.property_city" => model.city
      }
      
=begin      
      uri = URI.parse('https://android.apis.google.com/c2dm/send')
      req = Net::HTTP::Post.new(uri.path)
      req.set_form_data(params)
      req["Authorization"] = "auth=" + auth
  
      p "**************"
      req.each_header do |h|
        p h
        p req[h]
      end
=end         
      #p "*************************"
      #p req.body

=begin
       http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      res = http.start do |http|

        http.request(req)
      end
 
  
=end      

#      res = Net::HTTP.new(uri.host, uri.port).start do |http|
#        http.request(req)
#      end
 
 options = {
  :registration_id => "DQAAAK4AAACt3sMmwD3YVkalQ1TwhFlcn4QR2xSgkBbqdKC5FaSlMhUP1GgcGvJGtwnkZm8D-vdpjUShS42daGDKKgk-LrtBZcUvsWkCRCzIbpvnrSaPIa0O6kAiueASfp_OVeMePXLDH3uGDzhgk9q6ZW0509YqKV-JMctPgqyFble4dYnVfJJE_lqRqF6gqHefTbBnXgw42pCHRmNODCCk99fvE0efe6vfvN5ZUPX3jR3-BsqfFQ",
  :message => "Hi!",
  :extra_data => nil,
  :collapse_key => "some-collapse-key"
}

 res = SpeedyC2DM::API.send_notification(options)
      
      
      
      
      
      p "***************+ RES ***************"
      p res
      p "***************** RES BODY ************"
      p res.body
      


      
      #request = Net::HTTP.post_form
      #    URI.parse('https://android.apis.google.com/c2dm/send'),
      #    params
      
    end
  end
  
end
