class Calendar < Struct.new(:view, :date, :callback)
    HEADER = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
    START_DAY = :monday

    delegate :content_tag, to: :view

    def table
      content_tag :td do
        header + week_rows
      end
    end

    def header
      content_tag :th do
        HEADER.map { |day| content_tag :p, day}.join.html_safe
      end
    end

    def week_rows
      weeks.map do |week|
        content_tag :td do
          week.map { |day| day_cell(day) }.join.html_safe
        end
      end.join.html_safe
    end

    def day_cell(day)
        content_tag(:div, view.capture(day, &callback) + content_tag(:i, "add", class:"icon-small-text material-icons md-18 "), class: day_classes(day))
    end

    # def new_event
    #   content_tag :p do
    #     HEADER.map { |day| content_tag :p, day}.join.html_safe
    #   end
    # end

    def day_classes(day)
      classes = ["day"]
      classes << "day-name" if day == Date.today
      classes << "day--disabled" if day.month != date.month
      classes.empty? ? nil : classes.join(" ")
    end

    def weeks
      first = date.beginning_of_month.beginning_of_week(START_DAY)
      last = date.end_of_month.end_of_week(START_DAY)
      (first..last).to_a.in_groups_of(7)
    end
end
