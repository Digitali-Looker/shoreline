view: channel_list {
  sql_table_name: CORE."ChannelList" ;;

  dimension: db1_stationcode {
    type: number
    sql: ${TABLE}."DB1STATIONCODE" ;;
  }

  dimension: db1_stationname {
    type: string
    sql: ${TABLE}."DB1STATIONNAME" ;;
  }

  dimension: db2_stationcode {
    type: number
    sql: ${TABLE}."DB2STATIONCODE" ;;
  }

  dimension: excludefromcommercial {
    type: number
    sql: ${TABLE}."EXCLUDEFROMCOMMERCIAL" ;;
  }

  dimension: excludefromtotal {
    type: number
    sql: ${TABLE}."EXCLUDEFROMTOTAL" ;;
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
    drill_fields: [db1_stationname]
  }
}
