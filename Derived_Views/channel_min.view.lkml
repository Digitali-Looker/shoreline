view: channel_min {

  derived_table: {

    sql: SELECT DB2STATIONCODE, timerange FROM core.CHANNELMASTER a
          CROSS JOIN core.TIMERANGE tr
          WHERE tr.TIMERANGE BETWEEN '2019-01-01' AND '2019-02-01'
          ORDER BY DB2STATIONCODE, timerange ;;


  }


  dimension: db2stationcode {
    type: number
    sql: ${TABLE}."DB2STATIONCODE"  ;;
  }


#Any time-range selection (except actual tx start/end time) should be based off this dim group, potentially exclude "time" option for users or label it as a "minute" breakdown
  dimension_group: timerange {
    type: time
    timeframes: [
      raw,
      time,
      hour,
      date,
      day_of_week,
      week,
      week_of_year,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."TIMERANGE" ;;
  }

  dimension: pk {
    sql: concat(${db2stationcode},${timerange_raw}) ;;
    type: string
    primary_key:  yes

  }

  filter: time_range_selection {
    type: date
    sql: {% condition time_range_selection %} ${timerange_raw} {% endcondition %} ;;
    }


#ONLY REACH CALCULATION IS AFFECTED BY THIS ATM
  parameter: panel_level {
    label: "Panel Level"
    description: "Only applies to Reach calculation for the time-being"
    default_value: "Individuals"
    allowed_value: {
      label: "Individuals"
      value: "Individuals"
    }
    allowed_value: {
      label: "Households"
      value: "Households"
    }
  }

  parameter: reach_cont_minutes {
    type: number
    default_value: "3"

  }




}
