require 'lotus/form/version'
require 'lotus/validations'

module Lotus
  class ValidationError

    attr_reader :entity,
                :errors,
                :form

    def initialize( form, entity, errors )
      @form   = form
      @entity = entity
      @errors = errors
    end

  end
end
