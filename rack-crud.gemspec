 Gem::Specification.new do |s|
  s.name        = 'rack-crud'
  s.version     = '0.1.4'
  s.date        = '2015-03-02'
  s.summary     = 'Rack router for your Rack app.'
  s.description = 'CRUD operations for a rack app.'
  s.authors     = ['George Ulmer']
  s.email       = 'george@boost-media.com'
  s.files       = ['lib/rack/crud.rb', 'lib/rack/app/request_handler.rb',
                   'lib/rack/app/request.rb', 'lib/rack/app/request_handler.rb',
                   'lib/rack/app/response.rb', 'lib/rack/models/crud_model.rb',
                   'lib/rack/requests/crud.rb']
  s.homepage    = 'http://rubygems.org/gems/rack-crud'
  s.license     = 'MIT'

  s.add_development_dependency 'rack', ['2.0.5']
  s.add_development_dependency 'rack-routing', ['0.0.10']
  s.add_development_dependency 'mustache', ['1.0.5']

  s.add_development_dependency 'rspec', ['3.7']
  s.add_development_dependency 'rack-test', ['1.0.0']
  s.add_development_dependency 'guard', ['2.14.2']
  s.add_development_dependency 'guard-rspec', ['4.7.3']
end
