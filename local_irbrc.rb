def get_profile(file_name:, &)
  require "stackprof"

  profile = StackProf.run(mode: :wall, raw: true, &)

  File.write("log/#{file_name}.json", JSON.generate(profile))
end

def time_me(count: 3)
  times = count.times.map do
    now = Time.zone.now
    yield
    Time.zone.now - now
  end

  puts "Times:"
  pp times
  puts "Average:"
  puts times.sum / count
end
