attributes :id, :name, :imported_from_provider, :bio
node(:profile_url) { |p| person_url p }
node(:photo_url) { |p| p.photo_url(:medium) }