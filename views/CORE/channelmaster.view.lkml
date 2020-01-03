view: channelmaster {
  sql_table_name: CORE.CHANNELMASTER ;;

  dimension: db2_parentcode {
    type: number
    sql: ${TABLE}."DB2PARENTCODE" ;;
  }

  dimension: db2_stationcode {
    type: number
    sql: ${TABLE}."DB2STATIONCODE" ;;
  }

  dimension: db2_stationname {
    type: string
    sql: ${TABLE}."DB2STATIONNAME" ;;
  }

  dimension: delay {
    type: number
    sql: ${TABLE}."DELAY" ;;
  }

  dimension_group: reportingstartdate {
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
    sql: ${TABLE}."REPORTINGSTARTDATE" ;;
  }

  measure: count {
    type: count
    drill_fields: [db2_stationname]
  }
}
