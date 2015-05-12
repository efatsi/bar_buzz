task "data:collect" => :environment do
  Core.all.each do |core|
    if core.connected?
      puts "Collecting data for #{core.name}"
      puts core.fetch_data
    end
  end
end
