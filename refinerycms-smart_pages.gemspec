# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-smart_pages'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Smart Pages extension for Refinery CMS'
  s.date              = '2012-04-12'
  s.summary           = 'Smart Pages extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.1.0.dev'
  s.add_dependency             'acts_as_indexed',     '~> 0.7'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.1.0.dev'
end
