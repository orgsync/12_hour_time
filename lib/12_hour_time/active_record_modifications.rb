module TwelveHourTime
  module AR
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def instantiate_time_object_with_ampm(name, values)
        if values.last < 0
          hour_idx = ActionView::Helpers::DateTimeSelector::POSITION[:hour] - 1
          ampm = values.pop
          if ampm == ActionView::Helpers::DateTimeSelector::AM and values[hour_idx] == 12
            values[hour_idx] = 0
          elsif ampm == ActionView::Helpers::DateTimeSelector::PM and values[hour_idx] != 12
            values[hour_idx] += 12
          end
        end
        super
      end
    end
  end
end

if defined? ActiveRecord
  ActiveRecord::Base.class_eval do
    include TwelveHourTime::AR
  end
end
