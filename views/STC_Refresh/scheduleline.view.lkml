view: scheduleline {
  sql_table_name: STC.SCHEDULELINE ;;

  dimension_group: dateoftransmission {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATEOFTRANSMISSION" ;;
  }

  dimension: schedulelineid {
    type: number
    primary_key: yes
    sql: ${TABLE}.ScheduleLineID  ;;
  }

  dimension: scheduleid {
    type: number
    value_format_name: id
    sql: ${TABLE}."SCHEDULEID" ;;
  }

  dimension: stationcode {
    type: number
    sql: ${TABLE}."STATIONCODE" ;;
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
}
