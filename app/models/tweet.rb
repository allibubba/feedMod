class Tweet < ActiveRecord::Base
  attr_accessible :user, :text
  after_create :notify


	private

  def notify
    # publish to juggernaut channel here
  end

end
