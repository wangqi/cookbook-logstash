script "config_init" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
	sed -i 's|LS_HEAP_SIZE="500m"|LS_HEAP_SIZE="<%= node[:logstash][:javaheap] %>"|' /etc/init.d/logstash
  EOH
end

service 'mongos' do
  action [:enable, :start]
end