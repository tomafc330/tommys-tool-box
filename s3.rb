#!/usr/bin/env ruby
require 'rubygems'
require 'aws/s3'

AWS::S3::Base.establish_connection!(
  :access_key_id => 'AKIAJNYNPBRODE6QZJBQ',
  :secret_access_key => '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'
)

file = ARGV.first
bucket = "static_garage"

AWS::S3::S3Object.store(File.basename(file), 
                        open(file), 
                        bucket, 
                        :access => :public_read)

puts AWS::S3::S3Object.url_for(File.basename(file), bucket)[/[^?]+/]

