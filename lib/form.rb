#require 'lotus/validations'

#class ValidationError < RuntimeError

	#attr_reader :entity,
							#:errors,
							#:form

	#def initialize( form, entity, errors )
		#@form   = form
		#@entity = entity
		#@errors = errors
	#end

#end

#class Form

	#include Lotus::Validations

	#def initialize( attributes={} )
		#@entity = entity_klass.new( attributes )

		#super( attributes )
	#end

	#def save
		#return false unless valid?
		#_save
		#true
	#end

	#def save!
		#unless valid?
			#raise ValidationError.new( self, self.entity, self.errors )
		#end

		#_save
		#entity
	#end

#protected

	#attr_reader :entity

	#def _save
		#repository_klass.create( entity )
	#end

	#def collection
		#raise NotImplementedError
	#end

	#def entity_klass
		#mapping.entity
	#end

	#def repository_klass
		#mapping.repository
	#end

	#def mapping
		#Lotus::Model.configuration.mapper.collections[collection]
	#end

#end
