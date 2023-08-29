json.array! @pirates do |pirate|
    json.id pirate.id
    json.name pirate.name
    json.position pirate.position 
    json.bounty pirate.bounty 
    json.crew do
        json.partial! 'crews/crew', crew: pirate.crew 
    end
end
