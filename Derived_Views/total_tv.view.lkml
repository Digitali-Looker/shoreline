# If necessary, uncomment the line below to include explore_source.

# include: "STC_New.model.lkml"

view: total_tv {

  derived_table: {

    explore_source: channel_min {

      column: excludefromtotal { field: channel_list.excludefromtotal }
      column: timerange_raw {}
      column: processingweight {field: sessionline.processingweight }

      derived_column: pk {
        sql: ROW_NUMBER() OVER (ORDER BY timerange_raw)  ;;
      }

      #bind_all_filters: yes
    }

  }
  dimension: excludefromtotal {

    type: number

  }

  dimension: pk {primary_key:yes}

#   dimension: timerange_raw {
#     #primary_key:  yes
#     type: date_time
#
#   }

  dimension_group: timerange {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: timerange_raw ;;
  }


  dimension: processingweight {

    type: number

  }

  measure: total_tv {
    type: sum
    sql: case when ${excludefromtotal} = 0 then ${processingweight} else 0 end;;
  }
}
