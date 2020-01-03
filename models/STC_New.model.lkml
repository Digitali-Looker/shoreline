connection: "testland"

include: "/views/*/*.view"
include: "/Derived_Views/*.view"

datagroup: shoreline_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: shoreline_default_datagroup

explore: session_schedules {}

explore: sessionline {

  join: scheduleline {
    sql_on: ${sessionline.db2_stationcode} = ${scheduleline.stationcode} and ${scheduleline.timerange_raw} = ${sessionline.timerange_raw} ;;
    type: inner
    relationship: many_to_one
    }


  join: persons {
    sql_on: ${persons.personnumber} = ${sessionline.personnumber} ;;
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


}
