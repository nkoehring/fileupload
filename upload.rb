require "sinatra"
require "tilt/haml"
require "fileutils"


get '/' do
  return haml(:upload)
end


post '/upload' do

  tempfile = params['file'][:tempfile]
  filename = params['file'][:filename]

  STDERR.puts "Uploading file, original name #{filename.inspect}"
  FileUtils.cp(tempfile.path, "./uploads/#{filename}")

  "upload complete"
end
