module AutowiredRepository
  def get
    name.gsub('::Domain::', "::Infrastructure::#{wire_type}").constantize.new
  end

  def wire_type
    return 'Db' unless Rails.env.test?

    'Hash'
  end
end
