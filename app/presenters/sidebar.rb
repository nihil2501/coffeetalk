class Sidebar
  attr_accessor :current_user

  attr_reader(
    :creating_group,
    :editing_organization,
    :creating_organization
  )

  def initialize(current_user)
    self.current_user = current_user
  end

  def current_organization?(organization)
    current_organization == organization
  end

  def current_group?(group)
    current_group == group
  end

  def showing_group=(group)
    self.current_group        = group
    self.current_organization = group.organization
  end

  def editing_group=(group)
    self.current_group        = group
    self.current_organization = group.organization
  end

  def creating_group=(group)
    @creating_group           = group
    self.current_group        = @creating_group
    self.current_organization = current_group.organization
  end

  def editing_organization=(organization)
    @editing_organization      = organization
    self.current_organization  = @editing_organization
  end

  def creating_organization=(organization)
    @creating_organization      = organization
    self.current_organization   = @creating_organization
  end

  def reading_list?
    current_organization.nil?
  end

  def editing_organization?(organization)
    organization == editing_organization
  end

  def creating_organization?
    !creating_organization.nil?
  end

  def creating_group?(organization)
    !creating_group.nil? && current_organization?(organization)
  end

  private
  attr_accessor :current_organization, :current_group
end