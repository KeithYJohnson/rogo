module ApplicationHelper
   #Takes name of the link, the formbuilder, and the name of the association
  def link_to_add_fields(name, f, association)
    # 1) Build an instance of that association record.  
    # object of the form builder(a question instance), calling association method(answers), taking klass of that(answer model), building a new answer instance
    new_object = f.object.send(association).klass.new
    # Grabbing rubies object id off of this to grab a unique value, to use later
    id = new_object.object_id
    # passing in answers instance, and passing in unique id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render("answers/answer_fields", f: builder)
    end
                                                        # Gives ID and generated field data 
    link_to(name, '#', class: "add-answer-field", data: {id: id, fields: fields.gsub("\n", "")})
  end 
end
