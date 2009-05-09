namespace :jspec do
  desc "copy current working files to jspec init generator"
  task :copy_to_gen do
    FileUtils.cp_r(File.join(File.dirname(__FILE__), '../../jspec/.'),
                   File.join(File.dirname(__FILE__), '../generators/jspec_init/templates'),
                   :verbose => true )
  end 
end
