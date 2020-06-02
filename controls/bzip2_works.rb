title 'Tests to confirm bzip2 works as expected'

plan_origin = ENV['HAB_ORIGIN']
plan_name = input('plan_name', value: 'bzip2')

control 'core-plans-bzip2-works' do
  impact 1.0
  title 'Ensure bzip2 works as expected'
  desc '
  Note: Since bzip2 --version not only outputs its version info to stderr
  but also random text to stout, then only the stderr is being checked in
  the test
  '
  plan_installation_directory = command("hab pkg path #{plan_origin}/#{plan_name}")
  describe plan_installation_directory do
    its('exit_status') { should eq 0 }
    its('stdout') { should_not be_empty }
  end
  
  plan_pkg_ident = ((plan_installation_directory.stdout.strip).match /(?<=pkgs\/)(.*)/)[1]
  plan_pkg_version = (plan_pkg_ident.match /^#{plan_origin}\/#{plan_name}\/(?<version>.*)\//)[:version]
  describe command("DEBUG=true; hab pkg exec #{plan_pkg_ident} bzip2 --version") do
    its('exit_status') { should eq 0 }
    its('stderr') { should_not be_empty }
    its('stderr') { should match /bzip2, a block-sorting file compressor.  Version #{plan_pkg_version}/ }
  end
end
