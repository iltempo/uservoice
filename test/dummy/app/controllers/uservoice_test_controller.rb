class UservoiceTestController < ActionController::Base
  def action_with_sso
    render :inline => '<%= uservoice_config_javascript(:sso => {:guid => 123, :display_name => "Bancheff", :email => "chef@bahn.de"}) %>'
  end

  def assignment
    render :nothing => true
  end

  def config_js_default
    render :inline => "<%= uservoice_config_javascript %>"
  end

  def config_js_custom_forum
    render :inline => "<%= uservoice_config_javascript(:forum => 815) %>"
  end

  def config_js_custom_alignment
    render :inline => "<%= uservoice_config_javascript(:alignment => 'right') %>"
  end

  def config_js_erb
    render :inline => "<%= uservoice_config_javascript %>"
  end
end