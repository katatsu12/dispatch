class NewsWorker
  include Sidekiq::Worker

  def perform(*args)
    # Do something
    HardWorker.perform_in(1.seconds, 'bob', 5)
  end
end
