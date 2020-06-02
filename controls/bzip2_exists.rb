title 'Tests to confirm bzip2 exists'

plan_origin = ENV['HAB_ORIGIN']
plan_name = input('plan_name', value: 'bzip2')
 
control 'core-plans-bzip2-exists' do
  impact 1.0
  title 'Ensure bzip2 exists'
  desc '
  '
  plan_installation_directory = command("hab pkg path #{plan_origin}/#{plan_name}")
  describe plan_installation_directory do
    its('exit_status') { should eq 0 }
    its('stdout') { should_not be_empty }
  end

  command_relative_path = input('command_relative_path', value: '/bin/bzip2')
  command_full_path = plan_installation_directory.stdout.strip + "#{command_relative_path}"
  describe file(command_full_path) do
    it { should exist }
  end
end
