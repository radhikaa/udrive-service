class User < ActiveRecord::Base
  def save_license(license)
    license = License.new(filename: license.original_filename, content_type: license.content_type, file_contents: license.tempfile.read)
    license.save
    LicensesUser.create(user: self, license: license)
  end
end