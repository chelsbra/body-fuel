ActiveAdmin.register Province do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :pst_rate, :gst_rate, :hst_rate

end
