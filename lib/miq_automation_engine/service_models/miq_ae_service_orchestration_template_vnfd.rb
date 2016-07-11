module MiqAeMethodService
  class MiqAeServiceOrchestrationTemplateVnfd < MiqAeServiceOrchestrationTemplate
    CREATE_ATTRIBUTES = [:name, :description, :content, :draft, :orderable, :ems_id].freeze

    def self.create(options = {})
      attributes = options.symbolize_keys.slice(*CREATE_ATTRIBUTES)
      attributes[:remote_proxy] = true

      ar_method { MiqAeServiceOrchestrationTemplateVnfd.wrap_results(OrchestrationTemplateVnfd.create!(attributes)) }
    end

    def self.destroy(id)
      vnfd = OrchestrationTemplateVnfd.find(id)
      vnfd.remote_proxy = true
      vnfd.destroy
    end
  end
end
