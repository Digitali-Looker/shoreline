view: persons {
  sql_table_name: "TESTLAND"."CORE"."Persons" ;;
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

  dimension: age {
    type:  number
    sql: FLOOR(DATEDIFF('day', ${birthdate_raw}, ${session_list.dateofactivity_raw}) / 365.25)  ;;
  }

  dimension: age_group {
    type: tier
    tiers: [4,16,25,35,45,55,65]
    style: integer
    sql: ${age} ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
