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

explore: channel_min {



  join: sessionline {
    sql_on: ${channel_min.db2stationcode} = ${sessionline.db2_stationcode} and ${sessionline.timerange_raw} = ${channel_min.timerange_raw} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: avg_thou {
    sql_on: ${channel_min.timerange_raw} = ${avg_thou.timerange_raw} and ${channel_min.db2stationcode} = ${avg_thou.db2_stationcode} ;;
    relationship: one_to_one

  }


  join: scheduleline {
    sql_on: ${channel_min.db2stationcode} = ${scheduleline.stationcode} and ${scheduleline.timerange_raw} = ${channel_min.timerange_raw} ;;
    type: left_outer
    relationship: many_to_one
    }

    join: prog_reach {
      sql_on: ${sessionline.sessionlineid} = ${prog_reach.sessionlineid} ;;
      type: inner
      relationship: one_to_one
    }

    join: total_tv {
      sql_on: ${channel_min.timerange_raw} = ${total_tv.timerange_raw} ;;
      relationship: many_to_one
      type: inner
    }

    join: reach_test_query_dependent {
      sql_on:
      ${channel_min.db2stationcode}=${reach_test_query_dependent.db2_stationcode} and
      ${channel_min.timerange_raw}=${reach_test_query_dependent.timerange_raw}
      --${house_holds.householdnumber}=${reach_test_query_dependent.householdnumber} and
      --${persons.personnumber}=${reach_test_query_dependent.personnumber}
      ;;
      type: left_outer
      relationship: many_to_one
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
    sql_on: ${channel_list.db2_stationcode}   = ${channel_min.db2stationcode} ;;
    type: inner
    relationship: many_to_one
  }

  join: channelmaster {
    sql_on: ${channel_min.db2stationcode} = ${channelmaster.db2_stationcode} ;;
    type: inner
    relationship: many_to_one
  }

  join: session_list {
    sql_on: ${session_list.sessionid} = ${sessionline.sessionid} ;;
    type: inner
    #this might need to be left
    relationship: many_to_one
  }

  join: sample_date_weights {
   sql_on: ${sample_date_weights.household_number}=${sessionline.householdnumber} and ${sample_date_weights.person_number}=${sessionline.personnumber} ;;
      type: left_outer
    relationship: many_to_one
    sql_where: ${sample_date_weights.sample_date_weight} is not null  ;;
  }



}
