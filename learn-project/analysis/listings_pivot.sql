with listings as (
      select * from {{ref('stg_airbnb_listings')}}


),

pivoted as (select

            neighbourhood,

            {%- for property_type in ['Apartment', 'House'] -%}
            sum(case when property_type = '{{property_type}}' then 1 else 0 end) as {{property_type}}_count

                {% if not loop.last %} , {% endif %}

            {%- endfor -%}
            from listings
            group by 1)


select * from pivoted
