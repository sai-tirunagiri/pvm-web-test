cookbook_name = __FILE__.split('/')[-3]

if ENV['Environment'].to_s.split('-')[0] == 'prd'
  default[cookbook_name]['NonProdOrBlank'] = ''
  default[cookbook_name]['NonPrdOrPrd'] = 'Prd'
  default[cookbook_name]['NonProdOrProd'] = 'Prod'
  default[cookbook_name]['EnvExtension'] = ''  
  default[cookbook_name]['configure_dns'] = false
else
  default[cookbook_name]['NonProdOrBlank'] = 'NonProd'
  default[cookbook_name]['NonPrdOrPrd'] = 'NonPrd'
  default[cookbook_name]['NonProdOrProd'] = 'NonProd'
  default[cookbook_name]['EnvExtension'] = "-#{ENV['Environment']}"
  default[cookbook_name]['configure_dns'] = true
end

default[cookbook_name]['BizTalkServer'] = ENV['BizTalkServer'].to_s

files_folder = File.expand_path('../files', File.dirname(__FILE__))
files_configuration = "#{files_folder}/configuration"
default[cookbook_name]['files_folder'] = files_folder
default[cookbook_name]['files_configuration'] = files_configuration
default[cookbook_name]['files_dependencies'] = "#{files_folder}/dependencies"
default[cookbook_name]['files_config_permissions'] = "#{files_configuration}/permissions"
default[cookbook_name]['files_config_iis'] = "#{files_configuration}/iis"
default[cookbook_name]['files_deploy'] = "#{files_folder}/deploy"
default[cookbook_name]['files_config_scheduled_tasks'] = "#{files_configuration}/scheduled_tasks"
default[cookbook_name]['downloads_path'] = 'C:\chef_downloads'

#Identify if is an clone environment like? uat-2, dev-2, qat-2
default[cookbook_name]['is_cloned_environment'] = false
if ENV['Environment'].to_s.include? '-' # TO DO
  default[cookbook_name]['is_cloned_environment'] = true
end