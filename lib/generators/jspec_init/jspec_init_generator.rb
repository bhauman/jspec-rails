class JspecInitGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.directory 'jspec'
      m.directory 'jspec/fixtures'
      m.directory 'jspec/spec'      
      m.template 'spec/index.html.erb', File.join('jspec/spec', 'index.html.erb')
      m.template 'spec/jspec_rails_spec.js', File.join('jspec/spec', 'jspec_rails_spec.js')
      m.template 'fixtures/test_fixture.html.erb', File.join('jspec/fixtures', 'test_fixture.html.erb')
      m.template 'jspec.yml', File.join('jspec', 'jspec.yml')

      m.directory 'public/jspec'
      %w(jspec.js jspec.jquery.js jspec.css).each do |f|
        m.file File.join('jspec/', f), File.join('public/jspec', f)
      end
      
      m.directory 'public/jspec/images'
      %w(bg.png hr.png sprites.bg.png sprites.png vr.png).each do |f|
        m.file File.join('jspec/images', f), File.join('public/jspec/images', f)
      end      
    end
  end

  protected
    def banner
      "Usage: #{$0} #{spec.name} ModelName [field:type, field:type]"
    end
end
