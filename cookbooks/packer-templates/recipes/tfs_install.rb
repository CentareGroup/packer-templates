windows_package 'tfs installer' do
  source 'https://go.microsoft.com/fwlink/?LinkId=817331'
  installer :custom
  installer_type :custom
  options '/S /NoRestart'
  remote_file_attributes ({
    :path => 'C:\\tfsserver.exe'
  })
end

template 'configTFSBasic.ini' do
  source 'tfsconfigunattend.ini.erb'
  action :create
  variables(
    :hostname => node['hostname']
  )
end

# Use the tfsconfig utility to setup the server
execute 'tfsconfig server setup' do
  command '%programfiles%\Microsoft Team Foundation Server 15.0\Tools\TFSConfig.exe Unattend /configure /type:basic /unattendfile:configTFSBasic.ini'
  action :run
end
