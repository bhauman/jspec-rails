class JspecInitGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.directory 'jspec'
      m.directory 'jspec/fixtures'
      m.directory 'jspec/spec'
      m.directory 'public/javascripts'
      
      m.file 'spec/index.html.erb', File.join('jspec/spec', 'index.html.erb')
      m.file 'spec/jspec_rails_spec.js', File.join('jspec/spec', 'jspec_rails_spec.js')
      m.file 'fixtures/test_fixture.html.erb', File.join('jspec/fixtures', 'test_fixture.html.erb')
      m.file 'jspec.yml', File.join('jspec', 'jspec.yml')
      
      m.file 'jspec_rails.js', File.join('public/javascripts', 'jspec_rails.js')
      
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

end
