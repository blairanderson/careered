class Listing < ActiveRecord::Base
  as_enum :job_type, [:full_time, :part_time, :freelance, :temporary], column: :job_type_enum
  as_enum :how_to_apply, [:apply_by_email, :apply_by_url], column: :how_to_apply_enum
end
