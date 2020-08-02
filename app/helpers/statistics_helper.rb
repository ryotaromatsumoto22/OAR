module StatisticsHelper
  def sprojects_by_name
    column_chart @projects.group(:name), height: '500px', library: {
      title: {text: 'project', x: -20},
      yAxis: {
         allowDecimals: false,
         title: {
             text: 'hour'
         }
      },
      xAxis: {
         title: {
             text: 'date'
         }
      }
    }
  end
end
