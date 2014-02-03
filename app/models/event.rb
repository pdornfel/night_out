class Event < ActiveRecord::Base

include ActionView::Helpers::DateHelper

  before_validation :set_time

  validates_presence_of :name
  validates_presence_of :time

  belongs_to :group

  has_many :proposed_locations,
    dependent: :destroy

  has_many :votes

  def set_time
    t = "#{@faketime}, #{@fakedate}"
    if t != ", "
      f = DateTime.parse(t)
      self.time = f
    end
  end

  def faketime
  end

  def faketime=(faketime)
    @faketime = faketime
  end

  def fakedate
  end

  def fakedate=(fakedate)
    @fakedate = fakedate
  end

  def countdown
    # fixed for eastern standard...18000 to offset UTC time mismatch
    seconds = time - DateTime.now.utc+18000

    if seconds > 0
      "#{time_ago_in_words((time - DateTime.now.utc+18000).from_now)} from now"
    else
      "Event has ended"
    end
  end

  def location
    actual_location = nil
    count = 0
    proposed_locations.each do |location|
      if location.votes.count > count
        actual_location = location
        count = location.votes.count
      end
    end
    if actual_location == nil
      "NO VOTES CASTED YET"
    else
      actual_location.name
    end
  end

  def count
    actual_location = nil
    count = 0
    proposed_locations.each do |location|
      if location.votes.count > count
        actual_location = location
        count = location.votes.count
      end
    end
    count
  end

end
