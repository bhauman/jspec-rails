
// JSpec - jQuery - Copyright TJ Holowaychuk <tj@vision-media.ca> (MIT Licensed)

(function(){

  // --- Dependencies

  JSpec.requires('jQuery', 'when using jspec.jquery.js')
  
  // --- Async Support

  jQuery.ajaxSetup({ async : false })

  // --- Helpers

  JSpec.defaultContext.element = jQuery
  JSpec.defaultContext.elements = jQuery
  JSpec.defaultContext.defaultSandbox = JSpec.defaultContext.sandbox
  JSpec.defaultContext.sandbox = function() { return jQuery(JSpec.defaultContext.defaultSandbox()) }

  // --- Matchers

  JSpec.addMatchers({
    have_tag      : "jQuery(expected, actual).length == 1",
    have_one      : "alias have_tag",
    have_tags     : "jQuery(expected, actual).length > 1",
    have_many     : "alias have_tags",
    have_child    : "jQuery(actual).children(expected).length == 1",
    have_children : "jQuery(actual).children(expected).length > 1",
    have_text     : "jQuery(actual).text() == expected",
    have_value    : "jQuery(actual).val() == expected",
    be_visible    : "!jQuery(actual).is(':hidden')",
    be_hidden     : "jQuery(actual).is(':hidden')",
    be_enabled    : "!jQuery(actual).attr('disabled')",
    have_class    : "jQuery(actual).hasClass(expected)",
    
    have_classes : function(actual) {
      for (i = 1; i < arguments.length; i++)
        if (!jQuery(actual).hasClass(arguments[i])) return false
      return true
    },
    
    have_attr : function(actual, attr, value) {
      return value ? jQuery(actual).attr(attr) == value:
                     jQuery(actual).attr(attr)
    }
  })
  
  // --- be_BOOLATTR
  
  JSpec.each('disabled selected checked', function(attr){
    JSpec.addMatcher('be_' + attr, "jQuery(actual).attr('" + attr + "')")
  })
  
  // --- have_ATTR
  
  JSpec.each('type id title alt href src rel rev name target', function(attr){
    JSpec.addMatcher('have_' + attr, function(actual, value) {
      return JSpec.matchers.have_attr.match(actual, attr, value)
    })
  })
  
  // --- be_a_TYPE_input (deprecated)
  
  JSpec.each('checkbox radio file password submit image text reset button', function(type){
    JSpec.addMatcher('be_a_' + type + '_input', function(actual, expected) {
      console.warn("be_a_" + type + "_input is deprected; use have_type('" + type + "')");
      return jQuery(actual).get(0).type == type
    })
  })
  
})()


