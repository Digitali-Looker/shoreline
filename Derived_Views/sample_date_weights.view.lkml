include: "/Derived_Views/*.view"

view: sample_date_weights {

  derived_table: {
    sql:

    with middledate as(
    select min(date) as min
      ,max(date) as max
     ,DATEADD(DAY, floor((DATEDIFF(DAY,min(date), max(date))/2)),min(date))  as MiddleDate


      from "TESTLAND"."CORE"."CALENDAR" CAL


      WHERE    {% condition channel_min.time_range_selection %}                date                                         {% endcondition %}
      )


    SELECT middledate.middledate sample_date, w."HOUSEHOLDNUMBER" householdnumber, w."PERSONNUMBER" personnumber, w."PROCESSINGWEIGHT" sample_weight,
    avg(w.processingweight) over (partition by middledate.middledate, w."HOUSEHOLDNUMBER" order by w."HOUSEHOLDNUMBER") HH_sample_weight
    FROM "TESTLAND"."CORE"."Weights_50" AS w


    Inner Join middledate
    On w."DATEOFACTIVITY"=middledate.middledate
    WHERE w."REPORTINGPANELCODE"=50

    GROUP BY middledate.middledate,w."HOUSEHOLDNUMBER", w."PERSONNUMBER", w."PROCESSINGWEIGHT"
    ;;}


      dimension: household_number {
        type: number
        sql: ${TABLE}.householdnumber ;;
        #hidden: yes
      }

      dimension: person_number {
        type: number
        sql: ${TABLE}.personnumber ;;
        #hidden: yes
      }

      dimension: sample_date_weight {
        type: number
        sql: ${TABLE}.sample_weight ;;
      }

      dimension: hh_sample_date_weight {
        type: number
        sql: ${TABLE}.HH_sample_weight ;;
      }

      dimension: sample_date {
        type: date
        sql: ${TABLE}.sample_date ;;
      }


}
