class Background

  def self.start
    Log.create(message: "Background runner started.")
    Api.fetch
    Notification.new
    Log.create(message: "Background runner completed.")
  end
  handle_asynchronously :initialize

end
