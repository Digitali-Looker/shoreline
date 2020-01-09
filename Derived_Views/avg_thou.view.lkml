# If necessary, uncomment the line below to include explore_source.

# include: "STC_New.model.lkml"

view: avg_thou {
  derived_table: {
    explore_source: channel_min {
      column: db2_stationcode  { field: sessionline.db2_stationcode }
      column: processingweight { field: sessionline.processingweight }
      column: timerange_raw { field: sessionline.timerange_raw }
      bind_all_filters: yes
    }
  }
  dimension: processingweight {
    type: number
  }
  dimension: timerange_raw {
    type: date_time
  }

  dimension: db2_stationcode {
    type: number
  }

  dimension: pk {
    sql: concat(${timerange_raw},${db2_stationcode}) ;;
    type: string
    primary_key: yes
  }

  measure: totalviewmins {
    type: sum
    sql: ${processingweight} ;;
  }

  measure: cntmins {
    type: count_distinct
    sql: ${timerange_raw} ;;
  }



  measure: avg000s {
    type: number
    sql: sum(${processingweight}) / count(distinct ${timerange_raw});;
  }

}
