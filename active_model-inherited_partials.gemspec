require_relative "lib/active_model/inherited_partials/version"
require_relative 'lib/active_model/inherited_partials/authors'

Gem::Specification.new do |spec|
  spec.platform    = Gem::Platform::RUBY
  spec.name        = "active_model-inherited_partials"
  spec.version     = ActiveModel::InheritedPartials::VERSION
  spec.authors     = ActiveModel::InheritedPartials::AUTHORS.filter_map &:name
  spec.email       = ActiveModel::InheritedPartials::AUTHORS.filter_map &:email
  spec.homepage    = "#{ActiveModel::InheritedPartials::AUTHORS.filter_map(&:github_url).first}/#{spec.name}"
  spec.summary     = "Inheritable partials for Rails"
  spec.description = "A Rails Engine to let models inherit partials until overridden."
  spec.license     = "MIT"

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"]   = "#{spec.metadata['source_code_uri']}/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md", 'CHANGELOG.md']
  end

  spec.required_ruby_version = '>= 3.2'

  spec.add_dependency 'rails', '~> 7.1'
end
