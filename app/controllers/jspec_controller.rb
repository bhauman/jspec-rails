class JspecController < ApplicationController
  layout false

  append_view_path('jspec/views_spec')
  append_view_path('jspec/views_fix')


  before_filter :init_jspec_rails

  
  def index
    @jspec_rails = JspecRails.new
  end
  
  def spec
    render(:action => params[:id])
  end
  
  def fixture
    render(:action => params[:id])
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
