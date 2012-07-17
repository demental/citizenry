atom_feed(:url => people_path(:format=>:atom)) do |feed|

   feed.title("People list")
   feed.updated((@people.last.created_at rescue Time.now.utc))

   @people.each do |person|
     feed.entry(person) do |entry|
       entry.title(person.name)
       entry.content(person.bio, :type => 'html')
     end
   end
 end