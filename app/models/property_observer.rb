class PropertyObserver < ActiveRecord::Observer
  
  def before_create(model)
    Registration.all.each do |reg|
      
      # TODO: notify devices
      
      #curl "https://www.google.com/accounts/ClientLogin" -X POST -d "accountType=GOOGLE&Email=cmov.c2dm@gmail.com&Passwd=cmov2011&service=ac2dm&source=cmov-cmovc2dm-1.0"
      
      auth = "DQAAAIgAAADrNZJl5IQShdGdWROfUI2aZA-cK0MMZ1j9ZPEJ9v2NdipFEbP-NebWttloT0xIQwfQ7EaYhLYYAaGBKjx6xL1Hyo0M7s-d5lQZTI18MlmoAUQKZY0GsSO_acF7tcN53hJMW7gCb_i066jxPCIndTCVx3A2thohulBHYk_budshXzO2W5XJYuxgiI5z0CIFzms"
            
      params = {
        
        registration_id: reg.name,
        collapse_key: "New properties have been added",
        "data.property_kind" => model.kind,
        "data.property_city" => model.city
      }
      
      
      uri = URI('https://android.apis.google.com/c2dm/send')
      req = Net::HTTP::Post.new(uri.path)
      req.set_form_data(params)
      req["Authorization"] = "GoogleLogin auth=" + auth
      
      #p "*************************"
      #p req.body
      

      #res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      #  http.request(req)
      #end
      
      #request = Net::HTTP.post_form
      #    URI.parse('https://android.apis.google.com/c2dm/send'),
      #    params
      
    end
  end
  
end
