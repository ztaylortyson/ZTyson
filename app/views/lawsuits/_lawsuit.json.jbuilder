json.extract! lawsuit, :id, :user_id, :active, :case_number, :case_title, :date_filed, :cmc, :judge_name, :judge_dept, :case_status, :last_roa, :plt_caption, :def_caption, :created_at, :updated_at
json.url lawsuit_url(lawsuit, format: :json)
