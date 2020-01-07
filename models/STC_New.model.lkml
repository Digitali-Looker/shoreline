connection: "testland"

include: "/views/*/*.view"
include: "/Derived_Views/*.view"

datagroup: shoreline_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: shoreline_default_datagroup

#explore: persons {}

#explore: session_schedules {}

#explore: prog_reach {}

explore: sessionline {

  join: scheduleline {
    sql_on: ${sessionline.db2_stationcode} = ${scheduleline.stationcode} and ${scheduleline.timerange_raw} = ${sessionline.timerange_raw} ;;
    type: inner
    relationship: many_to_one
    }

    join: prog_reach {
      sql_on: ${sessionline.sessionlineid} = ${prog_reach.sessionlineid} ;;
      type: inner
      relationship: one_to_one
    }

    join: total_tv {
      sql_on: ${scheduleline.timerange_raw} = ${total_tv.timerange_raw} ;;
      relationship: many_to_one
      type: inner
    }


  join: persons {
    sql_on: ${persons.personnumber} = ${sessionline.personnumber} and ${persons.householdnumber} = ${sessionline.householdnumber} ;;
    type: inner
    relationship: many_to_one
  }

  join: house_holds {
    sql_on: ${house_holds.householdnumber} = ${sessionline.householdnumber} ;;
    type: inner
    relationship: many_to_one
  }

  join: pet02 {
    sql_on: ${pet02.scheduleid} = ${scheduleline.scheduleid} ;;
    type: inner
    relationship: many_to_one
  }

  join: channel_list {
    sql_on: ${channel_list.db1_stationcode}   = ${sessionline.dbstationcode} ;;
    type: inner
    relationship: many_to_one
  }

  join: channelmaster {
    sql_on: ${sessionline.db2_stationcode} = ${channelmaster.db2_stationcode} ;;
    type: inner
    relationship: many_to_one
  }

  join: session_list {
    sql_on: ${session_list.sessionid} = ${sessionline.sessionid} ;;
    type: inner
    relationship: many_to_one
  }


}
