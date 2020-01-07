# If necessary, uncomment the line below to include explore_source.

# include: "STC_New.model.lkml"

view: total_tv {

  derived_table: {

    explore_source: sessionline {

      column: excludefromtotal { field: channel_list.excludefromtotal }
      column: timerange_raw {}
      column: processingweight {}

    }

  }
  dimension: excludefromtotal {

    type: number

  }
  dimension: timerange_raw {

    type: date_time

  }
  dimension: processingweight {

    type: number

  }

  measure: total_tv {
    type: sum
    sql: case when ${excludefromtotal} = 0 then ${processingweight} else 0 end;;
  }
}
