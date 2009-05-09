require 'test_helper'

class JspecRailsTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def setup
    @jspec_rails = JspecRails.new('../../#jspec_config_test.yml')
    FileUtils.cp(File.join(Rails.root, 'jspec', 'jspec_example.yml'), @jspec_rails.config_file)
  end

  should "exist in the system" do
    assert @jspec_rails.is_a? JspecRails
  end

  should "be able to load yaml file" do
    @jspec_rails.load_config
    assert_nil @jspec_rails.config['hello']
    assert @jspec_rails.config['watched_dirs']
  end

  should "be able to write to the config" do
    @jspec_rails.load_config
    @jspec_rails.config['ouch'] = "oucher"
    @jspec_rails.write_config
    @jspec_rails.config = nil
    assert @jspec_rails.load_config
    assert_not_nil @jspec_rails.config['required_libs'] 
    assert_not_nil @jspec_rails.config['ouch']  
    assert_equal "oucher", @jspec_rails.config['ouch']  
  end
  
  should "be able to return all library paths" do
    libs = @jspec_rails.required_libs
    assert_equal 3, libs.length
    assert_equal 'prototype', libs[0]
  end
  
  should "be able to return all spec files" do
    files = @jspec_rails.spec_files
    assert_equal 1, files.length
    assert_equal 'jspec_rails_spec.js', files[0]
  end 

  should "be able to get all watched files for a directory" do
    files = @jspec_rails.watched_files_for_dir('jspec/spec')
    assert_equal 2, files.length
    assert_equal 'jspec_rails_spec.js', File.basename(files[0])
  end 
  
  should "be able to tell if a file has changed in an observed directory" do
    assert !@jspec_rails.watched_dir_changed?('jspec/spec')
    FileUtils.touch(Rails.root + 'jspec/spec/jspec_rails_spec.js')    
    assert @jspec_rails.watched_dir_changed?('jspec/spec')    
  end

  should "should be able to tell if any watched file has changed" do
    sleep 3.1
    assert !@jspec_rails.file_changed?
    FileUtils.touch(File.join(Rails.root, 'public', 'javascripts', 'prototype.js'))
    assert @jspec_rails.file_changed?
  end  
  
  
end 
