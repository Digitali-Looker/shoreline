include: "/views/*/*.view"
include: "/Derived_Views/*.view"


view: reach_test_query_dependent{

#For testing pusposes to avoid using sample date weight, stick to daily breakdown atm and look only and midday shows that don't have a chance of having 2 different date of activity valued and hence 2 different processing weight values
#This test is for switching between generic programme title level and tx level
  derived_table: {

    explore_source: channel_min {
#content stuff
    column: db2_stationcode {field:sessionline.db2_stationcode}
    column: programmename {field:pet02.programmename}
    column: scheduleid {field:scheduleline.scheduleid}
    #date stuff
     column: timerange_raw {field:sessionline.timerange_raw}
       #Demo stuff
       column: householdnumber {field:sessionline.householdnumber}
       column: personnumber {field:sessionline.personnumber}
         #actual figures to sum across
         column: sample_date_weight  {field:sample_date_weights.sample_date_weight}
         column: hh_sample_date_weight {field:sample_date_weights.hh_sample_date_weight}

        #Primary key - not sure is needed here as it's not PDT
        derived_column: pk {
        sql: ROW_NUMBER() OVER (ORDER BY timerange_raw)  ;;
        }


              derived_column: rowno {
                sql: ROW_NUMBER () OVER (PARTITION BY householdnumber, personnumber,
                {% if channel_min.db2stationcode._in_query or channelmaster.db2_stationname._in_query %} db2_stationcode
                  {%else%} 1
                      {% endif %},
                {% if pet02.programmename._in_query %} programmename
                  {%else%} 1
                      {% endif %},
                {% if pet02.actualstarttime_time._in_query %} scheduleid
                  {%else%} 1
                      {% endif %},
                {% if channel_min.timerange_year._in_query %} year(timerange_raw)
                  {%else%} 1
                      {% endif %},
                {% if channel_min.timerange_quarter._in_query %} date_part(q,timerange_raw)
                  {%else%} 1
                      {% endif %},
                {% if channel_min.timerange_month._in_query %} month(timerange_raw)
                  {%else%} 1
                      {% endif %},
                {% if channel_min.timerange_week._in_query or channel_min.timerange_week_of_year._in_query %} weekiso(timerange_raw)
                  {%else%} 1
                      {% endif %},
                {% if channel_min.timerange_day_of_week._in_query %} dayofweekiso(timerange_raw)
                  {%else%} 1
                      {% endif %},
                {% if channel_min.timerange_date._in_query %} to_date(timerange_raw)
                  {%else%} 1
                      {% endif %},
                {% if channel_min.timerange_hour._in_query %} date_part(hour,timerange_raw)
                  {%else%} 1
                      {% endif %}


                ORDER BY householdnumber, personnumber,timerange_raw) ;;
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
  dimension: sample_date_weight {
    type: number
  }
  dimension: rowno {
    type: number
  }
  dimension: pk {primary_key:yes}



    measure: reach2 {
      description: "Please use channel_min timerange to show a reach breakdown (from year to an hour) and pet02 actual start time to break down by tx"
      type: sum
      sql: case when ${rowno} =  {% parameter channel_min.reach_cont_minutes %} then ${sample_date_weight} else 0 end,0
      ;;
    }

#{%if channel_min.reach_continuous_minutes%} {{channel_min.reach_continuous_minutes}} {%else%} "3" {% endif %}
#   sql: case when ${rowno} =  {%if reach_continuous_minutes._in_query %}
#   --{% condition reach_continuous_minutes %}
#   ${reach_cont_minutes}
#   --{% endcondition %}
#   {%else%} 3 {%endif%} then ${sample_date_weight} else 0 end,0  ;;

#   filter: time_range_selection {
#     type: date
#     sql: {% condition time_range_selection %} ${timerange_raw} {% endcondition %} ;;
#   }

#   dimension: sample_date_2 {
#     type: date
#     sql: DATEADD(DAY, floor((DATEDIFF(DAY,min(${timerange_raw}), max(${timerange_raw}))/2)),min(${timerange_raw})) ;;
#   }

    }
