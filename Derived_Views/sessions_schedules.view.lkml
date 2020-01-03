# If necessary, uncomment the line below to include explore_source.

# include: "STC_New.model.lkml"

view: session_schedules {
  derived_table: {
    explore_source: sessionline {
      column: db2_stationname { field: channelmaster.db2_stationname }
      column: consolidatedstarttime_time { field: pet02.consolidatedstarttime_time }
      column: householdnumber {}
      column: personnumber {}
      column: processingweight {}
      column: pvfid {}
      column: db2_stationcode {}
      column: dbstationcode {}
      column: timerange_time { field: scheduleline.timerange_raw }
      column: scheduleid { field: scheduleline.scheduleid }
      derived_column: prog_row_no {
        sql:  ROW_NUMBER () OVER (PARTITION BY householdnumber, personnumber, scheduleid ORDER BY timerange_time) ;;
      }
    }
  }
  dimension: db2_stationname {}
  dimension: consolidatedstarttime_time {
    type: date_time
  }
  dimension: householdnumber {
    type: number
  }
  dimension: personnumber {
    type: number
  }
  dimension: processingweight {
    type: number
  }
  dimension: pvfid {
    value_format: "0"
    type: number
  }

  dimension: prog_row_no {
    type: number
  }

  dimension: db2_stationcode {
    type: number
  }
  dimension: dbstationcode {
    type: number
  }
  dimension: timerange_time {
    type: date_time
  }
  dimension: scheduleid {
    value_format: "0"
    type: number
  }


  measure: reach {
    type: sum
    sql: case when ${prog_row_no} = 3 then ${processingweight} else 0 end  ;;
  }


  measure: avg000s {
    type: number
    sql: sum(${processingweight}) / count(distinct ${timerange_time});;
  }

}
