{{ config(materialized='view') }}

select
      id,
      count(distinct id) as count_of_reviews,
      reviewer_name,
      date,
      review,
      comments,
      listing_id
from  {{ source('airbnb','reviews') }}
group by 1,3,4,5,6,7
