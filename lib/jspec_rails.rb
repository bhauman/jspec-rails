require 'find'
class JspecRails
  attr_accessor :config, :config_filename
  def initialize(config_filename = false)
    self.config_filename = config_filename || 'jspec.yml'
    load_config
  end

  def config_file
    File.join(Rails.root, 'jspec', config_filename)    
  end

  def load_config
    self.config = YAML.load_file(config_file)
  end
  
  def write_config
    File.open(config_file, 'w') { |io| io.write config.to_yaml }
  end
  
  def required_libs
    config['required_libs'] || []
  end

  def fixture_file(filename)
     File.join(Rails.root, 'jspec', 'fixtures', filename)
  end

  def spec_file(filename)
    File.join(Rails.root, 'jspec', 'spec', filename )
  end

  def spec_files
    Dir[File.join(Rails.root, 'jspec', 'spec') + '/*_spec.js' ].collect do |x|
      n = File.basename(x)
    end
  end

  def watched_files_for_dir(dir)
    files = []
    Find.find(File.join(Rails.root, dir)) do |f|
      files << f if !File.directory?(f)
    end
    files
  end

  def watched_dir_changed?(dir)
    changed_flag = false
    for f in watched_files_for_dir(dir)
      if File.exists?(f) && File.new(f).ctime > Time.new - 3
        changed_flag = true
        break
      end
    end
    changed_flag
  end

  def file_changed?
    changed_flag = false
    for dir in config['watched_dirs']
      if watched_dir_changed?(dir)
        changed_flag = true
        break
      end  
    end
    changed_flag
  end
  
end
