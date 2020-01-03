view: proline {
  sql_table_name: STC.PROLINE ;;
  drill_fields: [prolineid]

  dimension: prolineid {
    primary_key: yes
    type: number
    sql: ${TABLE}."PROLINEID" ;;
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

  dimension: scheduleid {

    type: number
    value_format_name: id
    sql: ${TABLE}."SCHEDULEID" ;;
  }

  dimension: timelineid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."TIMELINEID" ;;
  }

  measure: count {
    type: count
    drill_fields: [prolineid, timeline.timelineid]
  }


}
