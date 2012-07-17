require 'fakeweb'
FakeWeb.allow_net_connect = false
definition = Person.attachment_definitions[:attachment]
path = "https*://.*.amazonaws.com/.*"
path.gsub!(/:([^\/\.]+)/) do |match|
    "([^\/\.]+)"
end
FakeWeb.register_uri(:put, Regexp.new(path), :body => "OK")