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

  dimension_group: timerange {
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
    sql: ${TABLE}."TIMERANGE" ;;
  }

  dimension: pk {
    sql: concat(${db2stationcode},${timerange_raw}) ;;
    type: string
    primary_key:  yes

  }



}
