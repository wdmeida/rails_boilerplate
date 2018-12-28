Mongoid::Persistable::Updatable.module_eval do
  def update(attributes = {})
    assign_attributes(attributes)
    touch unless changed?
    save
  end

  alias :update_attributes :update
end
