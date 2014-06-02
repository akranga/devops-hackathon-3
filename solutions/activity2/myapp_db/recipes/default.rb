#
# Cookbook Name:: myapp_database
# Recipe:: default
#

include_recipe "database::mysql"
include_recipe "myapp_db::create"
include_recipe "myapp_db::load_data"