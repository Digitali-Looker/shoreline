view: house_holds {
  sql_table_name: "TESTLAND"."CORE"."HouseHolds" ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: bbcregioncode {
    type: number
    sql: ${TABLE}."BBCREGIONCODE" ;;
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

  dimension: householdnumber {
    type: number
    sql: ${TABLE}."HOUSEHOLDNUMBER" ;;
  }

  dimension: panelmembershipstatus {
    type: number
    sql: ${TABLE}."PANELMEMBERSHIPSTATUS" ;;
  }

  dimension: presenceofchildren {
    type: number
    sql: ${TABLE}."PRESENCEOFCHILDREN" ;;
  }

  dimension: socialclass {
    type: string
    sql: ${TABLE}."SOCIALCLASS" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
