var JspecRails = {
  init: function(options) {
    JspecRails.options = options || {};
    JspecRails.rails_auth_token = options.authenticity_token;
    JspecRails.setup_periodical_check();
    document.observe('dom:loaded', function(){
      return function(){ 
        if(!JspecRails.jspec_run_error)
          JspecRails.insert_visible_failure_message.delay(0.3);
      }.delay(0.7); 
    });
  },
  check_for_changed_files: function() {
    new Ajax.Request('/jspec/changed', {
      parameters: { authenticity_token: JspecRails.rails_auth_token },
      onSuccess: JspecRails.file_changed
    });
  },
  file_changed: function(transport) {
    location.href = location.href;
  },
  setup_periodical_check: function() {
    if(!JspecRails.executor)
      JspecRails.executer = new PeriodicalExecuter(JspecRails.check_for_changed_files, 2);
  },
  insert_visible_failure_message: function() {
    if(!$$('.heading .failures em')[0]) {
      JspecRails.set_red();
    } else if($$('.heading .failures em')[0] && $$('.heading .failures em')[0].innerHTML != '0' ) {
      JspecRails.set_red();
    } else {
      JspecRails.set_green();
    }
  },
  set_green: function() {
    $$('body')[0].setStyle({backgroundColor:'#88fa88', backgroundImage:'none'});
  },
  set_red: function() {
    $$('body')[0].setStyle({backgroundColor:'#fa8888', backgroundImage:'none'});
  },
  create_play_area: function() {
    if(!JspecRails.play_area) {
      JspecRails.play_area = new Element('div', { id:'play_area', style:'z-index:-1000'});
      $$('body')[0].insert(JspecRails.play_area);
    }
  },
  load_fixture: function(fixture_name) {
    JspecRails.create_play_area();
    new Ajax.Updater(JspecRails.play_area, '/jspec/fixture/' + fixture_name, 
     { parameters: { authenticity_token: JspecRails.rails_auth_token },
       asynchronous: false } ); 
  },
  clear_fixture: function() {
    if(JspecRails.play_area)
      JspecRails.play_area.update('');
  }

};