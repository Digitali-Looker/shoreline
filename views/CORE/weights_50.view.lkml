view: weights_50 {
  sql_table_name: CORE."Weights_50" ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
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

  dimension: processingweight {
    type: number
    sql: ${TABLE}."PROCESSINGWEIGHT" ;;
  }

  dimension: pvf05_id {
    type: number
    sql: ${TABLE}."PVF05ID" ;;
  }

  dimension: reportingpanelcode {
    type: number
    sql: ${TABLE}."REPORTINGPANELCODE" ;;
  }

  dimension: userkey {
    type: string
    sql: ${TABLE}."USERKEY" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: avg000s {
    type: sum
    sql: ${processingweight};;
  }


}
