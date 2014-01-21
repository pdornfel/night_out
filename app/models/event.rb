class Event < ActiveRecord::Base

  before_validation :set_time

  validates_presence_of :name
  validates_presence_of :time

  belongs_to :group
  has_many :proposed_locations

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

end


# [1] pry(#<Event>)> @faketime
# => "12:00 AM"
# [2] pry(#<Event>)> @fakedate
# => "16 January, 2014"
# [3] pry(#<Event>)> time
# => nil
# [4] pry(#<Event>)> DateTime.new(2013, 4, 5)
# => Fri, 05 Apr 2013 00:00:00 +0000
# [5] pry(#<Event>)> d = DateTime.new(2013, 4, 5)
# => Fri, 05 Apr 2013 00:00:00 +0000
# [6] pry(#<Event>)> d.strftime('%Y %m')
# => "2013 04"
# [7] pry(#<Event>)> d = DateTime.new(2014, 1, 16, 12, 00, 00)
# => Thu, 16 Jan 2014 12:00:00 +0000
