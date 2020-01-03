view: persons {
  sql_table_name: CORE.Persons ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension_group: birthdate {
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
    sql: ${TABLE}."BIRTHDATE" ;;
  }

  dimension_group: datevalidfor {
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
    sql: ${TABLE}."DATEVALIDFOR" ;;
  }

  dimension: ethnicorigin {
    type: number
    sql: ${TABLE}."ETHNICORIGIN" ;;
  }

  dimension: householdnumber {
    type: number
    sql: ${TABLE}."HOUSEHOLDNUMBER" ;;
  }

  dimension: householdstatus {
    type: number
    sql: ${TABLE}."HOUSEHOLDSTATUS" ;;
  }

  dimension: personnumber {
    type: number
    sql: ${TABLE}."PERSONNUMBER" ;;
  }

  dimension: sexcode {
    type: number
    sql: ${TABLE}."SEXCODE" ;;
  }

  dimension: userkey {
    type: string
    sql: ${TABLE}."USERKEY" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
