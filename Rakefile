require 'rake/extensiontask'
spec = Gem::Specification.load('moment.gemspec')
# add your default gem packing task
# Gem::PackageTask.new(spec) do |pkg|
# end

# Rake::ExtensionTask.new('moment', spec)


Rake::ExtensionTask.new "moment" do |ext|
  ext.lib_dir = "lib/moment"
  ext.gem_spec = spec
end