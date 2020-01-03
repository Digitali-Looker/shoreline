view: pet02 {
  sql_table_name: SCHEDULE.PET02 ;;

  dimension_group: actualendtime {
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
    sql: ${TABLE}."ACTUALENDTIME" ;;
  }

  dimension_group: actualstarttime {
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
    sql: ${TABLE}."ACTUALSTARTTIME" ;;
  }

  dimension: areaflag {
    type: string
    sql: ${TABLE}."AREAFLAG" ;;
  }

  dimension: broadcastcontentid {
    type: string
    sql: ${TABLE}."BROADCASTCONTENTID" ;;
  }

  dimension_group: consolidatedendtime {
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
    sql: ${TABLE}."CONSOLIDATEDENDTIME" ;;
  }

  dimension_group: consolidatedstarttime {
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
    sql: ${TABLE}."CONSOLIDATEDSTARTTIME" ;;
  }

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

  dimension: eventduration {
    type: number
    sql: ${TABLE}."EVENTDURATION" ;;
  }

  dimension: logstationcode {
    type: number
    sql: ${TABLE}."LOGSTATIONCODE" ;;
  }

  dimension: metabroadcastid {
    type: string
    sql: ${TABLE}."METABROADCASTID" ;;
  }

  dimension: programmename {
    type: string
    sql: ${TABLE}."PROGRAMMENAME" ;;
  }

  dimension: programmetype {
    type: string
    sql: ${TABLE}."PROGRAMMETYPE" ;;
  }

  dimension: reportingpanelcode {
    type: number
    sql: ${TABLE}."REPORTINGPANELCODE" ;;
  }

  dimension: schedule {
    type: string
    sql: ${TABLE}."SCHEDULE" ;;
  }

  dimension: scheduleid {
    type: number
    value_format_name: id
    sql: ${TABLE}."SCHEDULEID" ;;
  }

  dimension: scheduletype {
    type: string
    sql: ${TABLE}."SCHEDULETYPE" ;;
  }

  dimension: stationcode {
    type: number
    sql: ${TABLE}."STATIONCODE" ;;
  }

  measure: count {
    type: count
    drill_fields: [programmename]
  }
}
