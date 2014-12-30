require 'lotus/form/version'
require 'lotus/validations'
require 'lotus/validation_error'

module Lotus
  module Form

    def self.included( base )
      base.send :include, Lotus::Validations
      base.send :include, Lotus::Form::InstanceMethods

      base.class_eval do
        attr_reader :entity
      end
    end

    module InstanceMethods

      def initialize( attributes={} )
        @entity = entity_klass.new( attributes )

        super( attributes )
      end

      def save
        return false unless valid?
        _save
        true
      end

      def save!
        unless valid?
          raise ValidationError.new( self, self.entity, self.errors )
        end

        _save
        entity
      end

    protected

      def _save
        repository_klass.create( entity )
      end

      def collection
        raise NotImplementedError
      end

      def entity_klass
        mapping.entity
      end

      def repository_klass
        mapping.repository
      end

      def mapping
        Lotus::Model.configuration.mapper.collections[collection]
      end

    end
  end
end
