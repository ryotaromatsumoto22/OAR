module ApplicationHelper

	def title_for_graph
	    column_chart date, library: {
	      title: {text: '', x: -20},
	      yAxis: {
	         allowDecimals: false,
	         title: {
	             text: '時間'
	         }
	      }
	    }
  	end
end
