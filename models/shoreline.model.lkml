connection: "testland"

include: "/views/*/*.view"

datagroup: shoreline_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: shoreline_default_datagroup




explore: timeline {

  join: viewerline {
    type: inner
    sql_on: ${viewerline.timelineid} = ${timeline.timelineid} ;;
    relationship: one_to_many
  }

  join: proline {
    type: inner
    sql_on: ${proline.timelineid} = ${timeline.timelineid} ;;
    relationship: one_to_many
  }

  join: weights_50 {
    type: inner
    sql_on: ${viewerline.personnumber} = ${weights_50.personnumber} and ${viewerline.householdnumber} = ${weights_50.householdnumber} and ${viewerline.dateofactivity_raw} = ${weights_50.dateofactivity_raw} ;;
    relationship: many_to_one
  }

  join: persons {
    sql_on: ${persons.personnumber} = ${viewerline.personnumber} ;;
    relationship: many_to_one
  }

  join: house_holds {
    sql_on: ${house_holds.householdnumber} = ${viewerline.householdnumber} ;;
    relationship: many_to_one
  }

  join: pet02 {
    sql_on: ${pet02.scheduleid} = ${proline.scheduleid} ;;
    relationship: many_to_one
  }

  join: channel_list {
    sql_on: ${channel_list.db1_stationcode}   = ${timeline.db1_stationcode} ;;
    relationship: many_to_one
  }

  join: channelmaster {
    sql_on: ${timeline.db2_stationcode} = ${channelmaster.db2_stationcode} ;;
    relationship: many_to_one
  }
}
