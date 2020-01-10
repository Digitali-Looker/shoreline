include: "/views/*/*.view"
include: "/Derived_Views/*.view"


view: reach_test_query_dependent{

#For testing pusposes to avoid using sample date weight, stick to daily breakdown atm and look only and midday shows that don't have a chance of having 2 different date of activity valued and hence 2 different processing weight values
#This test is for switching between generic programme title level and tx level
  derived_table: {

    explore_source: channel_min {

    column: db2_stationcode {field:sessionline.db2_stationcode}
    column: programmename {field:pet02.programmename}
    column: scheduleid {field:scheduleline.scheduleid}
     column: timerange_raw {field:sessionline.timerange_raw}
     column: householdnumber {field:sessionline.householdnumber}
     column: personnumber {field:sessionline.personnumber}
     column: processingweight  {field:sessionline.processingweight}
      derived_column: pk {
        sql: ROW_NUMBER() OVER (ORDER BY timerange_raw)  ;;
      }
    derived_column: rowno {
      sql: ROW_NUMBER () OVER (PARTITION BY householdnumber, personnumber,


        {% if pet02.actualstarttime_time._in_query %} scheduleid
        {%else%} 1
            {% endif %}

      ORDER BY timerange_raw) ;;
    }
    bind_all_filters: yes
      }

    }

#     {% elsif select_date_window._parameter_value == "'month'" %} analytics.daily_usage_summary_month
#             {% elsif select_date_window._parameter_value == "'year'" %} analytics.daily_usage_summary_year
#             {% elsif select_date_window._parameter_value == "'school_year'" %} analytics.daily_usage_summary_school_year
#             {% else %} analytics.daily_usage_summary_school_year

  dimension: db2_stationcode {
    type: number
  }
  dimension: programmename {
    type: string
  }
  dimension:scheduleid  {
    type: number
  }
  dimension: timerange_raw {
    type: date_time
  }
  dimension: householdnumber {
    type: number
  }
  dimension: personnumber {
    type: number
  }
  dimension: processingweight {
    type: number
  }
  dimension: rowno {
    type: number
  }
  dimension: pk {primary_key:yes}

    measure: reach1 {
      type: sum
      sql: ${processingweight} ;;
    }


    measure: reach2 {
      type: sum
      sql: case when ${rowno} = 1 then ${processingweight} else 0 end  ;;
    }

#   filter: time_range_selection {
#     type: date
#     sql: {% condition time_range_selection %} ${timerange_raw} {% endcondition %} ;;
#   }

#   dimension: sample_date_2 {
#     type: date
#     sql: DATEADD(DAY, floor((DATEDIFF(DAY,min(${timerange_raw}), max(${timerange_raw}))/2)),min(${timerange_raw})) ;;
#   }

    }
