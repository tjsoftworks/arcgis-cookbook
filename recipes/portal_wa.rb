#
# Cookbook Name:: arcgis
# Recipe:: portal_wa
#
# Copyright 2015 Esri
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

arcgis_webadaptor "Setup Web Adaptor for Portal" do
  install_dir node['web_adaptor']['install_dir']
  setup node['web_adaptor']['setup']
  instance_name node['portal']['wa_name']
  action :install
end

arcgis_webadaptor "Configure Web Adaptor with Portal" do
  portal_url node['portal']['url']
  portal_local_url "https://" + node['portal']['domain_name'] + ":7443"
  install_dir node['web_adaptor']['install_dir']
  instance_name node['portal']['wa_name']
  username node['portal']['admin_username']
  password node['portal']['admin_password']
  action :configure_with_portal
end
