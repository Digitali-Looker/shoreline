view: calendar {
  sql_table_name: CORE.CALENDAR ;;

  dimension_group: date {
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
    sql: ${TABLE}."DATE" ;;
  }

  dimension: day {
    type: number
    sql: ${TABLE}."DAY" ;;
  }

  dimension: dayofweek {
    type: number
    sql: ${TABLE}."DAYOFWEEK" ;;
  }

  dimension_group: firstofmonth {
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
    sql: ${TABLE}."FIRSTOFMONTH" ;;
  }

  dimension_group: firstofyear {
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
    sql: ${TABLE}."FIRSTOFYEAR" ;;
  }

  dimension: footballseason {
    type: string
    sql: ${TABLE}."FOOTBALLSEASON" ;;
  }

  dimension: isodateformat {
    type: string
    sql: ${TABLE}."ISODATEFORMAT" ;;
  }

  dimension: isoweek {
    type: number
    sql: ${TABLE}."ISOWEEK" ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}."MONTH" ;;
  }

  dimension: monthname {
    type: string
    sql: ${TABLE}."MONTHNAME" ;;
  }

  dimension: quarter {
    type: number
    sql: ${TABLE}."QUARTER" ;;
  }

  dimension: ukdateformat {
    type: string
    sql: ${TABLE}."UKDATEFORMAT" ;;
  }

  dimension: week {
    type: number
    sql: ${TABLE}."WEEK" ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}."YEAR" ;;
  }

  measure: count {
    type: count
    drill_fields: [monthname]
  }
}
