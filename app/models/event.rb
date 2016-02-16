class Event < ActiveRecord::Base
  has_and_belongs_to_many :employees

  # Select events occurring between `from` and `to`
  #
  # @param [Time] from
  # @param [Time] to
  def self.between(from, to)
    where('start > :lo and start < :up',
          lo: from.to_formatted_s(:db),
          up: to.to_formatted_s(:db)
    )
  end
end