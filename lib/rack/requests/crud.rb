module CRUDRequest
  def new_for klass
    fields = klass.new.editable_fields
    attributes = Hash[ *fields.map{| f | [ f.to_sym, '' ]}.flatten ]
    
    submit_method = "postObject('#{ klass.to_s.downcase }')"
    data = { instance:attributes            , 
             submit_method:submit_method    ,
             header:"Create New #{ klass }" }

    Response.ok_for render( klass.to_s.downcase, :form, data )
  end

  def create_for klass
    object = klass.create( @params )

    return Response.ok if object.valid?
  
    Response.unprocessable_entity_for object.errors.full_messages
  end

  def get_for klass
    instances = klass.all
                     .map( &:attributes )
                     .sort_by{| instance | instance[ :display_name ]}

    fields = klass.new.editable_fields
    count  = instances.count
    data   = { fields:fields, instances:instances, count:count }
    Response.ok_for render( klass.to_s.downcase, :all, data )
  end

  def show_for klass
    attributes = klass.find( @url_params[ :id ]).attributes

    data = { id:attributes[ '_id' ], instance:attributes }

    Response.ok_for render( klass.to_s.downcase, :show, data )
  end

  def edit_for klass
    id = @url_params[ :id ]
    attributes = klass.find( id ).attributes
    
    submit_method = "putObject('#{ klass.to_s.downcase }', '#{ id }')"
    data = { id:id, 
             instance:attributes, 
             submit_method:submit_method,
             header:"Edit #{ klass }" }

    Response.ok_for render( klass.to_s.downcase, :form, data )
  end

  def put_for klass
    instance = klass.find( @url_params[ :id ])
    
    if instance.update_attributes( @params )
      return Response.ok
    end

    Response.unprocessable_entity_for instance.errors.full_messages
  end

  def delete_for klass
    object = klass.find( @url_params[ :id ])
    
    if object.nil?  
      Log.info "#{ __method__ } #{ klass } could not delete id #{ @url_params[ :id ]}"
    else
      object.delete
    end

    Response.ok
  end
end