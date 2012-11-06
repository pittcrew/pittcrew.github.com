require "rubygems"

s3_bucket = "www.pittcrew.net"

task :default => 'generate'

desc "Generate jekyll site"
task :generate do
  puts "## Generating site with Jekyll"
  system "jekyll --safe"
end

desc "Launch preview environment"
task :preview do
  system "jekyll --auto --server"
end # task :preview
 
desc "Deploy generated site to Amazon S3"
task :deploy => [:generate] do
  puts "## Deploying site to S3 bucket #{s3_bucket}"
  system ("s3cmd -P --no-preserve sync _site/ s3://#{s3_bucket}")
end
