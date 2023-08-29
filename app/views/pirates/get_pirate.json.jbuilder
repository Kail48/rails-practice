json.id @pirate.id
json.name @pirate.name
json.position @pirate.position 
json.bounty @pirate.bounty 
json.crew @pirate.crew.name 
if @pirate.image.attached?

    json.image @base_url+url_for(@pirate.image) 
else 
    json.image nil
end  
