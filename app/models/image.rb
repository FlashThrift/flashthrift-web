#
# An image is something the user uploads as part of the item description
# Normally, the user gets only one image, so this wouldn't make sense to
# make a separate class away from the Item class, but in the future we
# may want to allow the user to actually have more than one image.
#
class Image < ActiveRecord::Base
  belongs_to :item
  has_attached_file :image_upload
end
