class JspecController < ApplicationController
  layout false

  append_view_path('app/..')

  before_filter :init_jspec_rails

  def index
    @jspec_spec_files = @jspec_rails.spec_files
    render(:action => 'spec/index')
  end
  
  def only
    @jspec_spec_files = @jspec_rails.get_single_spec(params[:id])
    render(:action => 'spec/index')    
  end
  
  def spec
    render(:action => 'spec/' + params[:id])
  end
  
  def fixture
    render(:action => 'fixtures/' + params[:id])
  end

  def changed
    if @jspec_rails.file_changed?
      render(:text => 'CHANGED', :status => 200)  
    else
      render(:text => 'NOT_CHANGED', :status => :unprocessable_entity)
    end
  end
  
  private
  
  def init_jspec_rails
    @jspec_rails = JspecRails.new
  end
end
