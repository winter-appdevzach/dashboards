Rails.application.routes.draw do

  get("/forex", {:controller =>"currencies", :action => "first_currency"})

  get("/forex/:from_currency", {:controller =>"currencies", :action=>"second_currency"})

  get("/forex/:from_currency/:to_currency", {:controller =>"currencies", :action=>"result"})

  #make conversion work--- get two pieces of data. router route with 2 dynamic segements. 
  #fetch both of them from params hash, and use that last point from hash to compose url. 

end
