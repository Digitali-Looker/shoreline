view: session_list {
  sql_table_name: CORE.SessionList ;;

  dimension_group: broadcastendtime {
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
    sql: ${TABLE}."BROADCASTENDTIME" ;;
  }

  dimension_group: broadcaststarttime {
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
    sql: ${TABLE}."BROADCASTSTARTTIME" ;;
  }

  dimension: contentassetitemoffset {
    type: number
    sql: ${TABLE}."CONTENTASSETITEMOFFSET" ;;
  }

  dimension: contentid {
    type: number
    value_format_name: id
    sql: ${TABLE}."CONTENTID" ;;
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

  dimension: dbstationcode {
    type: number
    sql: ${TABLE}."DBSTATIONCODE" ;;
  }

  dimension: deviceinuse {
    type: number
    sql: ${TABLE}."DEVICEINUSE" ;;
  }

  dimension_group: endrecordingtime {
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
    sql: ${TABLE}."ENDRECORDINGTIME" ;;
  }

  dimension_group: endsessiontime {
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
    sql: ${TABLE}."ENDSESSIONTIME" ;;
  }

  dimension: guestcount {
    type: number
    sql: ${TABLE}."GUESTCOUNT" ;;
  }

  dimension: guestgroup {
    type: number
    sql: ${TABLE}."GUESTGROUP" ;;
  }

  dimension: householdnumber {
    type: number
    sql: ${TABLE}."HOUSEHOLDNUMBER" ;;
  }

  dimension: interactivebrcode {
    type: number
    sql: ${TABLE}."INTERACTIVEBRCODE" ;;
  }

  dimension: isguest {
    type: number
    sql: ${TABLE}."ISGUEST" ;;
  }

  dimension: personnumber {
    type: number
    sql: ${TABLE}."PERSONNUMBER" ;;
  }

  dimension: playbacktype {
    type: number
    sql: ${TABLE}."PLAYBACKTYPE" ;;
  }

  dimension: pvfid {
    type: number
    value_format_name: id
    sql: ${TABLE}."PVFID" ;;
  }

  dimension: sessionactivitytype {
    type: number
    sql: ${TABLE}."SESSIONACTIVITYTYPE" ;;
  }

  dimension: sessionduration {
    type: number
    sql: ${TABLE}."SESSIONDURATION" ;;
  }

  dimension: sessionid {
    primary_key: yes
    type: number
    value_format_name: id
    sql: ${TABLE}."SESSIONID" ;;
  }

  dimension: setnumber {
    type: number
    sql: ${TABLE}."SETNUMBER" ;;
  }

  dimension: startingsessiontime {
    type: string
    sql: ${TABLE}."STARTINGSESSIONTIME" ;;
  }

  dimension_group: startrecordingtime {
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
    sql: ${TABLE}."STARTRECORDINGTIME" ;;
  }

  dimension_group: startsessiontime {
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
    sql: ${TABLE}."STARTSESSIONTIME" ;;
  }

  dimension: targetedpromotion {
    type: number
    sql: ${TABLE}."TARGETEDPROMOTION" ;;
  }

  dimension: type {
    type: number
    sql: ${TABLE}."TYPE" ;;
  }

  dimension: userkey {
    type: string
    sql: ${TABLE}."USERKEY" ;;
  }

  dimension: viewingplatform {
    type: number
    sql: ${TABLE}."VIEWINGPLATFORM" ;;
  }

  dimension: vodid {
    type: number
    value_format_name: id
    sql: ${TABLE}."VODID" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
