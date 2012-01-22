Dummy::Application.routes.draw do
  match "/action_with_sso" => "uservoice_test#action_with_sso"
  match "/assignment" => "uservoice_test#assignment"
  match "/config_js_default" => "uservoice_test#config_js_default"
  match "/config_js_custom_forum" => "uservoice_test#config_js_custom_forum"
  match "/config_js_custom_alignment" => "uservoice_test#config_js_custom_alignment"
  match "/config_js_erb" => "uservoice_test#config_js_erb"
end
