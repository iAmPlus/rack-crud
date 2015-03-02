module CRUDModel
  def editable_fields
    editable = fields.map( &:first )

    editable.delete( '_id'           )
    editable.delete( '_type'         )
    editable.delete( 'connection_id' )
    editable.delete( 'created_at'    )
    editable.delete( 'updated_at'    )

    editable.map( &:to_sym )
  end
end