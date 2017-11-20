iis 'Install IIS' do
  action :install
end

# Deploy the content for the site Reporting
template "Generate the content for reporting site" do
  path "D:\\inetpub\\reporting\\default.html"
  source "reporting_default_html.erb"
end

