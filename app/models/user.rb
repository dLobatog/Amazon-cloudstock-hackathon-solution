class User < AWS::Record::HashModel
  string_attr :id
  string_attr :name
  integer_attr :age
  string_attr :sex
  string_attr :city
  boolean_attr :has_image, :default => false


  def img= image
    self.has_image = true 
    AWS::S3.new.buckets[:images_cloudstock].objects[id].write(image.read)
  end

  def img
    AWS::S3.new.buckets[:images_cloudstock].objects[id].url_for(:read) if has_image
  end

end  
