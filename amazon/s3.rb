#note from tommy -- I discovered this on a blog online so I don't claim IP on it
#!/usr/bin/env ruby
require 'rubygems'
require 'aws/s3'

AWS::S3::Base.establish_connection!(
  :access_key_id => '',
  :secret_access_key => '+G'
)

file = ARGV.first
bucket = "static_garage"

AWS::S3::S3Object.store(File.basename(file), 
                        open(file), 
                        bucket, 
                        :access => :public_read)

puts AWS::S3::S3Object.url_for(File.basename(file), bucket)[/[^?]+/]

