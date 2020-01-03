view: viewerline {
  sql_table_name: STC.VIEWERLINE ;;
  drill_fields: [viewerlineid]

  dimension: viewerlineid {
    primary_key: yes
    type: number
    sql: ${TABLE}."VIEWERLINEID" ;;
  }

  dimension_group: dateofactivity {
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
    sql: ${TABLE}."DATEOFACTIVITY" ;;
  }

  dimension: householdnumber {
    type: number
    sql: ${TABLE}."HOUSEHOLDNUMBER" ;;
  }

  dimension: personnumber {
    type: number
    sql: ${TABLE}."PERSONNUMBER" ;;
  }

  dimension: sessionid {
    type: number
    value_format_name: id
    sql: ${TABLE}."SESSIONID" ;;
  }

  dimension: timelineid {
    type: number
    value_format_name: id
    # hidden: yes
    sql: ${TABLE}."TIMELINEID" ;;
  }

  measure: count {
    type: count
    drill_fields: [viewerlineid, timeline.timelineid]
  }

  measure: avg000s {
    type: number
    sql: sum(${weights_50.processingweight}) / count(distinct ${timeline.timerange_raw});;
  }

  measure: TotalTV {
    type: number
    sql: sum(${weights_50.processingweight}) / count(distinct ${timeline.timerange_raw}) Over (partition by ${timeline.timerange_raw} order by (select null)) ;;
  }

}
