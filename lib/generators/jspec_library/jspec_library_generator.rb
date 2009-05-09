class JspecLibraryGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      # Model class, unit test, and fixtures.
      m.template 'library.js',      File.join('public/javascripts', "#{file_name}.js"), :collision => :skip
      m.template 'library_spec.js', File.join('jspec/spec', "#{file_name}_spec.js"), :collision => :skip      
      m.template 'fixture.html.erb',  File.join('jspec/fixtures', "#{file_name}.html.erb"), :collision => :skip
      JspecRails.new().add_library( file_name )  
    end
  end
  
  protected
    def banner
      "Usage: #{$0} #{spec.name} LibraryName"
    end
end
