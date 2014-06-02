#
# Cookbook Name:: myapp_database
# Recipe:: default
#

mysql_connection_info  = {
  :host     => 'localhost',
  :username => 'root',
  :password => node.mysql.server_root_password
}

mysql_database node.db.name do
  connection mysql_connection_info
  action     :create
end

mysql_database_user node.db.user do
  connection mysql_connection_info
  password   node.db.pass
  action     :create
end

mysql_database_user node.db.user do
  connection    mysql_connection_info
  database_name node.db.name
  privileges    [:all]
  action        :grant
end
