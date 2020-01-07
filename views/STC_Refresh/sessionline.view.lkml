view: sessionline {
  sql_table_name: STC.SESSIONLINE ;;



  dimension: sessionlineid {
    type: number
    primary_key: yes
    sql: ${TABLE}.SessionLineID  ;;
  }

  dimension: db2_stationcode {
    type: number
    sql: ${TABLE}."DB2STATIONCODE" ;;
  }

  dimension: dbstationcode {
    type: number
    sql: ${TABLE}."DBSTATIONCODE" ;;
  }

  dimension: householdnumber {
    type: number
    sql: ${TABLE}."HOUSEHOLDNUMBER" ;;
  }

  dimension: personnumber {
    type: number
    sql: ${TABLE}."PERSONNUMBER" ;;
  }

  dimension: processingweight {
    type: number
    sql: ${TABLE}."PROCESSINGWEIGHT" ;;
  }

  dimension: sessionid {
    type: number
    value_format_name: id
    sql: ${TABLE}."SESSIONID" ;;
  }

  dimension: sessionrowno {
    type: number
    sql: ${TABLE}."SESSIONROWNO" ;;
  }

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
    sql: ${TABLE}."TIMERANGE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

 measure: reach2 {
   type: sum
    sql: case when ${prog_reach.prog_row_no} = 3 then ${processingweight} else 0 end ;;
 }


dimension: is_guest {
  type: number
  sql: case when ${personnumber} = 131072 then 1 else 0 end ;;
}


  measure: avg000s {
    type: number
    sql: sum(${processingweight}) / count(distinct ${timerange_raw});;
  }
}
