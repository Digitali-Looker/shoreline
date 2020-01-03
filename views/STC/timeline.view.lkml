view: timeline {
  sql_table_name: STC.TIMELINE ;;
  drill_fields: [timelineid]

  dimension: timelineid {
    primary_key: yes
    type: number
    sql: ${TABLE}."TIMELINEID" ;;
  }

  dimension: db1_stationcode {
    type: number
    sql: ${TABLE}."DB1STATIONCODE" ;;
  }

  dimension: db2_stationcode {
    type: number
    sql: ${TABLE}."DB2STATIONCODE" ;;
  }

  dimension: excludefromtotal {
    type: number
    sql: ${TABLE}."EXCLUDEFROMTOTAL" ;;
  }

  dimension: offair {
    type: number
    sql: ${TABLE}."OFFAIR" ;;
  }

  dimension: thirtyhourtime {
    type: string
    sql: ${TABLE}."THIRTYHOURTIME" ;;
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
    drill_fields: [timelineid, proline.count, viewerline.count]
  }





}
