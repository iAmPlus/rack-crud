 Gem::Specification.new do |s|
  s.name        = 'rack-crud'
  s.version     = '0.0.4'
  s.date        = '2015-03-02'
  s.summary     = 'Rack router for your Rack app.'
  s.description = 'CRUD operations for a rack app.'
  s.authors     = ['George Ulmer']
  s.email       = 'george@boost-media.com'
  s.files       = ['lib/rack/crud.rb', 'lib/rack/app/request_handler.rb']
  s.homepage    = 'http://rubygems.org/gems/rack-crud'
  s.license     = 'MIT'
  
  s.add_development_dependency 'rack', ['1.6']
  s.add_development_dependency 'rack-routing', ['0.0.7']

  s.add_development_dependency 'rspec', ['3.2']
  s.add_development_dependency 'rack-test', ['0.6.2']
  s.add_development_dependency 'guard', ['2.12']
  s.add_development_dependency 'guard-rspec', ['4.5']
end