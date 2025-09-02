Before do
  @real_home = ENV['HOME']
  fake_home = File.join('/tmp','fake_home')
  FileUtils.rm_rf fake_home, :secure => true
  FileUtils.mkdir_p fake_home
  ENV['HOME'] = fake_home
end
After do
  ENV['HOME'] = @real_home
end
