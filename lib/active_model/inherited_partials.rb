require "active_model/inherited_partials/version"
require "active_model/inherited_partials/engine"

module ActiveModel
	module InheritedPartials
		extend ActiveSupport::Concern

		class_methods do
			def _to_partial_path
				@_to_partial_path ||=
						find_or_inherit namespaced_partial_path || super
			end

			protected

			def partial_dir  = Pathname(_to_partial_path).dirname
			def partial_name = Pathname(_to_partial_path).basename.to_s

			private

			def namespaced_partial_path
				namespace_model
						&.then { _1.partial_dir / model_name.element / _1.partial_name }
						&.to_s
			end

			def namespace_model
				namespace_classes
						.reverse.find { _1.respond_to? :model_name }
			end

			def namespace_classes
				name
						.deconstantize
						.split('::')
						.each.with_object([]) { |name, namespaces| namespaces << "#{namespaces.last}::#{name}" }
						.map(&:constantize)
						.select { _1.in? ancestors }
			end

			def find_or_inherit path
				return path if partial_exists? path
				return path if base_class?

				superclass._to_partial_path
			end

			def partial_exists? path
				ApplicationController.new.lookup_context
						.exists? path, [], true
			end
		end
	end

	Conversion::ClassMethods.prepend InheritedPartials::ClassMethods
end
