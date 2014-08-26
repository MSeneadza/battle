desc 'This task is called by the Heroku scheduler add-on'

task :update_counts => :environment do

  # hashtags = Hashtag.all
  # hashtags.each do |hashtag|
  #   hashtag.get_tweets
  # end

  Hashtag.all.find_in_batches(batch_size: 100) do |hashtags|

    hashtags.each { |hashtag| hashtag.get_tweets }
  end

end


