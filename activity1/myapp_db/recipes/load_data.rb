#
# Cookbook Name:: myapp_database
# Recipe:: fill data
#
# Download World sample database from MySQL server and install it

package "unzip"

mysql_connection_info  = {
  :host     => 'localhost',
  :username => 'root',
  :password => node.mysql.server_root_password
}

# Query a database from a sql script on disk
remote_file "#{Chef::Config[:file_cache_path]}/world_innodb.sql.zip" do
  source "http://downloads.mysql.com/docs/world_innodb.sql.zip"
end

execute "unzip -o #{Chef::Config[:file_cache_path]}/world_innodb.sql.zip" do
  creates "#{Chef::Config[:file_cache_path]}/world_innodb.sql"
end


mysql_database "run_db_script" do
  connection mysql_connection_info
  database_name node.db.name
  sql { ::File.open("#{Chef::Config[:file_cache_path]}/world_innodb.sql").read }
  action :query
end