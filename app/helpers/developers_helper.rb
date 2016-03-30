module DevelopersHelper
  def developer_filters(new_filters)
    filters = params.dup
    filters = filters.extract!(:expertise, :tool, :programming_language)

    filters.merge(new_filters)
  end
end
