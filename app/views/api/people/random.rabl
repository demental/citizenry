object :@person
attributes :id, :name, :imported_from_provider
node(:profile_url) { |p| url_for p }
node(:photo_url) { |p| p.photo_url(:medium) }