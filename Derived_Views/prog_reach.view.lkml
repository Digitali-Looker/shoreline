include: "/views/*/*.view"
include: "/Derived_Views/*.view"

view: prog_reach {



  derived_table: {

    explore_source: channel_min {
      column: sessionlineid { field: sessionline.sessionlineid }
      column: scheduleid { field: scheduleline.scheduleid }
      column: db2_stationcode {field: sessionline.db2_stationcode}
      column: householdnumber {field: sessionline.householdnumber}
      column: personnumber {field: sessionline.personnumber}
      column: timerange_raw {field: sessionline.timerange_raw}
      column: processingweight {field: sessionline.processingweight}
      derived_column: prog_row_no {
        sql:  ROW_NUMBER () OVER (PARTITION BY householdnumber, personnumber, scheduleid ORDER BY timerange_raw) ;;
      }

      bind_all_filters: yes



    }
  }
  dimension: scheduleid {
    value_format: "0"
    type: number
  }
  dimension: db2_stationcode {
    type: number
  }
  dimension: sessionlineid {
    type: number
  }

  dimension: processingweight {
    type: number
  }
  dimension: householdnumber {
    type: number
  }
  dimension: personnumber {
    type: number
  }
  dimension: prog_row_no {
    type: number

  }

  measure: reach {
    type: sum
    sql: case when ${prog_row_no} = 3 then ${processingweight} else 0 end  ;;
  }
}
