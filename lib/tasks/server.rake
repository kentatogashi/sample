namespace :server do

  desc "Start rails development server as daemon program"
  task start: :environment do
    puts "Starting rails development"
    system "rails s -d"
  end

  desc "Stop rails development server"
  task stop: :environment do
    puts "Stopping rails development server"
    pid_file = "tmp/pids/server.pid"
    pid = File.read(pid_file).to_i
    Process.kill 9, pid
    File.delete pid_file
  end

  desc "Restart rails development server"
  task restart: :environment do
    puts "Restarting rails development server"
    Rake::Task['server:stop'].invoke()
    Rake::Task['server:start'].invoke()
  end

end
