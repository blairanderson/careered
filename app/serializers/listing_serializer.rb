class ListingSerializer < ActiveModel::Serializer
  attributes :id, :job_title, :company, :job_locations, :job_type_enum, :description, :company_name, :company_url, :company_logo, :how_to_apply_enum, :contact_email
end
