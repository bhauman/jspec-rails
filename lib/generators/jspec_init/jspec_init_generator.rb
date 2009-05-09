class JspecInitGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.directory 'jspec_g'
      m.directory 'jspec_g/fixtures'
      m.directory 'jspec_g/spec'      
      m.template 'spec/index.html.erb', File.join('jspec_g/spec', 'index.html.erb')
      m.template 'spec/jspec_rails_spec.js', File.join('jspec_g/spec', 'jspec_rails_spec.js')
      m.template 'fixtures/test_fixture.html.erb', File.join('jspec_g/fixtures', 'test_fixture.html.erb')
      m.template 'jspec.yml', File.join('jspec_g', 'jspec.yml')                  
    end
  end

  protected
    def banner
      "Usage: #{$0} #{spec.name} ModelName [field:type, field:type]"
    end
end
